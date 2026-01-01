open Passe
open Tds
open Exceptions
open Ast
open Type
open Tam
open Code

type t1 = AstPlacement.main
type t2 = string

(* Récupère le type d'une information : variable, pointeur ou constante *)
let get_type_info info =
  match info_ast_to_info info with
  | InfoVar (_, t, _, _) -> t
  | InfoPoint (_, t, _, _, _) -> t
  | InfoConst _ -> Int  (* On suppose que les constantes sont de type Int *)
  | _ -> failwith "Erreur interne code : pas de type"

(* Récupère les informations de placement mémoire (taille, déplacement, registre) *)
let get_info_data info =
  match info_ast_to_info info with
  | InfoVar (_, t, dep, reg) -> (getTaille t, dep, reg)
  | InfoPoint (_, t, dep, reg, _) -> (getTaille t, dep, reg)
  | _ -> failwith "Erreur interne code : info invalide (pas de placement)"

(* Récupère récursivement le type d'un affectable, comme une variable ou un pointeur *)
let rec get_type_affectable a =
  match a with
  | AstType.IdentAffect info -> get_type_info info  (* Une variable directement *)
  | AstType.PointerAffect pa ->  (* Un pointeur : on récupère le type du pointeur *)
      match get_type_affectable pa with
      | Pointer_typ t -> t  (* Si c'est un pointeur, on retourne le type pointé *)
      | _ -> failwith "Erreur code : Déréférencement non pointeur"

(* Calcule la taille de la valeur pointée par un affectable (une variable ou un pointeur) *)
let get_taille_affectable_type a = 
  match a with
  | AstType.IdentAffect info -> getTaille (get_type_info info)  (* Taille du type de la variable *)
  | AstType.PointerAffect pa -> 
      let t_ptr = get_type_affectable pa in  (* Récupère le type pointé *)
      match t_ptr with
      | Pointer_typ t_val -> getTaille t_val  (* Retourne la taille de la valeur pointée *)
      | _ -> failwith "Erreur : déréférencement d'un non-pointeur"

(* Génère le code pour charger la valeur d'un affectable sur la pile *)
let rec analyse_code_affectable_val a =
  match a with
  | AstType.IdentAffect info -> 
      begin match info_ast_to_info info with
      | InfoVar (_, _, valeur, "ENUM") -> 
          loadl_int valeur  (* Charge la valeur de l'enum directement *)
      | InfoVar (_, t, dep, reg) -> 
          load (getTaille t) dep reg  (* Charge la variable en mémoire (adresse de la variable) *)
      | InfoPoint (_, t, dep, reg, _) -> 
          load (getTaille t) dep reg  (* Charge la valeur pointée par le pointeur *)
      | InfoConst (_, valeur) -> 
          loadl_int valeur  (* Charge directement la valeur d'une constante *)
      | _ -> failwith "Erreur interne : Info invalide dans affectable_val"
      end
  | AstType.PointerAffect pa ->
      let taille_valeur_pointee = get_taille_affectable_type a in
      (* Récupère la valeur pointée et charge son adresse *)
      (analyse_code_affectable_val pa) ^ (loadi taille_valeur_pointee)

(* Génère le code pour charger l'adresse d'un affectable (variable ou pointeur) *)
let rec analyse_code_affectable_addr a =
  match a with
  | AstType.IdentAffect info ->
      let (_, dep, reg) = get_info_data info in
      loada dep reg  (* Charge l'adresse de la variable dans le registre *)
  | AstType.PointerAffect pa ->
      analyse_code_affectable_val pa  (* Récupère l'adresse du pointeur de manière récursive *)

(* Génère le code pour analyser une expression *)
let rec analyse_code_expression e =
  match e with
    (* Appel de fonction : génère le code pour appeler la fonction avec ses arguments *)
    | AstType.AppelFonction (info, le) ->
        let cle = List.fold_right (fun e acc -> (analyse_code_expression e)^acc) le "" in 
        begin match info_ast_to_info info with
            | InfoFun(nom_fun, _, _) -> cle^(call "SB" nom_fun)  (* Appel fonction avec ses paramètres *)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 

    (* Accès à un affectable (variable ou pointeur) *)
    | AstType.Acces a ->
        analyse_code_affectable_val a  (* Génère le code pour accéder à la valeur *)

    (* Valeur booléenne : charge 1 pour true et 0 pour false *)
    | AstType.Booleen (b) -> if b then (loadl_int 1) else (loadl_int 0)
    (* Valeur entière : charge l'entier sur la pile *)
    | AstType.Entier (i) -> loadl_int i
    (* Valeur Null : charge 0 (équivalent de null en mémoire) *)
    | AstType.Null -> loadl_int 0 

    (* Allocation dynamique d'un objet (nouvelle mémoire) *)
    | AstType.New t -> 
        let taille = getTaille t in
        (loadl_int taille) ^ (subr "MAlloc")  (* Allocation de mémoire avec un appel à la fonction "MAlloc" *)

    (* Opération unaire : traitement des opérations sur les entiers/rationnels/etc. *)
    | AstType.Unaire(op, e1) -> 
        begin match op with
        | AstType.Numerateur -> (analyse_code_expression e1)^(pop 0 1)
        | AstType.Denominateur -> (analyse_code_expression e1)^(pop 1 1)
        | AstType.Address -> 
            begin match e1 with
            | AstType.Acces a -> analyse_code_affectable_addr a  (* Génère le code pour prendre l'adresse d'une variable *)
            | _ -> failwith "Erreur code : on ne peut prendre l'adresse que d'une variable"
            end
        end

    (* Opération binaire : calcule les résultats des opérations arithmétiques et logiques *)
    | AstType.Binaire (op, e1,e2) -> 
        let codeExp1 = analyse_code_expression e1 in
        let codeExp2 = analyse_code_expression e2 in 
        begin match op with
          | AstType.PlusInt -> codeExp1^codeExp2^(subr "IAdd")  (* Addition d'entiers *)
          | AstType.PlusRat -> codeExp1^codeExp2^(call "SB" "RAdd")  (* Addition de rationnels *)
          | AstType.MultInt -> codeExp1^codeExp2^(subr "IMul")  (* Multiplication d'entiers *)
          | AstType.MultRat -> codeExp1^codeExp2^(call "SB" "RMul")  (* Multiplication de rationnels *)
          | AstType.EquInt -> codeExp1^codeExp2^(subr "IEq")  (* Comparaison d'égalité sur les entiers *)
          | AstType.EquBool -> codeExp1^codeExp2^(subr "IEq")  (* Comparaison d'égalité sur les booléens *)
          | AstType.Inf -> codeExp1^codeExp2^(subr "ILss")  (* Comparaison de < sur les entiers *)
          | AstType.Fraction -> codeExp1^codeExp2^(call "SB" "norm")  (* Normalisation des fractions *)
          | AstType.EquRef -> codeExp1^codeExp2^(subr "IEq")  (* Comparaison d'égalité de références *)
          | AstType.EquEnu -> codeExp1^codeExp2^(subr "IEq")  (* Comparaison d'égalité sur les enums *)
          | _ -> failwith "error"  (* Erreur dans le cas où l'opération n'est pas prise en charge *)
        end


(* Fonction d'analyse des instructions : génère le code pour chaque instruction *)
let rec analyse_code_instruction i = 
  match i with
    (* Déclaration : réserve de la mémoire pour la variable et calcule sa valeur *)
    | AstPlacement.Declaration(info,e) ->
        let (taille, dep, reg) = get_info_data info in 
        let codeExp = analyse_code_expression e in
        (push taille)^codeExp^(store taille dep reg)  (* Réserve de mémoire et stockage de la valeur *)

    (* Affectation : génère le code pour assigner une nouvelle valeur à une variable ou pointeur *)
    | AstPlacement.Affectation(a, e) ->
        let codeExp = analyse_code_expression e in
        begin match a with
        | AstType.IdentAffect info ->
            let (taille, dep, reg) = get_info_data info in
            codeExp ^ (store taille dep reg)  (* Affectation dans la variable *)
        | AstType.PointerAffect _ ->
            let taille = get_taille_affectable_type a in
            codeExp ^ (analyse_code_affectable_addr a) ^ (storei taille)  (* Affectation dans l'adresse du pointeur *)
        end

    (* Instructions d'affichage : affiche la valeur de l'expression *)
    | AstPlacement.AffichageInt e ->
        (analyse_code_expression e)^(subr "IOut")  (* Affichage d'un entier *)

    | AstPlacement.AffichageRat e ->
        (analyse_code_expression e)^(call "SB" "rout")  (* Affichage d'un rationnel *)
        
    | AstPlacement.AffichageBool e ->
        (analyse_code_expression e)^(subr "BOut")  (* Affichage d'un booléen *)

    (* Conditionnelle : génère un bloc de code avec des branchements conditionnels *)
    | AstPlacement.Conditionnelle (c,bt,be) ->
        let codeExp = analyse_code_expression c in
        let eti_be = getEtiquette() in 
        let end_if = getEtiquette() in
        codeExp ^
        jumpif 0 eti_be ^  (* Si la condition est fausse, on saute au bloc "be" *)
        analyse_code_bloc bt ^  (* Bloc "then" *)
        jump end_if ^  (* On saute à la fin après le bloc "else" *)
        label eti_be ^
        analyse_code_bloc be ^  (* Bloc "else" *)
        label end_if 
    
    (* Boucle TantQue : génère un code pour les boucles conditionnelles *)
    | AstPlacement.TantQue (c, b) -> 
        let codeExp = analyse_code_expression c in 
        let debut = getEtiquette() in 
        let fin_tq = getEtiquette() in
        label debut ^
        codeExp ^
        jumpif 0 fin_tq ^  (* Si la condition est fausse, on sort de la boucle *)
        analyse_code_bloc b ^  (* Exécution du corps de la boucle *)
        jump debut ^  (* Reprise de la boucle *)
        label fin_tq

    (* Retour avec une valeur : génère le code pour la gestion du retour d'une fonction *)
    | AstPlacement.Retour(e,tr,tp) ->
        (analyse_code_expression e)^(return tr tp)
    
    (* Instruction vide : retourne une chaîne vide *)
    | AstPlacement.Empty -> ""

    (* Appel de fonction sans valeur de retour *)
    | AstPlacement.AppelVoid (info, le) ->
        let cle = List.fold_right (fun e acc -> (analyse_code_expression e)^acc) le "" in 
        begin match info_ast_to_info info with
            | InfoFun(nom_fun, _, _) -> cle^(call "SB" nom_fun)
            | _ -> raise (MauvaiseUtilisationIdentifiant ("identifier pas de fonction "))
        end 

    (* Retour void : génère le code de retour sans valeur *)
    | AstPlacement.RetourVoid(tp) ->
        (analyse_code_expression AstType.Null)^(return 0 tp)

(* Génère le code pour un bloc de code entier (une séquence d'instructions) *)
and analyse_code_bloc (li, _) =
  List.fold_right
    (fun i str -> analyse_code_instruction i ^ str)
    li
    ""


(* Analyse le code d'une fonction *)
let analyse_code_fonction (AstPlacement.Fonction (info , _, ( li , _))) = 
    (* Vérifie s'il y a un retour dans la fonction *)
    let rec analyse_instruction_retour li =
        (match li with 
            |[] -> false
            |a :: q ->( match a with 
                        | AstPlacement.Retour(_,_,_) -> true
                        | _ -> analyse_instruction_retour q )
        )
    in
    (* Récupère le nom de la fonction *)
    let nom = 
    match info_ast_to_info info with 
        | InfoFun(nom , _, _) -> nom
        | _ -> failwith "error"
    in 
    (* Si la fonction n'a pas de retour explicite, on termine par un halt *)
    let queue = if (analyse_instruction_retour li) then "" else halt in 
    label nom ^
    (List.fold_right (fun i str -> (analyse_code_instruction i)^str ) li "")^
    queue

(* Analyse les énumérations : n’a pas de code à générer ici *)
let analyse_code_enum (AstPlacement.Enumerateur (nom, l_enum)) = ""

(* Fonction principale d’analyse de code : génère le code complet pour le programme *)
let analyser (AstPlacement.Main (l_enum, AstPlacement.Programme (fonctions, prog))) = 
    getEntete() ^  
    
    (List.fold_right (fun i str -> (analyse_code_enum i)^str ) l_enum "") ^

    (List.fold_right (fun i str -> (analyse_code_fonction i)^str ) fonctions "") ^
    label "main" ^
    analyse_code_bloc prog ^ 
    halt
