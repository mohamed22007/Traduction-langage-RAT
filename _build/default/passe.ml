(* Interface définissant une passe *)
module type Passe =
sig 
  (* type des AST en entrée de la passe *)
  type t1
  (* type des AST en sortie de la passe *)
  type t2

  (* fonction d'analyse qui tranforme un AST de type t1 
  en un AST de type t2 en réalisant des vérifications *)
  val analyser : t1 -> t2
end

(* Passe AstSyntax.programme -> AstTds.programme *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PasseTdsNop : Passe  with type t1 = Ast.AstSyntax.main and type t2 =  Ast.AstTds.main =
struct
  type t1 = Ast.AstSyntax.main
  type t2 = Ast.AstTds.main

  let analyser _ =  Ast.AstTds.Main([], Ast.AstTds.Programme([],[]))

end

(* Passe AstTds.programme -> AstType.programme *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PasseTypeNop : Passe  with type t1 = Ast.AstTds.main and type t2 = Ast.AstType.main =
struct
  type t1 = Ast.AstTds.main
  type t2 =  Ast.AstType.main

  let analyser _ =  Ast.AstType.Main([], Ast.AstType.Programme([],[]))

end

(* Passe AstType.main -> unit *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PassePlacementNop : Passe  with type t1 =  Ast.AstType.main and type t2 = Ast.AstPlacement.main =
struct
  type t1 = Ast.AstType.main
  type t2 = Ast.AstPlacement.main

  let analyser _ = Ast.AstPlacement.Main([], Ast.AstPlacement.Programme([],([],0)))

end

(* Passe AstPlacement.main -> string *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PasseCodeNop : Passe  with type t1 = Ast.AstPlacement.main and type t2 = string =
struct
  type t1 = Ast.AstPlacement.main
  type t2 = string

  let analyser _ = ""

end

(* Passe AstPlacement.programme -> string *)
(* Affiche les adresses des variables  *)
(* Pour tester les paramètres des fonctions, il est nécessaire de les mettre en retour *)
module VerifPlacement =
struct
  open Tds


  (* Renvoie l'adresse d'une variable dans le cas d'une déclaration *)
  let rec analyser_instruction i = 
    match i with
    | Ast.AstPlacement.Declaration (info,_) -> 
      begin
        match Tds.info_ast_to_info info with
        | InfoVar (n,_,d,r) -> [(n,(d,r))]
        | _ -> []
        end
    | Ast.AstPlacement.Conditionnelle(_,(bt,_),(be,_)) -> (List.flatten (List.map (analyser_instruction) bt))@(List.flatten (List.map (analyser_instruction) be))
    | Ast.AstPlacement.TantQue (_,(b,_)) -> (List.flatten (List.map (analyser_instruction) b))
    | _ -> [] 


let analyser_param info =
  match Tds.info_ast_to_info info with
  | InfoVar (n,_,d,r) -> [(n,(d,r))]
  | _ -> []

  (* Renvoie la suite des adresses des variables déclarées dans la fonction *)
  (* Ainsi qu'une adresse d'identifiant si le retour est un identifiant *)
  let analyser_fonction (Ast.AstPlacement.Fonction(info,lp,(li,_))) =
    (*La liste des paramètres n'est plus présente, pour tester le placement des paramètres, on utilisera une astuce :
    il faudra écrire un programme qui renvoie le paramètre *)
    match info_ast_to_info info with
    | InfoFun(n,_,_) -> [(n,(List.flatten (List.map analyser_param lp))@(List.flatten (List.map (analyser_instruction) li)))]
    | _ -> failwith "Internal error"

  (* Renvoie la suite des adresses des variables déclarées dans les fonctions et dans le programme principal *)
  (* On ignore les enums (_) car ils n'ont pas d'adresse en mémoire au sens "stack frame" *)
  let analyser (Ast.AstPlacement.Main (_, Ast.AstPlacement.Programme (fonctions, (prog,_)))) =
    ("main", List.flatten (List.map (analyser_instruction) prog))::(List.flatten (List.map (analyser_fonction) fonctions))
end
