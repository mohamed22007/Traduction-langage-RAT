/* Imports. */

%{

open Type
open Ast.AstSyntax
%}


%token <int> ENTIER
%token <string> ID
%token <string> TID
%token RETURN
%token VIRG
%token PV
%token AO
%token AF
%token PF
%token PO
%token EQUAL
%token CONST
%token PRINT
%token IF
%token ELSE
%token WHILE
%token BOOL
%token INT
%token RAT
%token CO
%token CF
%token SLASH
%token NUM
%token DENOM
%token TRUE
%token FALSE
%token PLUS
%token MULT
%token INF
%token EOF


%token NULL
%token NEW
%token VAL

%token ENUM

%token VOID

(* Type de l'attribut synthétisé des non-terminaux *)
%type <programme> prog
%type <instruction list> bloc
%type <fonction> fonc
%type <instruction> i
%type <typ> typ
%type <typ*string> param
%type <expression> e 
%type <affectable> a
%type <string list> ids

(* Type et définition de l'axiome *)
%start <Ast.AstSyntax.main> main

%%

main : len=enum* lfi=prog EOF     {Main(len,lfi)}

enum : ENUM n=TID AO id=ids AF PV    {Enumerateur(n,id)}

ids : l=separated_nonempty_list(VIRG, TID)   { l }

prog : lf=fonc* ID li=bloc  {Programme (lf,li)}

fonc : t=typ n=ID PO lp=separated_list(VIRG,param) PF li=bloc {Fonction(t,n,lp,li)}

param : t=typ n=ID  {(t,n)}

bloc : AO li=i* AF      {li}

i :
| t=typ n=ID EQUAL e1=e PV          {Declaration (t,n,e1)}
| a1=a EQUAL e1=e PV                {Affectation (a1,e1)} (**)
| CONST n=ID EQUAL e=ENTIER PV      {Constante (n,e)}
| PRINT e1=e PV                     {Affichage (e1)}
| IF exp=e li1=bloc ELSE li2=bloc   {Conditionnelle (exp,li1,li2)}
| WHILE exp=e li=bloc               {TantQue (exp,li)}
| RETURN exp=e PV                   {Retour (exp)}
| RETURN PV                         {RetourVoid}
| i=ID PO lp=separated_list(VIRG,e) PF PV {AppelVoid(i,lp)}

typ :
| BOOL    {Bool}
| INT     {Int}
| RAT     {Rat} 
| t=typ MULT {Pointer_typ t} 
| n=TID    {Type_enum n}
| VOID     {Void}


a :
| i=ID                    {IdentAffect(i)}
| i=TID                   {IdentAffect(i)}
| PO MULT a1=a PF         {PointerAffect(a1)}

e : 
| n=ID PO lp=separated_list(VIRG,e) PF   {AppelFonction (n,lp)}
| CO e1=e SLASH e2=e CF   {Binaire(Fraction,e1,e2)}
| a1=a                    {Acces a1}
| TRUE                    {Booleen true}
| FALSE                   {Booleen false}
| e=ENTIER                {Entier e}
| NUM e1=e                {Unaire(Numerateur,e1)}
| DENOM e1=e              {Unaire(Denominateur,e1)}
| PO e1=e PLUS e2=e PF    {Binaire (Plus,e1,e2)}
| PO e1=e MULT e2=e PF    {Binaire (Mult,e1,e2)}
| PO e1=e EQUAL e2=e PF   {Binaire (Equ,e1,e2)}
| PO e1=e INF e2=e PF     {Binaire (Inf,e1,e2)}
| PO exp=e PF             {exp}
(* New *)
| PO NEW t=typ PF         {New(t)} 
| VAL i=ID                {Unaire(Address,Acces(IdentAffect i))} 
| NULL                    {Null}