open Tds
open Exceptions
open Ast
open Type

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme

(* analyse_type_expression : AstTds.expression -> AstType.expression * type *)
(* Patamétte e : expresion a analyser *)
(* erreurs si types non compatible *)

let rec analyse_type_expression e = 

  let type_of_unaire op =
  match op with
  | AstSyntax.Numerateur -> AstType.Numerateur
  | AstSyntax.Denominateur -> AstType.Denominateur
  in 

  match e with
    |AstTds.AppelFonction (info, le) -> 
          let nv_le = List.map analyse_type_expression le in
          let l_typ = List.map (fun (_,  t)-> t) nv_le in
          let l_exps = List.map (fun (e, _)-> e) nv_le in

          begin match info_ast_to_info info with
            | InfoFun(_, t, ln) -> if (not (est_compatible_list l_typ ln)) then 
                                        raise (TypesParametresInattendus(l_typ, ln))
                                   else (AstType.AppelFonction(info, l_exps),t)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
                                  end 
    |AstTds.Ident info -> 
          let ty = match info_ast_to_info info with
            |InfoConst _ -> Int
            |InfoFun _ -> raise (MauvaiseUtilisationIdentifiant "utilisation d'une fonction comme valeur")
            |InfoVar (_,t,_,_) -> t
            | _-> Undefined
          in  
          (AstType.Ident (info), ty)
    |AstTds.Unaire(op, e1) -> 

          let (ne, t) = analyse_type_expression e1 in
          if (est_compatible t Rat ) then 
              (AstType.Unaire(type_of_unaire op, ne), Int)
          else 
              raise (TypeInattendu (t ,Rat) )
    |AstTds.Binaire(op, e1,e2) ->
          let (ne1, t1) = analyse_type_expression e1 in
          let (ne2, t2)= analyse_type_expression e2 in 
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


(* analyse_type_instruction : AstTds.instruction -> AstType.instruction *)
(* Patamétte i : instriction *)
(* erreurs si types non compatible *)
let rec analyse_type_instruction i =
  begin match i with 
    | AstTds.Declaration(t,info, e) ->
        let (ne , nt) = analyse_type_expression e in 
          if (est_compatible nt t) then begin
            modifier_type_variable t info  ;
            AstType.Declaration(info, ne)
          end
          else
            raise (TypeInattendu(nt, t)) 
    | AstTds.Affectation(info , e) -> 
        let (ne, typ) = analyse_type_expression e in 
        let ti = match info_ast_to_info info with
                    |InfoVar(_,t,_,_) -> t 
                    | InfoConst _ -> raise (MauvaiseUtilisationIdentifiant "Constante non affectable")
                    |InfoFun _ -> raise (MauvaiseUtilisationIdentifiant("Variable !"))
        in 
        if (est_compatible ti typ) then AstType.Affectation(info, ne) 
        else raise (TypeInattendu(typ, ti))

    | AstTds.Affichage e ->
        let (ne, typ) = analyse_type_expression e in 
        begin match typ with
          | Int -> AstType.AffichageInt(ne)
          | Bool -> AstType.AffichageBool(ne)
          | Rat -> AstType.AffichageRat(ne)
          | _ -> raise (TypeInattendu(Undefined, Int))
        end 
    
    | AstTds.Conditionnelle(c,t,e) -> 
        let (nc, typ) = analyse_type_expression c in 
        let nt = analyse_type_bloc t in 
        let ne = analyse_type_bloc e in
        if (est_compatible typ Bool) then AstType.Conditionnelle(nc ,nt, ne)
        else raise (TypeInattendu(typ, Bool))

    | AstTds.TantQue (c,b) -> 
        let (nc , typ) = analyse_type_expression c in 
        let nb = analyse_type_bloc b in 
        if (est_compatible typ Bool) then AstType.TantQue(nc ,nb)
        else raise (TypeInattendu(typ, Bool))

    | AstTds.Retour(e , ia) -> 
        let (ne, t) = analyse_type_expression e in 
        begin match info_ast_to_info ia with
          |InfoFun(_,ty,_) -> if (est_compatible t ty) then AstType.Retour(ne, ia)
                              else raise (TypeInattendu(t, ty))
          | _ -> raise (MauvaiseUtilisationIdentifiant "Not Func")
          end
    | AstTds.Empty -> AstType.Empty


  end 

and analyse_type_bloc li = 
  List.map (fun i -> analyse_type_instruction i) li 

  
(* analyse_type_fonction : AstTds.fonction -> AstType.fonction  *)
(* erreurs si types non compatible *)
let analyse_type_fonction (AstTds.Fonction(t,info,lp,li)) =
  let l_typ = List.map (fun (t,_) -> t) lp in 
  let l_info =  List.map (fun (_,i) -> i) lp in 
  modifier_type_fonction t l_typ info;
  let nli = analyse_type_bloc li in
  match info_ast_to_info info with 
    |InfoFun(_,_,lt) -> 
      if (est_compatible_list lt l_typ) then
          AstType.Fonction(info,l_info,nli)
      else
        raise (TypesParametresInattendus(l_typ, lt))   
    | _ -> raise (MauvaiseUtilisationIdentifiant("error"))      

(* analyse_type_fonctions : AstTds.fonction list -> AstType.fonction list *)
(* Patamétte lf : liste des fonctions *)
(* erreurs si types non compatible *)
let analyse_type_fonctions lf =
  List.map analyse_type_fonction lf
      

(* analyse : AstTds.Programme -> AstType.Programme  *)
(* Patamétte fonctions : fonctions en programmes *)
(** Paramtre prog : bloc principale *)
(* erreurs si types non compatible *)
let analyser (AstTds.Programme(fonctions, prog)) = 
  let preparer_fonction (AstTds.Fonction(t,info,lp,_)) =
    let l_typ = List.map (fun (t,_) -> t) lp in
    modifier_type_fonction t l_typ info
  in
  List.iter preparer_fonction fonctions;
  let p = analyse_type_bloc(prog) in 
  let lf = analyse_type_fonctions fonctions in 
  AstType.Programme(lf, p)

    
