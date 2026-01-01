
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
# 40 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENUM
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 49 "parser.ml"
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

# 70 "parser.ml"

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

  | MenhirState026 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 026.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState029 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_VIRG_param__, _menhir_box_main) _menhir_state
    (** State 029.
        Stack shape : typ ID loption(separated_nonempty_list(VIRG,param)).
        Start symbol: main. *)

  | MenhirState030 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 030.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState031 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 031.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState036 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 036.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState037 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 037.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState040 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 040.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState043 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 043.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState044 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 044.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState046 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 046.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState055 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 055.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState058 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 058.
        Stack shape : PO NEW.
        Start symbol: main. *)

  | MenhirState061 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT, _menhir_box_main) _menhir_state
    (** State 061.
        Stack shape : PO MULT.
        Start symbol: main. *)

  | MenhirState062 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 062.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState067 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState071 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 071.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState074 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 074.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState077 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 077.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState080 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 080.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState083 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 083.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState087 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState090 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 090.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState091 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 091.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState093 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 093.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState096 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 096.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState107 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 107.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState112 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 112.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState115 : (('s, _menhir_box_main) _menhir_cell1_a, _menhir_box_main) _menhir_state
    (** State 115.
        Stack shape : a.
        Start symbol: main. *)

  | MenhirState122 : ((('s, _menhir_box_main) _menhir_cell1_list_enum_, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 122.
        Stack shape : list(enum) list(fonc) ID.
        Start symbol: main. *)

  | MenhirState124 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 124.
        Stack shape : fonc.
        Start symbol: main. *)

  | MenhirState126 : (('s, _menhir_box_main) _menhir_cell1_enum, _menhir_box_main) _menhir_state
    (** State 126.
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
  | MenhirCell1_loption_separated_nonempty_list_VIRG_param__ of 's * ('s, 'r) _menhir_state * ((Type.typ * string) list)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Type.typ * string)

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
# 303 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 310 "parser.ml"
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
# 338 "parser.ml"
)

and 's _menhir_cell0_TID = 
  | MenhirCell0_TID of 's * (
# 12 "parser.mly"
       (string)
# 345 "parser.ml"
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
# 359 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_02 =
  fun i ->
    (
# 102 "parser.mly"
                          (IdentAffect(i))
# 367 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_03 =
  fun a1 ->
    (
# 103 "parser.mly"
                          (PointerAffect(a1))
# 375 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_04 =
  fun li ->
    (
# 78 "parser.mly"
                        (li)
# 383 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_05 =
  fun n xs ->
    let lp = 
# 241 "<standard.mly>"
    ( xs )
# 391 "parser.ml"
     in
    (
# 106 "parser.mly"
                                         (AppelFonction (n,lp))
# 396 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun e1 e2 ->
    (
# 107 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 404 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun a1 ->
    (
# 108 "parser.mly"
                          (Acces a1)
# 412 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun () ->
    (
# 109 "parser.mly"
                          (Booleen true)
# 420 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun () ->
    (
# 110 "parser.mly"
                          (Booleen false)
# 428 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e ->
    (
# 111 "parser.mly"
                          (Entier e)
# 436 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 ->
    (
# 112 "parser.mly"
                          (Unaire(Numerateur,e1))
# 444 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 ->
    (
# 113 "parser.mly"
                          (Unaire(Denominateur,e1))
# 452 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 114 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 460 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun e1 e2 ->
    (
# 115 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 468 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun e1 e2 ->
    (
# 116 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 476 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun e1 e2 ->
    (
# 117 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 484 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_17 =
  fun exp ->
    (
# 118 "parser.mly"
                          (exp)
# 492 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_18 =
  fun t ->
    (
# 120 "parser.mly"
                          (New(t))
# 500 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_19 =
  fun i ->
    (
# 121 "parser.mly"
                          (Unaire(Address,Acces(IdentAffect i)))
# 508 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_20 =
  fun () ->
    (
# 122 "parser.mly"
                          (Null)
# 516 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_21 =
  fun id n ->
    (
# 68 "parser.mly"
                                     (Enumerateur(n,id))
# 524 "parser.ml"
     : (Ast.AstSyntax.enum))

let _menhir_action_22 =
  fun li n t xs ->
    let lp = 
# 241 "<standard.mly>"
    ( xs )
# 532 "parser.ml"
     in
    (
# 74 "parser.mly"
                                                              (Fonction(t,n,lp,li))
# 537 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_23 =
  fun e1 n t ->
    (
# 81 "parser.mly"
                                    (Declaration (t,n,e1))
# 545 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun a1 e1 ->
    (
# 82 "parser.mly"
                                    (Affectation (a1,e1))
# 553 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun e n ->
    (
# 83 "parser.mly"
                                    (Constante (n,e))
# 561 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun e1 ->
    (
# 84 "parser.mly"
                                    (Affichage (e1))
# 569 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_27 =
  fun exp li1 li2 ->
    (
# 85 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 577 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_28 =
  fun exp li ->
    (
# 86 "parser.mly"
                                    (TantQue (exp,li))
# 585 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_29 =
  fun exp ->
    (
# 87 "parser.mly"
                                    (Retour (exp))
# 593 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_30 =
  fun () ->
    (
# 88 "parser.mly"
                                    (RetourVoid)
# 601 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_31 =
  fun i xs ->
    let lp = 
# 241 "<standard.mly>"
    ( xs )
# 609 "parser.ml"
     in
    (
# 89 "parser.mly"
                                          (AppelVoid(i,lp))
# 614 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_32 =
  fun l ->
    (
# 70 "parser.mly"
                                             ( l )
# 622 "parser.ml"
     : (string list))

let _menhir_action_33 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 630 "parser.ml"
     : (Ast.AstSyntax.enum list))

let _menhir_action_34 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 638 "parser.ml"
     : (Ast.AstSyntax.enum list))

let _menhir_action_35 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 646 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_36 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 654 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_37 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 662 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_38 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 670 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_39 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 678 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_40 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 686 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_41 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 694 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_42 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 702 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_43 =
  fun len lfi ->
    (
# 66 "parser.mly"
                                  (Main(len,lfi))
# 710 "parser.ml"
     : (Ast.AstSyntax.main))

let _menhir_action_44 =
  fun n t ->
    (
# 76 "parser.mly"
                    ((t,n))
# 718 "parser.ml"
     : (Type.typ * string))

let _menhir_action_45 =
  fun lf li ->
    (
# 72 "parser.mly"
                            (Programme (lf,li))
# 726 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_46 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 734 "parser.ml"
     : (string list))

let _menhir_action_47 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 742 "parser.ml"
     : (string list))

let _menhir_action_48 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 750 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_49 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 758 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_50 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 766 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_51 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 774 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_52 =
  fun () ->
    (
# 92 "parser.mly"
          (Bool)
# 782 "parser.ml"
     : (Type.typ))

let _menhir_action_53 =
  fun () ->
    (
# 93 "parser.mly"
          (Int)
# 790 "parser.ml"
     : (Type.typ))

let _menhir_action_54 =
  fun () ->
    (
# 94 "parser.mly"
          (Rat)
# 798 "parser.ml"
     : (Type.typ))

let _menhir_action_55 =
  fun t ->
    (
# 95 "parser.mly"
             (Pointer_typ t)
# 806 "parser.ml"
     : (Type.typ))

let _menhir_action_56 =
  fun n ->
    (
# 96 "parser.mly"
           (Type_enum n)
# 814 "parser.ml"
     : (Type.typ))

let _menhir_action_57 =
  fun () ->
    (
# 97 "parser.mly"
           (Void)
# 822 "parser.ml"
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
  
  let _menhir_run_123 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_enum_, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_45 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let MenhirCell1_list_enum_ (_menhir_stack, _, len) = _menhir_stack in
          let lfi = _v in
          let _v = _menhir_action_43 len lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_57 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState112 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_105 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
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
              let _menhir_s = MenhirState107 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VAL ->
                  _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TID _v ->
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | PO ->
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NUM ->
                  _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NULL ->
                  _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FALSE ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ENTIER _v ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DENOM ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CO ->
                  _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
      let _v = _menhir_action_55 t in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
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
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState090 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState083 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState031 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState074 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState036 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState096 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState046 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_116 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_a -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_a (_menhir_stack, _menhir_s, a1) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_24 a1 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | TID _v_0 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState112
      | RETURN ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | PRINT ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | PO ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | IF ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | ID _v_1 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState112
      | CONST ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | AF ->
          let _v_2 = _menhir_action_37 () in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState031 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_08 () in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_02 i in
      _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_a : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState030 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState115 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState031 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_a (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_s = MenhirState115 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState036 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NEW ->
          let _menhir_stack = MenhirCell1_NEW (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState058 in
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
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState037 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_20 () in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_039 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | TID _v_0 ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState040
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | ID _v_1 ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState040
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | ENTIER _v_2 ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState040
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | PF ->
              let _v_3 = _menhir_action_39 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
          | _ ->
              _eRR ())
      | AO | CF | EQUAL | INF | MULT | PF | PLUS | PV | SLASH | VIRG ->
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_09 () in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState043 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState044 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_main =
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
      let _v = _menhir_action_56 n in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_015 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_54 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_53 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_52 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MULT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061
      | PO ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let i = _v in
            _menhir_action_01 i
          in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState062 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let a1 = _v in
      let _v = _menhir_action_07 a1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_082 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let i = _v in
          let _v = _menhir_action_02 i in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _ | MULT ->
          let n = _v in
          let _v = _menhir_action_56 n in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | TRUE ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | TID _v ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState083
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_30 () in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PO ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | NUM ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | NULL ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | ID _v ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState083
      | FALSE ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | ENTIER _v ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState083
      | DENOM ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | CO ->
          let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState087 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState090 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TID _v ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PO ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NULL ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ENTIER _v ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DENOM ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CO ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | TID _v_0 ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState096
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | ID _v_1 ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState096
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | ENTIER _v_2 ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState096
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | PF ->
              let _v_3 = _menhir_action_39 () in
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
          | _ ->
              _eRR ())
      | EQUAL ->
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, i) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_31 i xs in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
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
                      let _v = _menhir_action_25 e n in
                      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_113 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState112 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState030 ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_110 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_04 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState122 ->
          _menhir_run_123 _menhir_stack _v _tok
      | MenhirState029 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_118 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_VIRG_param__ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_loption_separated_nonempty_list_VIRG_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_22 li n t xs in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | TID _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState124
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
      | ID _ ->
          let _v_1 = _menhir_action_35 () in
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_125 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_36 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState124 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState012 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_121 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_list_enum_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _menhir_s = MenhirState122 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | VOID ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | TID _v ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030
      | RETURN ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | RAT ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | PRINT ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | PO ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | INT ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | IF ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | ID _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030
      | CONST ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | BOOL ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | AF ->
          let _v = _menhir_action_37 () in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_27 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_092 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState093 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_28 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_108 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_23 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_26 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_29 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_075 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_072 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_066 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState067 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
          let _menhir_s = MenhirState071 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState074 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState077 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_11 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VIRG ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState055 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PF ->
          let x = _v in
          let _v = _menhir_action_48 x in
          _menhir_goto_separated_nonempty_list_VIRG_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_VIRG_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState096 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState040 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_056 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_49 x xs in
      _menhir_goto_separated_nonempty_list_VIRG_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_051 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_40 x in
      _menhir_goto_loption_separated_nonempty_list_VIRG_e__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_VIRG_e__ : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState040 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_050 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_12 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_045 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _menhir_s = MenhirState046 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TID _v ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PO ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NULL ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ENTIER _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DENOM ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CO ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
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
  
  and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MULT ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (n, t) = (_v_0, _v) in
          let _v = _menhir_action_44 n t in
          (match (_tok : MenhirBasics.token) with
          | VIRG ->
              let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState026 in
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
          | PF ->
              let x = _v in
              let _v = _menhir_action_50 x in
              _menhir_goto_separated_nonempty_list_VIRG_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_VIRG_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState026 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState021 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_027 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_51 x xs in
      _menhir_goto_separated_nonempty_list_VIRG_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_024 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_42 x in
      _menhir_goto_loption_separated_nonempty_list_VIRG_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_VIRG_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_VIRG_param__ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState029 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
              | PF ->
                  let _v = _menhir_action_41 () in
                  _menhir_goto_loption_separated_nonempty_list_VIRG_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
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
          let _v_1 = _menhir_action_35 () in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState012 _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_127 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_enum -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_enum (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_34 x xs in
      _menhir_goto_list_enum_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_enum_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
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
          let _v = _menhir_action_46 x in
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
      let _v = _menhir_action_32 l in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_TID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_ENUM (_menhir_stack, _menhir_s) = _menhir_stack in
          let id = _v in
          let _v = _menhir_action_21 id n in
          let _menhir_stack = MenhirCell1_enum (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | ENUM ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
          | BOOL | ID _ | INT | RAT | TID _ | VOID ->
              let _v_0 = _menhir_action_33 () in
              _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_TID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_TID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_47 x xs in
      _menhir_goto_separated_nonempty_list_VIRG_TID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ENUM ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | BOOL | ID _ | INT | RAT | TID _ | VOID ->
          let _v = _menhir_action_33 () in
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
