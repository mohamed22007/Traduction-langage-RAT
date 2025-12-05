(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type


let rec analyse_placement_instruction i depl reg = 
  match i with
    | AstType.Declaration (info,e) ->
        begin
            match (info_ast_to_info info ) with
              | InfoVar(_,t,_,_) -> 
                  modifier_adresse_variable depl reg info ;
                  (AstPlacement.Declaration(info,e), getTaille(t))
              | _ -> failwith "Error "
        end
    | AstType.Conditionnelle (c, t , e) ->
        let (nt, _) = analyse_placement_bloc t depl reg in
        let (ne, _) = analyse_placement_bloc e depl reg in

        (AstPlacement.Conditionnelle(c,nt,ne), 0)

    | AstType.TantQue(c,b) ->
        let (nb , _ )= analyse_placement_bloc b depl reg in 
        (AstPlacement.TantQue(c,nb), 0)

    | AstType.Retour(e, ia) ->
      begin
        match (info_ast_to_info ia) with
          | InfoFun(_, tr, tp) -> 
              (AstPlacement.Retour(e, getTaille tr ,
               (List.fold_right (fun t tq -> tq + getTaille t) tp 0 )
              ),0)
          | _ -> failwith "Error "
      end

    | AstType.Affectation(ia , e) -> (AstPlacement.Affectation(ia, e),0)

    | AstType.AffichageInt (e) -> (AstPlacement.AffichageInt(e),0)

    | AstType.AffichageRat (e) -> (AstPlacement.AffichageRat(e),0)

    | AstType.AffichageBool (e) -> (AstPlacement.AffichageBool(e),0)

    | AstType.Empty -> (AstPlacement.Empty,0)


and analyse_placement_bloc li depl reg =
(*  List.fold_right (fun i (nli, tail ) -> let (ni, ti) = analyse_placement_instruction i depl reg in 
                          (nli @ ni, tail + ti)) li ([], 0)
*)
 match li with 
    | [] -> ([],0)
    | i :: q -> let (ni , ti) = analyse_placement_instruction i depl reg in
                let (nq, tq) = analyse_placement_bloc q (depl + ti) reg in 
                (ni :: nq, ti + tq)

let analyse (AstType.Programme (fonctions, prog)) =
   let nv_fonctions = List.map (analyse_placement_fonction ) fonctions in 
   let nv_prog = analyse_placement_bloc prog 0 "SB" in 
   AstPlacement.Programme(nv_fonctions, nv_prog)

let analyse_placement_fonction (AstType.Fonction(info,lp,li)) =
  let nv_li = analyse_placement_bloc(li,0,"LB") in
    AstPlacement.Fonction(info,lp,nv_li)
