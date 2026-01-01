open Tds
open Exceptions
open Ast
open Type

type t1 = Ast.AstTds.main
type t2 = Ast.AstType.main

(* Fonction utilitaire pour modifier le type de toute information (variable, pointeur, etc.) *)
(* Cette fonction vérifie si l'information est une variable ou un pointeur, et applique le changement de type correspondant. *)
let modifier_type_toute_info t info =
  match info_ast_to_info info with
  | InfoVar _ -> modifier_type_variable t info
  | InfoPoint _ -> modifier_type_pointer t info
  | _ -> failwith "Erreur interne: tentative de modification de type sur une constante ou fonction"

(* analyse_type_affectable : analyse un affectable et retourne son type *)
(* Si c'est une variable, un pointeur ou une constante, on renvoie le type de l'affectable *)
let rec analyse_type_affectable a est_modification =
  match a with
  | AstTds.IdentAffect info -> 
      begin match info_ast_to_info info with
        | InfoVar (_, t, _, _) -> (AstType.IdentAffect info, t)
        | InfoPoint (_, t, _, _, _) -> (AstType.IdentAffect info, t) 
        | InfoConst _ -> 
            if est_modification then 
              raise (MauvaiseUtilisationIdentifiant "Modification de constante interdite")
            else 
              (AstType.IdentAffect info, Int)  (* Les constantes sont traitées comme des entiers par défaut dans ce contexte *)
        | InfoFun _ -> raise (MauvaiseUtilisationIdentifiant "Tentative d'affectation à une fonction")
      end
  | AstTds.PointerAffect a_sous -> 
      let (na, ta) = analyse_type_affectable a_sous est_modification in
      begin match ta with
        | Pointer_typ t_base -> (AstType.PointerAffect na, t_base)
        | _ -> raise (TypeInattendu (ta, Pointer_typ Undefined))  (* Le type attendu est un pointeur *)
      end

(* analyse_type_expression : analyse une expression et retourne son type et l'expression transformée *)
(* Cette fonction gère différents types d'expressions et vérifie la compatibilité des types. *)
let rec analyse_type_expression e = 

  (* Fonction utilitaire pour obtenir le type d'une opération unaire *)
  let type_of_unaire op =
  match op with
  | AstSyntax.Numerateur -> AstType.Numerateur
  | AstSyntax.Denominateur -> AstType.Denominateur
  | AstSyntax.Address -> AstType.Address 
  in 

  match e with
    (* Appel de fonction : analyse les arguments et vérifie leur compatibilité avec la fonction appelée *)
    |AstTds.AppelFonction (info, le) ->
          let nv_le = List.map analyse_type_expression le in
          let l_typ = List.map (fun (_,  t)-> t) nv_le in
          let l_exps = List.map (fun (e, _)-> e) nv_le in

          begin match info_ast_to_info info with
            | InfoFun(_, t, ln) -> 
                (* Vérification de la compatibilité des paramètres de la fonction *)
                if (not (est_compatible_list l_typ ln)) && (not(t = Void)) then 
                  raise (TypesParametresInattendus(l_typ, ln))
               else (AstType.AppelFonction(info, l_exps),t)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
          end 

    (* Accès à un affectable : renvoie l'affectable et son type *)
    |AstTds.Acces a -> 
        let (na, nt) = analyse_type_affectable a false in 
        (AstType.Acces(na), nt)

    (* Expression unaire : analyse et applique l'opération unaire *)
    |AstTds.Unaire(op, e1) -> 
        let (ne, t) = analyse_type_expression e1 in
        if (op = Address) then 
          match ne with 
              | AstType.Acces (AstType.IdentAffect _) -> 
                      (AstType.Unaire(AstType.Address, ne), Pointer_typ t)  (* L'adresse d'une variable retourne un pointeur *)
              | _ -> raise (MauvaiseUtilisationIdentifiant "On ne peut prendre l'adresse que d'une variable")
        else 
          if (est_compatible t Rat ) then 
              (AstType.Unaire(type_of_unaire op, ne), Int)  (* On applique l'opération de type numerateur ou dénominateur si compatible *)
          else 
              raise (TypeInattendu (t ,Rat))

    (* Expression binaire : analyse et applique l'opération binaire *)
    |AstTds.Binaire(op, e1,e2) ->
          let (ne1, t1) = analyse_type_expression e1 in
          let (ne2, t2) = analyse_type_expression e2 in 
          let erreur () = raise (TypeBinaireInattendu(op,t1,t2)) in
          begin match op with
            (* Opérations arithmétiques : vérification des types des opérandes *)
            | AstSyntax.Plus -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(PlusInt, ne1, ne2),Int)
                | Rat, Rat -> (AstType.Binaire(PlusRat, ne1, ne2),Rat)
                | _ -> erreur ()
              end
            | AstSyntax.Mult -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(MultInt, ne1, ne2),Int)
                | Rat, Rat -> (AstType.Binaire(MultRat, ne1, ne2),Rat)
                | _ -> erreur ()
              end
            (* Opération d'égalité : gestion des types compatibles pour l'égalité *)
            | AstSyntax.Equ -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(EquInt, ne1, ne2),Bool)
                | Bool, Bool -> (AstType.Binaire(EquBool, ne1, ne2),Bool)
                | Pointer_typ _, Undefined -> (AstType.Binaire(EquRef, ne1, ne2), Bool)
                | Undefined, Pointer_typ _ -> (AstType.Binaire(EquRef, ne1, ne2), Bool)
                | Pointer_typ t_gauche, Pointer_typ t_droit when est_compatible t_gauche t_droit -> 
                    (AstType.Binaire(EquRef, ne1, ne2), Bool)
                | Undefined, Undefined -> (AstType.Binaire(EquRef, ne1, ne2), Bool)
                | Type_enum t1 , Type_enum t2 when (t1 = t2) -> (AstType.Binaire(EquEnu, ne1, ne2), Bool)
                | _ -> erreur ()
              end
            (* Comparaison de fractions : vérification de compatibilité entre types Int *)
            | AstSyntax.Fraction -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(Fraction, ne1, ne2),Rat)
                | _ -> erreur ()
              end
            (* Comparaison de type inférieur : vérification de types compatibles pour Inf *)
            | AstSyntax.Inf -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(Inf, ne1, ne2),Bool)
                | _ -> erreur ()
              end
          end

      (* Autres types d'expressions simples : booléen, entier, null et allocation mémoire *)
      |AstTds.Booleen b -> (AstType.Booleen(b), Bool)
      |AstTds.Entier i -> (AstType.Entier(i), Int)
      |AstTds.Null -> (AstType.Null, Undefined)
      | AstTds.New t -> 
        (AstType.New t, Pointer_typ t)


(* analyse_type_instruction : analyse une instruction et retourne le type de l'instruction *)
(* Chaque type d'instruction est analysé pour vérifier la compatibilité des types *)
let rec analyse_type_instruction i =
  begin match i with 
    (* Déclaration : on vérifie la compatibilité du type de la variable et de l'expression *)
    | AstTds.Declaration(t, info, e) ->
        let (ne, nt) = analyse_type_expression e in 
        let compatible = 
          if est_compatible nt t then true 
          else match (t, nt) with
               | (Pointer_typ _, Undefined) -> true (* Autorise: int * p = null *)
               | _ -> false
        in

        if compatible then begin
          modifier_type_toute_info t info;  (* Mise à jour du type de l'information associée à la variable *)
          AstType.Declaration(info, ne)
        end
        else
          raise (TypeInattendu(nt, t))

    | AstTds.Affectation(a , e) -> 
        (* Analyse de l’expression affectée *)
        let (ne, te) = analyse_type_expression e in 
        (* Analyse de l’affectable (avec modification autorisée) *)
        let (na, ta) = analyse_type_affectable a true in 
        
        (* Vérification de la compatibilité des types *)
        if (est_compatible te ta) then 
           AstType.Affectation(na , ne)
        else
          (* Cas particulier : affectation d’un pointeur avec null *)
          begin match (ta, te) with 
            | (Pointer_typ _, Undefined) -> AstType.Affectation(na , ne)
            | _ -> raise (TypeInattendu(te, ta))   
          end

    | AstTds.Affichage e ->
        (* Analyse de l’expression à afficher *)
        let (ne, typ) = analyse_type_expression e in 
        (* Sélection de l’instruction d’affichage selon le type *)
        begin match typ with
          | Int -> AstType.AffichageInt(ne)
          | Bool -> AstType.AffichageBool(ne)
          | Rat -> AstType.AffichageRat(ne)
          | _ -> raise (TypeInattendu(Undefined, Int))
        end 
    
    | AstTds.Conditionnelle(c,t,e) -> 
        (* Analyse de la condition *)
        let (nc, typ) = analyse_type_expression c in 
        (* Analyse des blocs then et else *)
        let nt = analyse_type_bloc t in 
        let ne = analyse_type_bloc e in
        (* La condition doit être booléenne *)
        if (est_compatible typ Bool) then 
          AstType.Conditionnelle(nc ,nt, ne)
        else 
          raise (TypeInattendu(typ, Bool))

    | AstTds.TantQue (c,b) -> 
        (* Analyse de la condition *)
        let (nc , typ) = analyse_type_expression c in 
        (* Analyse du bloc de la boucle *)
        let nb = analyse_type_bloc b in 
        (* La condition doit être booléenne *)
        if (est_compatible typ Bool) then 
          AstType.TantQue(nc ,nb)
        else 
          raise (TypeInattendu(typ, Bool))

    | AstTds.Retour(e , ia) -> 
        (* Analyse de l’expression retournée *)
        let (ne, t) = analyse_type_expression e in 
        begin match info_ast_to_info ia with
          (* Vérification du type de retour de la fonction *)
          | InfoFun(_,ty,_) -> 
              if (est_compatible t ty) then 
                AstType.Retour(ne, ia)
              else 
                (* Cas particulier : retour d’un pointeur null *)
                match (ty, t) with
                | (Pointer_typ _, Undefined) ->  AstType.Retour(ne, ia)
                | _ -> raise (TypeInattendu(t, ty))
          | _ -> raise (MauvaiseUtilisationIdentifiant "Not Func")
          end

    | AstTds.Empty -> 
        (* Instruction vide *)
        AstType.Empty

    | AstTds.RetourVoid(ia) ->
        (* Vérification que la fonction est bien de type void *)
        begin match info_ast_to_info ia with
          | InfoFun(_,Void,_) -> AstType.RetourVoid(ia)
          | _ -> raise (MauvaiseUtilisationIdentifiant "Not Func")
        end 

    | AstTds.AppelVoid(info, le) -> 
        (* Analyse des paramètres *)
        let nv_le = List.map analyse_type_expression le in
        let l_typ = List.map (fun (_,  t)-> t) nv_le in
        let l_exps = List.map (fun (e, _)-> e) nv_le in

        (* Vérification que la fonction appelée est void *)
        begin match info_ast_to_info info with
          | InfoFun(_, Void, ln) -> 
              if (not (est_compatible_list l_typ ln)) then 
                raise (TypesParametresInattendus(l_typ, ln))
              else 
                AstType.AppelVoid(info, l_exps)
          | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 
  end 

(* Analyse d’un bloc : application de l’analyse de type à chaque instruction *)
and analyse_type_bloc li = 
  List.map analyse_type_instruction li 

  
(* analyse_type_fonction : analyse une fonction *)
(* Vérifie les types des paramètres, du corps et du type de retour *)
let analyse_type_fonction (AstTds.Fonction(t,info,lp,li)) =
  let l_typ = List.map (fun (t,_) -> t) lp in 
  let l_info =  List.map (fun (_,i) -> i) lp in 

  (* Mise à jour du type de la fonction *)
  modifier_type_fonction t l_typ info;

  (* Analyse du corps *)
  let nli = analyse_type_bloc li in

  (* Vérification finale des paramètres *)
  match info_ast_to_info info with 
    | InfoFun(_,_,lt) -> 
        if (est_compatible_list lt l_typ) then
          AstType.Fonction(info,l_info,nli)
        else
          raise (TypesParametresInattendus(l_typ, lt))   
    | _ -> raise (MauvaiseUtilisationIdentifiant("error"))      

(* Analyse d’une liste de fonctions *)
let analyse_type_fonctions lf =
  List.map analyse_type_fonction lf
    
(* Analyse d’un programme *)
let analyse_type_programme (AstTds.Programme(fonctions, prog)) = 
  (* Préparation des types de fonctions avant analyse *)
  let preparer_fonction (AstTds.Fonction(t,info,lp,_)) =
    let l_typ = List.map (fun (t,_) -> t) lp in
    modifier_type_fonction t l_typ info
  in
  List.iter preparer_fonction fonctions;

  (* Analyse du bloc principal *)
  let p = analyse_type_bloc prog in 

  (* Analyse des fonctions *)
  let lf = analyse_type_fonctions fonctions in 
  AstType.Programme(lf, p)
  
(* Analyse d’un énumérateur *)
let analyse_type_enum (AstTds.Enumerateur(nom,l_enum)) = 
  AstType.Enumerateur(nom, l_enum)

(* Fonction principale de l’analyse de type *)
let analyser (AstTds.Main (l_enum,AstTds.Programme (fonctions,prog))) =
  let ne = List.map analyse_type_enum l_enum in
  let np = analyse_type_programme (AstTds.Programme(fonctions,prog)) in
  AstType.Main (ne,np)

