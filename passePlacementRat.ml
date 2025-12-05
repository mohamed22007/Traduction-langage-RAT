open Passe
open Tds
open Exceptions
open Ast
open Type


type t1 = AstType.programme
type t2 = AstPlacement.programme

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
      let bt = analyse_placement_bloc t depl reg in
      let be = analyse_placement_bloc e depl reg in
      (AstPlacement.Conditionnelle (c, bt, be), 0)

    | AstType.TantQue(c,b) ->
        let nb = analyse_placement_bloc b depl reg in 
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
 match li with 
    | [] -> ([],0)
    | i :: q -> let (ni , ti) = analyse_placement_instruction i depl reg in
                let (nq, tq) = analyse_placement_bloc q (depl + ti) reg in 
                (ni :: nq, ti + tq)

and analyse_placement_fonction (AstType.Fonction(info, lp, li)) =
 let rec place_params params depl =
  match params with
  | [] -> depl
  | info :: q ->
      let depl_final = place_params q depl in
      begin match info_ast_to_info info with
        | InfoVar(_, t, _, _) ->
            let nouvelle_adresse = depl_final - getTaille t in
            modifier_adresse_variable nouvelle_adresse "LB" info;
            nouvelle_adresse
        | _ -> failwith "Error"
      end
  in
  let depl_apres_params = place_params lp 0 in
  let nv_li = analyse_placement_bloc li 3 "LB" in
  AstPlacement.Fonction(info, lp, nv_li)


let analyser (AstType.Programme (fonctions, prog)) =
   let nv_fonctions = List.map analyse_placement_fonction fonctions in 
   let nv_prog = analyse_placement_bloc prog 0 "SB" in 
   AstPlacement.Programme(nv_fonctions, nv_prog)

