open Tds
open Exceptions
open Ast
open Type

type t1 = Ast.AstTds.main
type t2 = Ast.AstType.main

(* Fonction utilitaire pour modifier le type de toute information (variable, pointeur, etc.) *)
let modifier_type_toute_info t info =
  match info_ast_to_info info with
  | InfoVar _ -> modifier_type_variable t info
  | InfoPoint _ -> modifier_type_pointer t info
  | _ -> failwith "Erreur interne: tentative de modification de type sur une constante, fonction ou enum"

(* analyse_type_affectable : analyse un affectable et retourne son type *)
(* Paramètre est_modification : booléen pour savoir si on est en lecture ou écriture (constante) *)
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
              (AstType.IdentAffect info, Int)
        | InfoFun _ -> raise (MauvaiseUtilisationIdentifiant "Tentative d'affectation à une fonction")
        | InfoEnum _ -> raise (MauvaiseUtilisationIdentifiant "Tentative d'affectation à un Enum")
      end
  | AstTds.PointerAffect a_sous -> 
      let (na, ta) = analyse_type_affectable a_sous est_modification in
      begin match ta with
        | Pointer_typ t_base -> (AstType.PointerAffect na, t_base)
        | _ -> raise (TypeInattendu (ta, Pointer_typ Undefined))
      end

(* analyse_type_expression : analyse une expression et retourne son type et l'expression transformée *)
let rec analyse_type_expression e = 

  let type_of_unaire op =
  match op with
  | AstSyntax.Numerateur -> AstType.Numerateur
  | AstSyntax.Denominateur -> AstType.Denominateur
  | AstSyntax.Address -> AstType.Address 
  in 

  match e with
    (* Appel de fonction *)
    | AstTds.AppelFonction (info, le) ->
        let nv_le = List.map analyse_type_expression le in
        (* Vérification types paramètres et mode de passage (ref/valeur) *)
        let l_typ_args = List.map (fun (e, t) -> 
            match e with 
            | AstType.Reference _ -> (t, true) 
            | _ -> (t, false)
        ) nv_le in
        
        let l_exps = List.map (fun (e, _)-> e) nv_le in

        begin match info_ast_to_info info with
        | InfoFun(_, t_ret, params_expected) -> 
            let est_compatible_et_mode (t_arg, is_ref_arg) (t_param, is_ref_param) =
                est_compatible t_arg t_param && (is_ref_arg = is_ref_param)
            in

            if List.length l_typ_args <> List.length params_expected then
                 raise (TypesParametresInattendus (List.map fst l_typ_args, List.map fst params_expected))
            else
                if List.for_all2 est_compatible_et_mode l_typ_args params_expected then
                    (AstType.AppelFonction(info, l_exps), t_ret)
                else
                    raise (TypesParametresInattendus (List.map fst l_typ_args, List.map fst params_expected))
        
        | _ -> raise (MauvaiseUtilisationIdentifiant "Cet identifiant n'est pas une fonction")
        end

    (* Accès variable/pointeur *)
    |AstTds.Acces a -> 
        let (na, nt) = analyse_type_affectable a false in 
        (AstType.Acces(na), nt)

    (* Opérations unaires *)
    |AstTds.Unaire(op, e1) -> 
        let (ne, t) = analyse_type_expression e1 in
        if (op = Address) then 
          match ne with 
              | AstType.Acces (AstType.IdentAffect _) -> 
                      (AstType.Unaire(AstType.Address, ne), Pointer_typ t)
              | _ -> raise (MauvaiseUtilisationIdentifiant "On ne peut prendre l'adresse que d'une variable")
        else 
          if (est_compatible t Rat ) then 
              (AstType.Unaire(type_of_unaire op, ne), Int)
          else 
              raise (TypeInattendu (t ,Rat))

    (* Opérations binaires *)
    |AstTds.Binaire(op, e1,e2) ->
          let (ne1, t1) = analyse_type_expression e1 in
          let (ne2, t2) = analyse_type_expression e2 in 
          let erreur () = raise (TypeBinaireInattendu(op,t1,t2)) in
          begin match op with
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
            | AstSyntax.Fraction -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(Fraction, ne1, ne2),Rat)
                | _ -> erreur ()
              end
            | AstSyntax.Inf -> begin
                match (t1,t2) with
                | Int, Int -> (AstType.Binaire(Inf, ne1, ne2),Bool)
                | _ -> erreur ()
              end
          end

      |AstTds.Booleen b -> (AstType.Booleen(b), Bool)
      |AstTds.Entier i -> (AstType.Entier(i), Int)
      |AstTds.Null -> (AstType.Null, Undefined)
      | AstTds.New t -> (AstType.New t, Pointer_typ t)
      | AstTds.Reference(info) -> 
        let t = match info_ast_to_info info with
          | InfoVar (_, t, _, _) -> t
          | _ -> failwith "Erreur interne: référence sur non-variable" 
        in
        (AstType.Reference(info), t)


(* analyse_type_instruction : analyse une instruction et retourne le type de l'instruction *)
let rec analyse_type_instruction i =
  begin match i with 
    (* Déclaration : vérification de compatibilité type variable / expression *)
    | AstTds.Declaration(t, info, e) ->
        let (ne, nt) = analyse_type_expression e in 
        let compatible = 
          if est_compatible nt t then true 
          else match (t, nt) with
               | (Pointer_typ _, Undefined) -> true (* Pointer = Null autorisé *)
               | _ -> false
        in

        if compatible then begin
          modifier_type_toute_info t info; (* Mise à jour du type dans la TDS *)
          AstType.Declaration(info, ne)
        end
        else
          raise (TypeInattendu(nt, t))

    (* Affectation *)
    | AstTds.Affectation(a , e) -> 
        let (ne, te) = analyse_type_expression e in 
        let (na, ta) = analyse_type_affectable a true in 
        
        if (est_compatible te ta) then 
           AstType.Affectation(na , ne)
        else
          begin match (ta, te) with 
            | (Pointer_typ _, Undefined) -> AstType.Affectation(na , ne)
            | _ -> raise (TypeInattendu(te, ta))   
          end

    (* Affichage : surcharge selon le type *)
    | AstTds.Affichage e ->
        let (ne, typ) = analyse_type_expression e in 
        begin match typ with
          | Int -> AstType.AffichageInt(ne)
          | Bool -> AstType.AffichageBool(ne)
          | Rat -> AstType.AffichageRat(ne)
          | _ -> raise (TypeInattendu(Undefined, Int))
        end 
    
    (* Conditionnelle : test booléen *)
    | AstTds.Conditionnelle(c,t,e) -> 
        let (nc, typ) = analyse_type_expression c in 
        let nt = analyse_type_bloc t in 
        let ne = analyse_type_bloc e in
        if (est_compatible typ Bool) then 
          AstType.Conditionnelle(nc ,nt, ne)
        else 
          raise (TypeInattendu(typ, Bool))

    (* Boucle *)
    | AstTds.TantQue (c,b) -> 
        let (nc , typ) = analyse_type_expression c in 
        let nb = analyse_type_bloc b in 
        if (est_compatible typ Bool) then 
          AstType.TantQue(nc ,nb)
        else 
          raise (TypeInattendu(typ, Bool))

    (* Retour fonction *)
    | AstTds.Retour(e , ia) -> 
        let (ne, t) = analyse_type_expression e in 
        begin match info_ast_to_info ia with
          | InfoFun(_,ty,_) -> 
              if (est_compatible t ty) then 
                AstType.Retour(ne, ia)
              else 
                begin match (ty, t) with
                | (Pointer_typ _, Undefined) ->  AstType.Retour(ne, ia)
                | _ -> raise (TypeInattendu(t, ty))
                end
          | InfoVar _ | InfoConst _ | InfoPoint _ | InfoEnum _ -> 
              raise (MauvaiseUtilisationIdentifiant "Le retour doit être dans une fonction")
          end

    | AstTds.Empty -> AstType.Empty

    (* Retour procédure *)
    | AstTds.RetourVoid(ia) ->
        begin match info_ast_to_info ia with
          | InfoFun(_,Void,_) -> AstType.RetourVoid(ia)
          | _ -> raise (MauvaiseUtilisationIdentifiant "Cette fonction ne doit pas retourner void ou n'est pas une fonction")
        end 

    (* Appel procédure *)
    | AstTds.AppelVoid(info, le) -> 
        let nv_le = List.map analyse_type_expression le in
        let l_typ_args = List.map (fun (e, t) -> 
            match e with 
            | AstType.Reference _ -> (t, true) 
            | _ -> (t, false)
        ) nv_le in
        
        let l_exps = List.map (fun (e, _)-> e) nv_le in

        begin match info_ast_to_info info with
          | InfoFun(_, Void, params_expected) -> 
              let est_compatible_et_mode (t_arg, is_ref_arg) (t_param, is_ref_param) =
                  Type.est_compatible t_arg t_param && (is_ref_arg = is_ref_param)
              in

              if List.length l_typ_args <> List.length params_expected then
                 raise (TypesParametresInattendus (List.map fst l_typ_args, List.map fst params_expected))
              else
                  if List.for_all2 est_compatible_et_mode l_typ_args params_expected then 
                    AstType.AppelVoid(info, l_exps)
                  else 
                    raise (TypesParametresInattendus(List.map fst l_typ_args, List.map fst params_expected))
          
          | InfoFun _ -> raise (MauvaiseUtilisationIdentifiant "Une fonction retournant une valeur ne peut pas être appelée comme une procédure")
          | _ -> raise (MauvaiseUtilisationIdentifiant "Cet identifiant n'est pas une procédure")
        end
  end 

and analyse_type_bloc li = 
  List.map analyse_type_instruction li 

  
(* analyse_type_fonction : analyse une fonction *)
(* Mise à jour de la signature de la fonction dans la TDS et analyse du corps *)
let analyse_type_fonction (AstTds.Fonction(t,info,lp,li)) =
  let l_typ = List.map (fun (t,_,r) -> (t,r)) lp in 
  let l_info =  List.map (fun (_,i,_) -> i) lp in 

  modifier_type_fonction t l_typ info;

  let nli = analyse_type_bloc li in

  match info_ast_to_info info with 
    | InfoFun(_,_,lt) -> 
        let est_compatible_et_mode (t_arg, is_ref_arg) (t_param, is_ref_param) =
                  Type.est_compatible t_arg t_param && (is_ref_arg = is_ref_param)
        in
          
        if (List.for_all2 est_compatible_et_mode lt l_typ) then
          AstType.Fonction(info,l_info,nli)
        else
          let l_t = List.map (fun (t, _)-> t) l_typ in
          let l_tt = List.map (fun (t, _)-> t) lt in
          raise (TypesParametresInattendus(l_t, l_tt))   
    | _ -> raise (MauvaiseUtilisationIdentifiant("error"))      

(* Analyse d’un programme *)
let analyse_type_programme (AstTds.Programme(fonctions, prog)) = 
  (* On prépare les signatures avant d'analyser les corps pour gérer la récursivité mutuelle *)
  let preparer_fonction (AstTds.Fonction(t,info,lp,_)) =
    let l_typ_et_ref = List.map (fun (ty, _, is_ref) -> (ty, is_ref)) lp in
    modifier_type_fonction t l_typ_et_ref info
  in
  List.iter preparer_fonction fonctions;

  let p = analyse_type_bloc prog in 
  let lf = List.map analyse_type_fonction fonctions in 
  AstType.Programme(lf, p)
  
(* Analyse d’un énumérateur *)
let analyse_type_enum (AstTds.Enumerateur(nom,l_enum)) = 
  AstType.Enumerateur(nom, l_enum)

(* Fonction principale de l’analyse de type *)
let analyser (AstTds.Main (l_enum,AstTds.Programme (fonctions,prog))) =
  let ne = List.map analyse_type_enum l_enum in
  let np = analyse_type_programme (AstTds.Programme(fonctions,prog)) in
  AstType.Main (ne,np)