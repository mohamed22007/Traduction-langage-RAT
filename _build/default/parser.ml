
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | VOID
    | VIRG
    | VAL
    | TRUE
    | TID of (
# 12 "parser.mly"
       (string)
# 20 "parser.ml"
  )
    | SLASH
    | RETURN
    | REF
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
    | ID of (
# 11 "parser.mly"
       (string)
# 41 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENUM
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 50 "parser.ml"
  )
    | ELSE
    | DENOM
    | CONST
    | CO
    | CF
    | BOOL
    | AO
    | AF
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 71 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState003 : (('s, _menhir_box_main) _menhir_cell1_ENUM _menhir_cell0_TID, _menhir_box_main) _menhir_state
    (** State 003.
        Stack shape : ENUM TID.
        Start symbol: main. *)

  | MenhirState005 : (('s, _menhir_box_main) _menhir_cell1_TID, _menhir_box_main) _menhir_state
    (** State 005.
        Stack shape : TID.
        Start symbol: main. *)

  | MenhirState012 : (('s, _menhir_box_main) _menhir_cell1_list_enum_, _menhir_box_main) _menhir_state
    (** State 012.
        Stack shape : list(enum).
        Start symbol: main. *)

  | MenhirState021 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 021.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState025 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 025.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState027 : (('s, _menhir_box_main) _menhir_cell1_option_REF_, _menhir_box_main) _menhir_state
    (** State 027.
        Stack shape : option(REF).
        Start symbol: main. *)

  | MenhirState031 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_VIRG_param__, _menhir_box_main) _menhir_state
    (** State 031.
        Stack shape : typ ID loption(separated_nonempty_list(VIRG,param)).
        Start symbol: main. *)

  | MenhirState032 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 032.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState033 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 033.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState040 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 040.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState041 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 041.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState044 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 044.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState047 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 047.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState048 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 048.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState050 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 050.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState059 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 059.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState062 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 062.
        Stack shape : PO NEW.
        Start symbol: main. *)

  | MenhirState065 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT, _menhir_box_main) _menhir_state
    (** State 065.
        Stack shape : PO MULT.
        Start symbol: main. *)

  | MenhirState066 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 066.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState071 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 071.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState075 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 075.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState078 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 078.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState081 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState084 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 084.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState087 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState091 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 091.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState094 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 094.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState095 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 095.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState097 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 097.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState100 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 100.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState111 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 111.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState116 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 116.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState119 : (('s, _menhir_box_main) _menhir_cell1_a, _menhir_box_main) _menhir_state
    (** State 119.
        Stack shape : a.
        Start symbol: main. *)

  | MenhirState126 : ((('s, _menhir_box_main) _menhir_cell1_list_enum_, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 126.
        Stack shape : list(enum) list(fonc) ID.
        Start symbol: main. *)

  | MenhirState128 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 128.
        Stack shape : fonc.
        Start symbol: main. *)

  | MenhirState130 : (('s, _menhir_box_main) _menhir_cell1_enum, _menhir_box_main) _menhir_state
    (** State 130.
        Stack shape : enum.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_a = 
  | MenhirCell1_a of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.affectable)

and ('s, 'r) _menhir_cell1_bloc = 
  | MenhirCell1_bloc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.bloc)

and ('s, 'r) _menhir_cell1_e = 
  | MenhirCell1_e of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.expression)

and ('s, 'r) _menhir_cell1_enum = 
  | MenhirCell1_enum of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.enum)

and ('s, 'r) _menhir_cell1_fonc = 
  | MenhirCell1_fonc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction)

and ('s, 'r) _menhir_cell1_i = 
  | MenhirCell1_i of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.instruction)

and ('s, 'r) _menhir_cell1_list_enum_ = 
  | MenhirCell1_list_enum_ of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.enum list)

and ('s, 'r) _menhir_cell1_list_fonc_ = 
  | MenhirCell1_list_fonc_ of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_VIRG_param__ = 
  | MenhirCell1_loption_separated_nonempty_list_VIRG_param__ of 's * ('s, 'r) _menhir_state * ((Type.typ * string * bool) list)

and ('s, 'r) _menhir_cell1_option_REF_ = 
  | MenhirCell1_option_REF_ of 's * ('s, 'r) _menhir_state * (unit option)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Type.typ * string * bool)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Type.typ)

and ('s, 'r) _menhir_cell1_AO = 
  | MenhirCell1_AO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CO = 
  | MenhirCell1_CO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DENOM = 
  | MenhirCell1_DENOM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ENUM = 
  | MenhirCell1_ENUM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 11 "parser.mly"
       (string)
# 312 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 319 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MULT = 
  | MenhirCell1_MULT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NEW = 
  | MenhirCell1_NEW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NUM = 
  | MenhirCell1_NUM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PO = 
  | MenhirCell1_PO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINT = 
  | MenhirCell1_PRINT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TID = 
  | MenhirCell1_TID of 's * ('s, 'r) _menhir_state * (
# 12 "parser.mly"
       (string)
# 347 "parser.ml"
)

and 's _menhir_cell0_TID = 
  | MenhirCell0_TID of 's * (
# 12 "parser.mly"
       (string)
# 354 "parser.ml"
)

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.AstSyntax.main) [@@unboxed]

let _menhir_action_01 =
  fun i ->
    (
# 101 "parser.mly"
                          (IdentAffect(i))
# 368 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_02 =
  fun i ->
    (
# 102 "parser.mly"
                          (IdentAffect(i))
# 376 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_03 =
  fun a1 ->
    (
# 103 "parser.mly"
                          (PointerAffect(a1))
# 384 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_04 =
  fun li ->
    (
# 78 "parser.mly"
                        (li)
# 392 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_05 =
  fun n xs ->
    let lp = 
# 241 "<standard.mly>"
    ( xs )
# 400 "parser.ml"
     in
    (
# 106 "parser.mly"
                                         (AppelFonction (n,lp))
# 405 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun e1 e2 ->
    (
# 107 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 413 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun a1 ->
    (
# 108 "parser.mly"
                          (Acces a1)
# 421 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun () ->
    (
# 109 "parser.mly"
                          (Booleen true)
# 429 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun () ->
    (
# 110 "parser.mly"
                          (Booleen false)
# 437 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e ->
    (
# 111 "parser.mly"
                          (Entier e)
# 445 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 ->
    (
# 112 "parser.mly"
                          (Unaire(Numerateur,e1))
# 453 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 ->
    (
# 113 "parser.mly"
                          (Unaire(Denominateur,e1))
# 461 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 114 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 469 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun e1 e2 ->
    (
# 115 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 477 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun e1 e2 ->
    (
# 116 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 485 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun e1 e2 ->
    (
# 117 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 493 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_17 =
  fun exp ->
    (
# 118 "parser.mly"
                          (exp)
# 501 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_18 =
  fun t ->
    (
# 120 "parser.mly"
                          (New(t))
# 509 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_19 =
  fun i ->
    (
# 121 "parser.mly"
                          (Unaire(Address,Acces(IdentAffect i)))
# 517 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_20 =
  fun () ->
    (
# 122 "parser.mly"
                          (Null)
# 525 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_21 =
  fun i ->
    (
# 123 "parser.mly"
                          (Reference(i))
# 533 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_22 =
  fun id n ->
    (
# 68 "parser.mly"
                                     (Enumerateur(n,id))
# 541 "parser.ml"
     : (Ast.AstSyntax.enum))

let _menhir_action_23 =
  fun li n t xs ->
    let lp = 
# 241 "<standard.mly>"
    ( xs )
# 549 "parser.ml"
     in
    (
# 74 "parser.mly"
                                                              (Fonction(t,n,lp,li))
# 554 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_24 =
  fun e1 n t ->
    (
# 81 "parser.mly"
                                    (Declaration (t,n,e1))
# 562 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun a1 e1 ->
    (
# 82 "parser.mly"
                                    (Affectation (a1,e1))
# 570 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun e n ->
    (
# 83 "parser.mly"
                                    (Constante (n,e))
# 578 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_27 =
  fun e1 ->
    (
# 84 "parser.mly"
                                    (Affichage (e1))
# 586 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_28 =
  fun exp li1 li2 ->
    (
# 85 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 594 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_29 =
  fun exp li ->
    (
# 86 "parser.mly"
                                    (TantQue (exp,li))
# 602 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_30 =
  fun exp ->
    (
# 87 "parser.mly"
                                    (Retour (exp))
# 610 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_31 =
  fun () ->
    (
# 88 "parser.mly"
                                    (RetourVoid)
# 618 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_32 =
  fun i xs ->
    let lp = 
# 241 "<standard.mly>"
    ( xs )
# 626 "parser.ml"
     in
    (
# 89 "parser.mly"
                                          (AppelVoid(i,lp))
# 631 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_33 =
  fun l ->
    (
# 70 "parser.mly"
                                             ( l )
# 639 "parser.ml"
     : (string list))

let _menhir_action_34 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 647 "parser.ml"
     : (Ast.AstSyntax.enum list))

let _menhir_action_35 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 655 "parser.ml"
     : (Ast.AstSyntax.enum list))

let _menhir_action_36 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 663 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_37 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 671 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_38 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 679 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_39 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 687 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_40 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 695 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_41 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 703 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_42 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 711 "parser.ml"
     : ((Type.typ * string * bool) list))

let _menhir_action_43 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 719 "parser.ml"
     : ((Type.typ * string * bool) list))

let _menhir_action_44 =
  fun len lfi ->
    (
# 66 "parser.mly"
                                  (Main(len,lfi))
# 727 "parser.ml"
     : (Ast.AstSyntax.main))

let _menhir_action_45 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 735 "parser.ml"
     : (unit option))

let _menhir_action_46 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 743 "parser.ml"
     : (unit option))

let _menhir_action_47 =
  fun n r t ->
    (
# 76 "parser.mly"
                                  ( (t, n, (r <> None)) )
# 751 "parser.ml"
     : (Type.typ * string * bool))

let _menhir_action_48 =
  fun lf li ->
    (
# 72 "parser.mly"
                            (Programme (lf,li))
# 759 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_49 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 767 "parser.ml"
     : (string list))

let _menhir_action_50 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 775 "parser.ml"
     : (string list))

let _menhir_action_51 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 783 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_52 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 791 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_53 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 799 "parser.ml"
     : ((Type.typ * string * bool) list))

let _menhir_action_54 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 807 "parser.ml"
     : ((Type.typ * string * bool) list))

let _menhir_action_55 =
  fun () ->
    (
# 92 "parser.mly"
          (Bool)
# 815 "parser.ml"
     : (Type.typ))

let _menhir_action_56 =
  fun () ->
    (
# 93 "parser.mly"
          (Int)
# 823 "parser.ml"
     : (Type.typ))

let _menhir_action_57 =
  fun () ->
    (
# 94 "parser.mly"
          (Rat)
# 831 "parser.ml"
     : (Type.typ))

let _menhir_action_58 =
  fun t ->
    (
# 95 "parser.mly"
             (Pointer_typ t)
# 839 "parser.ml"
     : (Type.typ))

let _menhir_action_59 =
  fun n ->
    (
# 96 "parser.mly"
           (Type_enum n)
# 847 "parser.ml"
     : (Type.typ))

let _menhir_action_60 =
  fun () ->
    (
# 97 "parser.mly"
           (Void)
# 855 "parser.ml"
     : (Type.typ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AF ->
        "AF"
    | AO ->
        "AO"
    | BOOL ->
        "BOOL"
    | CF ->
        "CF"
    | CO ->
        "CO"
    | CONST ->
        "CONST"
    | DENOM ->
        "DENOM"
    | ELSE ->
        "ELSE"
    | ENTIER _ ->
        "ENTIER"
    | ENUM ->
        "ENUM"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | FALSE ->
        "FALSE"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | INF ->
        "INF"
    | INT ->
        "INT"
    | MULT ->
        "MULT"
    | NEW ->
        "NEW"
    | NULL ->
        "NULL"
    | NUM ->
        "NUM"
    | PF ->
        "PF"
    | PLUS ->
        "PLUS"
    | PO ->
        "PO"
    | PRINT ->
        "PRINT"
    | PV ->
        "PV"
    | RAT ->
        "RAT"
    | REF ->
        "REF"
    | RETURN ->
        "RETURN"
    | SLASH ->
        "SLASH"
    | TID _ ->
        "TID"
    | TRUE ->
        "TRUE"
    | VAL ->
        "VAL"
    | VIRG ->
        "VIRG"
    | VOID ->
        "VOID"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_127 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_enum_, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_48 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let MenhirCell1_list_enum_ (_menhir_stack, _, len) = _menhir_stack in
          let lfi = _v in
          let _v = _menhir_action_44 len lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_60 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState116 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState032 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_109 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _menhir_s = MenhirState111 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VAL ->
                  _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TID _v ->
                  _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | REF ->
                  _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | PO ->
                  _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NUM ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NULL ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FALSE ->
                  _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ENTIER _v ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DENOM ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CO ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let _v = _menhir_action_58 t in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_034 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_19 i in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_e : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState094 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState087 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState033 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState078 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState040 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState041 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState048 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_120 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_a -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_a (_menhir_stack, _menhir_s, a1) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_25 a1 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | TID _v_0 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState116
      | RETURN ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | PRINT ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | PO ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | IF ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | ID _v_1 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState116
      | CONST ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | AF ->
          let _v_2 = _menhir_action_38 () in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_033 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState033 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_08 () in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_02 i in
      _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_a : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState032 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState119 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState100 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState041 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState048 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_118 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_a (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_s = MenhirState119 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_21 i in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState040 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          let _menhir_stack = MenhirCell1_NEW (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState062 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RAT ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | MULT ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState041 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_20 () in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | TID _v_0 ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState044
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | ID _v_1 ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState044
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | ENTIER _v_2 ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState044
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | PF ->
              let _v_3 = _menhir_action_40 () in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
          | _ ->
              _eRR ())
      | AO | CF | EQUAL | INF | MULT | PF | PLUS | PV | SLASH | VIRG ->
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_09 () in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState047 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState048 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, n) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_05 n xs in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_59 n in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_015 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_57 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_56 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_55 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MULT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState065
      | PO ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let i = _v in
            _menhir_action_01 i
          in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState066 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_MULT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let a1 = _v in
          let _v = _menhir_action_03 a1 in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let a1 = _v in
      let _v = _menhir_action_07 a1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_086 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let i = _v in
          let _v = _menhir_action_02 i in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _ | MULT ->
          let n = _v in
          let _v = _menhir_action_59 n in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | TRUE ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | TID _v ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState087
      | REF ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PO ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | NUM ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | NULL ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | ID _v ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState087
      | FALSE ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | ENTIER _v ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState087
      | DENOM ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | CO ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState091 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState094 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | REF ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PO ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | TID _v_0 ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState100
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | ID _v_1 ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState100
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | ENTIER _v_2 ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState100
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
          | PF ->
              let _v_3 = _menhir_action_40 () in
              _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
          | _ ->
              _eRR ())
      | EQUAL ->
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, i) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_32 i xs in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ENTIER _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PV ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (n, e) = (_v, _v_0) in
                      let _v = _menhir_action_26 e n in
                      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_39 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState116 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState032 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_04 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _v _tok
      | MenhirState031 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState097 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_122 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_VIRG_param__ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_loption_separated_nonempty_list_VIRG_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_23 li n t xs in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | TID _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState128
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | ID _ ->
          let _v_1 = _menhir_action_36 () in
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_129 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_37 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState128 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState012 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_125 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_enum_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _menhir_s = MenhirState126 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | TID _v ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032
      | RETURN ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | PRINT ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | PO ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | IF ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | ID _v ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032
      | CONST ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | AF ->
          let _v = _menhir_action_38 () in
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_28 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_096 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState097 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_29 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_112 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_24 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_27 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_30 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_15 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_16 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_14 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_13 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState071 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_17 exp in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState075 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState078 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState081 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_11 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_058 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VIRG ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState059 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PF ->
          let x = _v in
          let _v = _menhir_action_51 x in
          _menhir_goto_separated_nonempty_list_VIRG_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_VIRG_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState059 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState100 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState044 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_060 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_52 x xs in
      _menhir_goto_separated_nonempty_list_VIRG_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_055 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_41 x in
      _menhir_goto_loption_separated_nonempty_list_VIRG_e__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_VIRG_e__ : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState100 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState044 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_054 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_12 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_051 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | CF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_CO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_06 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _menhir_s = MenhirState050 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | REF ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PO ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_NEW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_18 t in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_option_REF_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MULT ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_option_REF_ (_menhir_stack, _menhir_s, r) = _menhir_stack in
          let (n, t) = (_v_0, _v) in
          let _v = _menhir_action_47 n r t in
          (match (_tok : MenhirBasics.token) with
          | VIRG ->
              let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState025 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REF ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BOOL | INT | RAT | TID _ | VOID ->
                  _menhir_reduce_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
              | _ ->
                  _eRR ())
          | PF ->
              let x = _v in
              let _v = _menhir_action_53 x in
              _menhir_goto_separated_nonempty_list_VIRG_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let x = () in
      let _v = _menhir_action_46 x in
      _menhir_goto_option_REF_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_option_REF_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_option_REF_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | TID _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState027
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | _ ->
          _eRR ()
  
  and _menhir_reduce_45 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      let _v = _menhir_action_45 () in
      _menhir_goto_option_REF_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_separated_nonempty_list_VIRG_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState021 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_026 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_54 x xs in
      _menhir_goto_separated_nonempty_list_VIRG_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_023 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_43 x in
      _menhir_goto_loption_separated_nonempty_list_VIRG_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_VIRG_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_VIRG_param__ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState031 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _menhir_s = MenhirState021 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REF ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | PF ->
                  let _v = _menhir_action_42 () in
                  _menhir_goto_loption_separated_nonempty_list_VIRG_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BOOL | INT | RAT | TID _ | VOID ->
                  _menhir_reduce_45 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_enum_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState012
      | TID _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState012
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState012
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState012
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState012
      | ID _ ->
          let _v_1 = _menhir_action_36 () in
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState012 _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_131 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_enum -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_enum (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_35 x xs in
      _menhir_goto_list_enum_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_enum_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState130 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ENUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TID _v ->
          let _menhir_stack = MenhirCell0_TID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              let _menhir_s = MenhirState003 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TID _v ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VIRG ->
          let _menhir_stack = MenhirCell1_TID (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState005 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TID _v ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AF ->
          let x = _v in
          let _v = _menhir_action_49 x in
          _menhir_goto_separated_nonempty_list_VIRG_TID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_VIRG_TID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState003 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState005 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_007 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ENUM _menhir_cell0_TID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let l = _v in
      let _v = _menhir_action_33 l in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_TID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_ENUM (_menhir_stack, _menhir_s) = _menhir_stack in
          let id = _v in
          let _v = _menhir_action_22 id n in
          let _menhir_stack = MenhirCell1_enum (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | ENUM ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
          | BOOL | ID _ | INT | RAT | TID _ | VOID ->
              let _v_0 = _menhir_action_34 () in
              _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_TID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_TID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_50 x xs in
      _menhir_goto_separated_nonempty_list_VIRG_TID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ENUM ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | BOOL | ID _ | INT | RAT | TID _ | VOID ->
          let _v = _menhir_action_34 () in
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
