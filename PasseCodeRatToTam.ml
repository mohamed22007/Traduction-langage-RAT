open Passe
open Tds
open Exceptions
open Ast
open Type
open Tam
open Code

type t1 = AstPlacement.main
type t2 = string


let est_reference reg = (reg = "LBRef")

let get_vrai_registre reg = if reg = "LBRef" then "LB" else reg


let get_type_info info =
  match info_ast_to_info info with
  | InfoVar (_, t, _, _) -> t
  | InfoPoint (_, t, _, _, _) -> t
  | InfoConst _ -> Int
  | _ -> failwith "Erreur interne code : pas de type"

let get_info_data info =
  match info_ast_to_info info with
  | InfoVar (_, t, dep, reg) -> (getTaille t, dep, reg)
  | InfoPoint (_, t, dep, reg, _) -> (getTaille t, dep, reg)
  | _ -> failwith "Erreur interne code : info invalide"

let rec get_type_affectable a =
  match a with
  | AstType.IdentAffect info -> get_type_info info
  | AstType.PointerAffect pa ->
      match get_type_affectable pa with
      | Pointer_typ t -> t
      | _ -> failwith "Erreur code : Déréférencement non pointeur"

let get_taille_affectable_type a = 
  match a with
  | AstType.IdentAffect info -> getTaille (get_type_info info)
  | AstType.PointerAffect pa -> 
      let t_ptr = get_type_affectable pa in
      match t_ptr with
      | Pointer_typ t_val -> getTaille t_val
      | _ -> failwith "Erreur : déréférencement d'un non-pointeur"


let rec analyse_code_affectable_val a =
  match a with
  | AstType.IdentAffect info -> 
      begin match info_ast_to_info info with
      | InfoVar (_, _, valeur, "ENUM") -> 
          loadl_int valeur
      | InfoVar (_, t, dep, reg) -> 
          if est_reference reg then
             let vrai_reg = get_vrai_registre reg in
             let taille = getTaille t in
             (load 1 dep vrai_reg) ^ (loadi taille)
          else
             load (getTaille t) dep reg

      | InfoPoint (_, t, dep, reg, _) -> 
          load (getTaille t) dep reg
      | InfoConst (_, valeur) -> 
          loadl_int valeur
      | _ -> failwith "Erreur interne : Info invalide dans affectable_val"
      end
  | AstType.PointerAffect pa ->
      let taille_valeur_pointee = get_taille_affectable_type a in
      (analyse_code_affectable_val pa) ^ (loadi taille_valeur_pointee)


let rec analyse_code_affectable_addr a =
  match a with
  | AstType.IdentAffect info ->
      let (_, dep, reg) = get_info_data info in
      if est_reference reg then
         let vrai_reg = get_vrai_registre reg in
         load 1 dep vrai_reg
      else
         loada dep reg
  | AstType.PointerAffect pa ->
      analyse_code_affectable_val pa


let rec analyse_code_expression e =
  match e with
    | AstType.AppelFonction (info, le) ->
        let cle = List.fold_right (fun e acc -> (analyse_code_expression e)^acc) le "" in 
        begin match info_ast_to_info info with
            | InfoFun(nom_fun, _, _) -> cle^(call "SB" nom_fun)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 

    | AstType.Acces a ->
        analyse_code_affectable_val a

    | AstType.Booleen (b) -> if b then (loadl_int 1) else (loadl_int 0)
    | AstType.Entier (i) -> loadl_int i
    | AstType.Null -> loadl_int 0 

    | AstType.New t -> 
        let taille = getTaille t in
        (loadl_int taille) ^ (subr "MAlloc")
    
    | AstType.Reference info ->
        begin match info_ast_to_info info with
        | InfoVar(_, _, dep, reg) ->
            if est_reference reg then
                let vrai_reg = get_vrai_registre reg in
                load 1 dep vrai_reg
            else
                loada dep reg
        | _ -> failwith "Erreur : Reference sur autre chose qu'une variable"
        end

    | AstType.Unaire(op, e1) -> 
        begin match op with
        | AstType.Numerateur -> (analyse_code_expression e1)^(pop 0 1)
        | AstType.Denominateur -> (analyse_code_expression e1)^(pop 1 1)
        | AstType.Address -> 
            begin match e1 with
            | AstType.Acces a -> analyse_code_affectable_addr a
            | _ -> failwith "Erreur code : on ne peut prendre l'adresse que d'une variable"
            end
        end

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
          | AstType.EquRef -> codeExp1^codeExp2^(subr "IEq")
          | AstType.EquEnu -> codeExp1^codeExp2^(subr "IEq")
          | _ -> failwith "error"
        end


let rec analyse_code_instruction i = 
  match i with
    | AstPlacement.Declaration(info,e) ->
        let (taille, dep, reg) = get_info_data info in 
        let codeExp = analyse_code_expression e in
        (push taille)^codeExp^(store taille dep reg)

    (* Dans analyse_code_instruction *)

| AstPlacement.Affectation(a, e) ->
    let codeExp = analyse_code_expression e in
    begin match a with
    | AstType.IdentAffect info ->
        let (taille, dep, reg) = get_info_data info in
        if est_reference reg then
            let vrai_reg = get_vrai_registre reg in
            codeExp ^ (load 1 dep vrai_reg) ^ (storei taille)
        else
            codeExp ^ (store taille dep reg)

    | AstType.PointerAffect _ ->
        let taille = get_taille_affectable_type a in
        codeExp ^ (analyse_code_affectable_addr a) ^ (storei taille)
    end

    | AstPlacement.AffichageInt e -> (analyse_code_expression e)^(subr "IOut")
    | AstPlacement.AffichageRat e -> (analyse_code_expression e)^(call "SB" "rout")
    | AstPlacement.AffichageBool e -> (analyse_code_expression e)^(subr "BOut")

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

    | AstPlacement.AppelVoid (info, le) ->
        let cle = List.fold_right (fun e acc -> (analyse_code_expression e)^acc) le "" in 
        begin match info_ast_to_info info with
            | InfoFun(nom_fun, _, _) -> cle^(call "SB" nom_fun)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 

    | AstPlacement.RetourVoid(tp) ->
        (return 0 tp)


and analyse_code_bloc (li, _) =
  List.fold_right
    (fun i str -> analyse_code_instruction i ^ str)
    li
    ""


let analyse_code_fonction (AstPlacement.Fonction (info, lp, (li, _))) = 
    let rec analyse_instruction_retour li =
        match li with 
        | [] -> false
        | a :: q -> 
            match a with 
            | AstPlacement.Retour(_,_,_) -> true
            | AstPlacement.RetourVoid(_) -> true
            | _ -> analyse_instruction_retour q
    in
    
    let nom = 
        match info_ast_to_info info with 
        | InfoFun(nom, _, _) -> nom
        | _ -> failwith "error"
    in 
    
    let queue = if (analyse_instruction_retour li) then "" else halt in 
    
    label nom ^
    (List.fold_right (fun i str -> (analyse_code_instruction i)^str) li "")^
    queue

let analyse_code_enum (AstPlacement.Enumerateur (nom, l_enum)) = ""

let analyser (AstPlacement.Main (l_enum, AstPlacement.Programme (fonctions, prog))) = 
    getEntete() ^  
    
    (List.fold_right (fun i str -> (analyse_code_enum i)^str ) l_enum "") ^

    (List.fold_right (fun i str -> (analyse_code_fonction i)^str ) fonctions "") ^
    label "main" ^
    analyse_code_bloc prog ^ 
    halt