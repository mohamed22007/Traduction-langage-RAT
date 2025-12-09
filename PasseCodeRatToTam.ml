open Passe
open Tds
open Exceptions
open Ast
open Type
open Tam
open Code


type t1 = AstType.programme
type t2 = AstPlacement.programme

let rec analyse_code_expression e =
  match e with
(*
      | ASTPlacement.AppelFonction (info, le) ->
        let cle = List.fold_right (fun e acc -> ((analyse_code_expression e)^acc) le "") in 

        begin match info_ast_to_info info with
            | InfoFun(nom_fun, _, _) -> cle^(call "SB" nom_fun)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 
*)

    | AstPlacement.Ident (info) ->
        begin match info_ast_to_info info with
          | InfoVar(_,_,dep,reg) -> load taille dep reg
          | _ -> failwith "error"
        end

    | AstPlacement.Booleen (b) -> if b then (loadl_int 1) else (loadl_int 0)

    | AstPlacement.Entier (i) -> loadl_int i

    | AstPlacement.Unaire(op, e1) -> 
        if (type_of_unaire op = Numerateur) then (analyse_code_expression e1)^(pop 0 1)
        else (analyse_code_expression e1)^(pop 1 1)

    | AstPlacement.Binaire (op, e1,e2) -> 
        let codeExp1 = analyse_code_expression e1 in
        let codeExp2 = analyse_code_expression e2 in 
        let erreur () = raise (TypeBinaireInattendu(op,t1,t2)) in
        begin match op with
          | AstType.PlusInt -> codeExp1^codeExp2^(subr "IAdd")
          | AstType.PlusRat -> codeExp1^codeExp2^(radd())
          | AstType.MultInt -> codeExp1^codeExp2^(subr "IMul")
          | AstType.MultRat -> codeExp1^codeExp2^(rmul())
          | AstType.EquInt -> codeExp1^codeExp2^(subr "IEq")
          | AstType.EquBool -> TO DO
          | AstType.Inf -> codeExp1^codeExp2^(subr "ILeq")
          | AstType.Fraction -> codeExp1^codeExp2^(norm())
      
let rec analyse_code_instruction i = 
  match i with
    | AstPlacement.Declaraton(info,e) ->
        let InfoVar(_,t,dep,reg) = (info_ast_to_info info) in 
        let taille = getTaille t in
        let codeExp = analyse_code_expression e in
        (push taille)^codeExp^(store taille dep reg) 
    | AstPlacement.Affectation(info,e) ->
        let InfoVar(_,t,dep,reg) = (info_ast_to_info info) in 
        let taille = getTaille t in
        let codeExp = analyse_code_expression e in
        codeExp^(store taille dep reg) 
    | AstPlacement.AffichageInt e ->
        let codeExp = analyse_code_expression e in
        codeExp^(subr "IOut") 
    | AstPlacement.AffichageRat e ->
        let codeExp = analyse_code_expression e in
        codeExp^(call "(SB)" "rout")
    | AstPlacement.AffichageBool e ->
        let codeExp = analyse_code_expression e in
        codeExp^(subr "BOut")
    | AstPlacement.Conditionnelle (c,bt,be) ->
        let codeExp = analyse_code_expression c in
        let codeBloc = analyse_code_bloc be in
        codeExp^(jumpif) TODO
    
and analyse_code_bloc (li, taille ) = TO DO

let analyse_code_fonction (Fonction (info , , ( li , ))) = TO DO

let analyser (Programme (fonctions, prog)) = TO DO