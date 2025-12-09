open Passe
open Tds
open Exceptions
open Ast
open Type
open Tam
open Code


type t1 = AstPlacement.programme
type t2 = string

let rec analyse_code_expression e =
  match e with

      | AstType.AppelFonction (info, le) ->
        let cle = List.fold_right (fun e acc -> (analyse_code_expression e)^acc) le "" in 

        begin match info_ast_to_info info with
            | InfoFun(nom_fun, _, _) -> cle^(call "SB" nom_fun)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 


    | AstType.Ident (info) ->
        begin match info_ast_to_info info with
          | InfoVar(_,t,dep,reg) -> let taille = getTaille t in 
            load taille dep reg
            
        | InfoConst(_ , va ) -> loadl_int va 
         
          | _ -> failwith "error"
        end

    | AstType.Booleen (b) -> if b then (loadl_int 1) else (loadl_int 0)

    | AstType.Entier (i) -> loadl_int i

    | AstType.Unaire(op, e1) -> 
        if (op = AstType.Numerateur) then (analyse_code_expression e1)^(pop 0 1)
        else (analyse_code_expression e1)^(pop 1 1)

    | AstType.Binaire (op, e1,e2) -> 
        let codeExp1 = analyse_code_expression e1 in
        let codeExp2 = analyse_code_expression e2 in 
        begin match op with
          | AstType.PlusInt -> codeExp1^codeExp2^(subr "IAdd")
          | AstType.PlusRat -> codeExp1^codeExp2^(call "SB" "RAdd")
          | AstType.MultInt -> codeExp1^codeExp2^(subr "IMul")
          | AstType.MultRat -> codeExp1^codeExp2^(call "SB" "RMul")
          | AstType.EquInt -> codeExp1^codeExp2^(subr "IEq")
          | AstType.EquBool -> codeExp1^codeExp2^(subr "IEq")
          | AstType.Inf -> codeExp1^codeExp2^(subr "ILss")
          | AstType.Fraction -> codeExp1^codeExp2^(call "SB" "norm")
          | _ -> failwith "error"
        end
      
let rec analyse_code_instruction i = 
  match i with
    | AstPlacement.Declaration(info,e) ->
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
        codeExp^(call "SB" "rout")
    | AstPlacement.AffichageBool e ->

        let codeExp = analyse_code_expression e in
        codeExp^(subr "BOut")

    | AstPlacement.Conditionnelle (c,bt,be) ->

        let codeExp = analyse_code_expression c in
        let eti_be = getEtiquette() in 
        let end_if = getEtiquette() in
        codeExp ^
        jumpif 0 eti_be ^ 
        analyse_code_bloc bt ^ 
        jump end_if ^
        label eti_be ^
        analyse_code_bloc be ^
        label end_if 
    
    | AstPlacement.TantQue (c, b) -> 

        let codeExp = analyse_code_expression c in 
        let debut = getEtiquette() in 
        let fin_tq = getEtiquette() in
        label debut ^
        codeExp ^
        jumpif 0 fin_tq ^
        analyse_code_bloc b ^ 
        jump debut ^
        label fin_tq

    | AstPlacement.Retour(e,tr,tp) ->
        (analyse_code_expression e)^(return tr tp)
    
    | AstPlacement.Empty -> ""

and analyse_code_bloc (li, _) =
  List.fold_right
    (fun i str -> analyse_code_instruction i ^ str)
    li
    ""


let analyse_code_fonction (AstPlacement.Fonction (info , _, ( li , _))) = 
    (* Pour verifier que si une fonction continet retour*)
    let rec analyse_instruction_retour li =
        (match li with 
            |[] -> false
            |a :: q ->( match a with 
                        | AstPlacement.Retour(_,_,_) -> true
                        | _ -> analyse_instruction_retour q )
        )
    in
    let nom = 
    match info_ast_to_info info with 
        | InfoFun(nom , _, _) -> nom
        | _ -> failwith "error"
    in 
    (* J'ajout ca pour que si une fonction appeler sans retour le programme
     vas stoper pour valider le tesfun5 *)
    let queue = if (analyse_instruction_retour li) then "" else  halt in 
    label nom ^
    (List.fold_right (fun i str -> (analyse_code_instruction i)^str ) li "")^
    queue

let analyser (AstPlacement.Programme (fonctions, prog)) = 
    getEntete() ^  
    (List.fold_right (fun i str -> (analyse_code_fonction i)^str ) fonctions "") ^
    label "main" ^
    analyse_code_bloc prog ^ 
    halt