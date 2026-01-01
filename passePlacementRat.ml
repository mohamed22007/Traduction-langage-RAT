open Tds
open Ast
open Type

type t1 = AstType.main
type t2 = AstPlacement.main


(* Récupère le type associé à une information de la TDS *)
(* Cette fonction est utilisée lors du placement mémoire pour connaître *)
(* la taille à réserver pour une variable ou un pointeur *)
let get_type_info info =
  match info_ast_to_info info with
  | InfoVar (_, t, _, _) -> t
  | InfoPoint (_, t, _, _, _) -> t
  | _ -> failwith "Erreur interne : tentative de récupérer le type d'une Const ou Fun dans le placement"


(* Modifie l’adresse (déplacement + registre) d’une information *)
(* Fonction générique valable pour variables et pointeurs *)
let modifier_adresse_toute_info depl reg info =
  match info_ast_to_info info with
  | InfoVar (n, t, _, _) -> 
      modifier_adresse_variable depl reg info
  | InfoPoint (n, t, _, _, _) -> 
      modifier_adresse_pointer depl reg 0 info
  | _ -> failwith "Erreur interne : tentative de placement sur une constante ou fonction"



(* analyse_placement_instruction : instruction -> int -> string -> (instruction * int)
   Paramètres :
     - instruction : instruction à analyser
     - depl : déplacement courant dans la pile
     - reg : registre courant (SB ou LB)
   Renvoie :
     - l’instruction transformée en AstPlacement
     - la taille mémoire occupée par cette instruction *)
let rec analyse_placement_instruction i depl reg = 
  match i with
    (* Déclaration de variable *)
    | AstType.Declaration (info, e) ->
        let t = get_type_info info in
        let taille = getTaille t in
        (* Placement de la variable à l’adresse courante *)
        modifier_adresse_toute_info depl reg info;
        (AstPlacement.Declaration(info, e), taille)

    (* Conditionnelle : pas d’allocation directe *)
    | AstType.Conditionnelle (c, t, e) ->
        let bt = analyse_placement_bloc t depl reg in
        let be = analyse_placement_bloc e depl reg in
        (AstPlacement.Conditionnelle (c, bt, be), 0)

    (* Boucle tant que *)
    | AstType.TantQue (c, b) ->
        let nb = analyse_placement_bloc b depl reg in 
        (AstPlacement.TantQue (c, nb), 0)

    (* Instruction return avec valeur *)
    | AstType.Retour (e, ia) ->
        begin
          match (info_ast_to_info ia) with
            | InfoFun (_, tr, tp) -> 
                (* Taille de la valeur de retour *)
                let taille_ret = getTaille tr in
                (* Taille totale des paramètres *)
                let taille_params =
                  List.fold_right (fun t acc -> acc + getTaille t) tp 0
                in
                (AstPlacement.Retour (e, taille_ret, taille_params), 0)
            | _ -> failwith "Erreur interne : Retour hors fonction"
        end

    (* Instruction return void *)
    | AstType.RetourVoid (ia) -> 
        begin 
          match (info_ast_to_info ia) with
            | InfoFun (_, _, tp) -> 
                let taille_params =
                  List.fold_right (fun t acc -> acc + getTaille t) tp 0
                in
                (AstPlacement.RetourVoid (taille_params), 0)
            | _ -> failwith "Erreur interne : Retour hors fonction"
        end 

    (* Appel de fonction sans valeur de retour *)
    | AstType.AppelVoid(info, exps) ->
        (AstPlacement.AppelVoid(info, exps), 0)

    (* Affectation *)
    | AstType.Affectation (ia, e) ->
        (AstPlacement.Affectation(ia, e), 0)

    (* Instructions d’affichage *)
    | AstType.AffichageInt e -> (AstPlacement.AffichageInt e, 0)
    | AstType.AffichageRat e -> (AstPlacement.AffichageRat e, 0)
    | AstType.AffichageBool e -> (AstPlacement.AffichageBool e, 0)

    (* Instruction vide *)
    | AstType.Empty ->
        (AstPlacement.Empty, 0)


(* analyse_placement_bloc : bloc -> déplacement -> registre -> (bloc * taille) *)
(* Analyse séquentielle des instructions du bloc *)
and analyse_placement_bloc li depl reg =
 match li with 
    | [] -> ([], 0)
    | i :: q -> 
        let (ni, ti) = analyse_placement_instruction i depl reg in
        let (nq, tq) = analyse_placement_bloc q (depl + ti) reg in 
        (ni :: nq, ti + tq)


(* analyse_placement_fonction : placement des paramètres et du corps *)
let analyse_placement_fonction (AstType.Fonction(info, lp, li)) =

  (* Placement des paramètres dans la pile (adresses négatives depuis LB) *)
  let _ =
    List.fold_right (fun info depl -> 
      let t = get_type_info info in
      let taille = getTaille t in
      let nouv_depl = depl - taille in
      modifier_adresse_toute_info nouv_depl "LB" info;
      nouv_depl
    ) lp 0
  in

  (* Le corps commence après : *)
  (* - adresse de retour *)
  (* - ancien LB *)
  (* - valeur de retour *)
  let bloc_corps = analyse_placement_bloc li 3 "LB" in
  
  AstPlacement.Fonction(info, lp, bloc_corps)

 

(* analyse_placement_programme : placement global *)
let analyse_placement_programme (AstType.Programme (fonctions, prog)) =
   (* Analyse des fonctions *)
   let nv_fonctions = List.map analyse_placement_fonction fonctions in 
   
   (* Placement du programme principal dans SB *)
   let bloc_prog = analyse_placement_bloc prog 0 "SB" in 
   
   AstPlacement.Programme(nv_fonctions, bloc_prog)


(* analyse_placement_enum : les enums n’occupent pas de mémoire *)
let analyse_placement_enum (AstType.Enumerateur(nom, l_enum)) =
  AstPlacement.Enumerateur(nom, l_enum)


(* analyser : point d’entrée de la passe Placement *)
let analyser (AstType.Main (l_enum, prog)) =
  let ne = List.map analyse_placement_enum l_enum in
  let np = analyse_placement_programme prog in
  AstPlacement.Main (ne, np)
