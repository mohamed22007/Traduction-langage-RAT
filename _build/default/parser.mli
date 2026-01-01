
(* The type of tokens. *)

type token = 
  | WHILE
  | VOID
  | VIRG
  | VAL
  | TRUE
  | TID of (string)
  | SLASH
  | RETURN
  | RAT
  | PV
  | PRINT
  | PO
  | PLUS
  | PF
  | NUM
  | NULL
  | NEW
  | MULT
  | INT
  | INF
  | IF
  | ID of (string)
  | FALSE
  | EQUAL
  | EOF
  | ENUM
  | ENTIER of (int)
  | ELSE
  | DENOM
  | CONST
  | CO
  | CF
  | BOOL
  | AO
  | AF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.AstSyntax.main)
