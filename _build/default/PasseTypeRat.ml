open Tds
open Exceptions
open Ast

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme
(*
(* analyse_type_expression : AstTds.expression -> AstType.expression * type *)
(* Patamétte e : expresion a analyser *)
(* erreurs si types non compatible *)

let rec analyse_type_expression e = 
  match e with
    |AstTds.AppelFonction (info, le) -> 
          begin match info_ast_to_info info with
            | InfoFun(_, t, ln) -> if !(est_compatible_list le ln) then 
                                        raise TypesParametresInattendus(le,ln)
                                   else (AstType(info, le), t)
            | _ -> raise MauvaiseUtilisationIdentifiant ("identifier pas de fonction ") 
          end 
    |AstTds.Ident info -> 
          ty = match info with
            |InfoConst (_,_) -> Undefined
            |InfoFun (_,t,_) -> t
            |InfoVar (_,t,_,_) -> t
            | _-> Undefined
          (AstType.Ident (info), ty)
    |AstTds.Unaire(op, e1) -> 

          let (ne, t) = analyse_type_expression e1 in
          if (est_compatible t Rat ) then 
              (AstType(op, ne), t)
          else 
              raise TypeInattendu t Rat 
    |AstTds.Binaire(op, e1,e2) ->
          begin 
          let (ne1, t1) = analyse_type_expression e1 in
          let (ne2, t2)= analyse_type_expression e2 in 
          match (t1, t2) with 
            | (Bool, Bool) -> if (op = EquBool) then (AstType.Binaire(op, ne1, ne2),Bool) else 
                                  raise TypeInattendu
            | (Int, Int) -> if (op = PlusInt)||(op = MultInt)||(op = EquInt) then (AstType.Binaire(op, ne1, ne2),Int) else
                                  if (op = Fraction) then  (AstType.Binaire(op, ne1, ne2),Rat) else
                                  if (op = Inf) then (AstType.Binaire(op, ne1, ne2),Bool)
                                  raise TypeInattendu
            | (Rat,Rat) -> if (op = PlusRat)||(op = MultRat) then (AstType.Binaire(op, ne1, ne2),Rat) else 
                             if (op = Inf) then (AstType.Binaire(op, ne1, ne2),Bool) else
                              raise TypeInattendu
            | (t1,t2) -> raise TypeInattendu(t1,t2)
          end
      |AstTds.Booleen b -> (AstType.Booleen(b), Bool)
      |AstTds.Entier i -> (AstType.Entier(i), Int)



(* analyse_type_bloc : AstTds.bloc -> AstType.bloc * type *)
(* Patamétte li : liste des instrictions *)
(* erreurs si types non compatible *)
let analyse_type_bloc li = failwith "to do "

(* analyse : AstTds.Programme -> AstType.Programme * type *)
(* Patamétte fonctions : fonctions en programmes *)
(** Paramtre prog : bloc principale *)
(* erreurs si types non compatible *)
let analyse (AstTds.Programme(fonctions, prog)) = 
  let p = analyse_type_bloc(prog) in 
  let lf = List.map analyse_type_fonction fonctions in 
  (AstType(lf, p), Undefined)

(* analyse : AstTds.Programme -> AstType.Programme * type *)
(* Patamétte fonctions : fonctions en programmes *)
(** Paramtre prog : bloc principale *)
(* erreurs si types non compatible *)
*)