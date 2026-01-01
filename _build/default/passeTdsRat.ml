(* Module de la passe de gestion des identifiants *)
open Tds
open Exceptions
open Ast

type t1 = Ast.AstSyntax.main
type t2 = Ast.AstTds.main

(* analyse_tds_affectable : tds -> AstSyntax.affectable -> AstTds.affectable *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre a : l'affectable à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'affectable
en un affectabe de type AstTds.affectable *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_affectable tds a =

  match a with 
    (**)
    | AstSyntax.IdentAffect nom ->

      begin match chercherGlobalement tds nom with 
        | Some ia ->
              begin match info_ast_to_info ia with
                | InfoFun _ -> raise (MauvaiseUtilisationIdentifiant nom)
                | _ -> AstTds.IdentAffect ia
              end 
              
        | None -> 
            raise(IdentifiantNonDeclare nom)
        end

    | AstSyntax.PointerAffect a -> 

        let na = analyse_tds_affectable tds a in AstTds.PointerAffect na


(* analyse_tds_expression : tds -> AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e = 
   match e with

   | AstSyntax.Booleen (b) ->
      AstTds.Booleen (b)

   | AstSyntax.Null -> AstTds.Null 

   | AstSyntax.AppelFonction (nom, exps) ->
    begin match chercherGlobalement tds nom with
    | None -> raise (IdentifiantNonDeclare nom)
    | Some info ->
        begin
        match info_ast_to_info info with
        | InfoFun _ ->
            let new_exps = List.map (analyse_tds_expression tds) exps in
            AstTds.AppelFonction(info, new_exps)
        | _ ->
            raise (MauvaiseUtilisationIdentifiant nom)
        end
    end

    | AstSyntax.Acces (a) ->
        let na = analyse_tds_affectable tds a in
        AstTds.Acces na

    | AstSyntax.Entier (n) ->
      AstTds.Entier (n)

    | AstSyntax.Unaire (ui, exp) ->
      let exp2 = analyse_tds_expression tds exp in 
      AstTds.Unaire(ui, exp2)

    | AstSyntax.Binaire (bi, expa, expb) ->
        let exp1 = analyse_tds_expression tds expa in 
        let exp2 = analyse_tds_expression tds expb in 
      AstTds.Binaire (bi, exp1, exp2)

    | AstSyntax.New(t) -> AstTds.New(t)



(* analyse_tds_instruction : tds -> info_ast option -> AstSyntax.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds oia i =
  match i with
  | AstSyntax.Declaration (t, n, e) ->
      begin
        match chercherLocalement tds n with
        | None ->
            (* L'identifiant n'est pas trouvé dans la tds locale,
            il n'a donc pas été déclaré dans le bloc courant *)
            (* Vérification de la bonne utilisation des identifiants dans l'expression *)
            (* et obtention de l'expression transformée *)
            let ne = analyse_tds_expression tds e in
            (* Création de l'information associée à l'identfiant *)
            let info = InfoVar (n,Undefined, 0, "") in
            (* Création du pointeur sur l'information *)
            let ia = info_to_info_ast info in
            (* Ajout de l'information (pointeur) dans la tds *)
            ajouter tds n ia;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            AstTds.Declaration (t, ia, ne)
        | Some _ ->
            (* L'identifiant est trouvé dans la tds locale,
            il a donc déjà été déclaré dans le bloc courant *)
            raise (DoubleDeclaration n)
      end
  | AstSyntax.Affectation (a,e) ->
              let na = analyse_tds_affectable tds a in 
              (* Vérification de la bonne utilisation des identifiants dans l'expression *)
              (* et obtention de l'expression transformée *)
              (* INTERDICTION d'affecter une constante *)
              begin match na with
              | AstTds.IdentAffect ia ->
                  begin match info_ast_to_info ia with
                  | InfoConst (nom, _) -> raise (MauvaiseUtilisationIdentifiant (nom))
                  | _ -> ()
                  end
              | AstTds.PointerAffect _ ->
                  ()  
              end;
              let ne = analyse_tds_expression tds e in
              (* Renvoie de la nouvelle affectation où le nom a été remplacé par l'information
                 et l'expression remplacée par l'expression issue de l'analyse *)
              AstTds.Affectation (na, ne)
            
  | AstSyntax.Constante (n,v) ->
      begin
        match chercherLocalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds locale,
             il n'a donc pas été déclaré dans le bloc courant *)
          (* Ajout dans la tds de la constante *)
          ajouter tds n (info_to_info_ast (InfoConst (n,v)));
          (* Suppression du noeud de déclaration des constantes devenu inutile *)
          AstTds.Empty
        | Some _ ->
          (* L'identifiant est trouvé dans la tds locale,
          il a donc déjà été déclaré dans le bloc courant *)
          raise (DoubleDeclaration n)
      end
  | AstSyntax.Affichage e ->
      (* Vérification de la bonne utilisation des identifiants dans l'expression *)
      (* et obtention de l'expression transformée *)
      let ne = analyse_tds_expression tds e in
      (* Renvoie du nouvel affichage où l'expression remplacée par l'expression issue de l'analyse *)
      AstTds.Affichage (ne)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let tast = analyse_tds_bloc tds oia t in
      (* Analyse du bloc else *)
      let east = analyse_tds_bloc tds oia e in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      AstTds.Conditionnelle (nc, tast, east)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let bast = analyse_tds_bloc tds oia b in
      (* Renvoie la nouvelle structure de la boucle *)
      AstTds.TantQue (nc, bast)
  | AstSyntax.Retour (e) ->
      begin
      (* On récupère l'information associée à la fonction à laquelle le return est associée *)
      match oia with
        (* Il n'y a pas d'information -> l'instruction est dans le bloc principal : erreur *)
      | None -> raise RetourDansMain
        (* Il y a une information -> l'instruction est dans une fonction *)
      | Some ia ->
        (* Analyse de l'expression *)
        let ne = analyse_tds_expression tds e in
        AstTds.Retour (ne,ia)
      end
  | AstSyntax.RetourVoid -> 
      begin
      (* On récupère l'information associée à la fonction à laquelle le return est associée *)
      match oia with
        (* Il n'y a pas d'information -> l'instruction est dans le bloc principal : erreur *)
      | None -> raise RetourDansMain
        (* Il y a une information -> l'instruction est dans une fonction *)
      | Some ia ->
        AstTds.RetourVoid (ia)
      end

  |AstSyntax.AppelVoid(nom,exps) ->
    begin match chercherGlobalement tds nom with
    | None -> raise (IdentifiantNonDeclare nom)
    | Some info ->
        begin
        match info_ast_to_info info with
        | InfoFun _ ->
            let new_exps = List.map (analyse_tds_expression tds) exps in
            AstTds.AppelVoid(info, new_exps)
        | _ ->
            raise (MauvaiseUtilisationIdentifiant nom)
        end
    end


(* analyse_tds_bloc : tds -> info_ast option -> AstSyntax.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds oia li =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsbloc = creerTDSFille tds in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc.
     Cette tds est modifiée par effet de bord *)
   let nli = List.map (analyse_tds_instruction tdsbloc oia) li in
   (* afficher_locale tdsbloc ; *) (* décommenter pour afficher la table locale *)
   nli


(* analyse_tds_fonction : tds -> AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds (AstSyntax.Fonction(t,n,lp,li))  = 
  begin 
  match chercherLocalement maintds n with 
    | Some _ -> raise (DoubleDeclaration n)
    | None -> let info = InfoFun(n,Undefined,[]) in 
              let nv_info = info_to_info_ast info in 
              ajouter maintds n nv_info ;
              let fil = creerTDSFille maintds in

              let nlp = List.map (fun(typ, nom) -> 
                    match chercherLocalement fil nom with
                     | Some _ -> raise (DoubleDeclaration nom)
                      | None -> let info_var = info_to_info_ast (InfoVar(nom, typ , 0 , "")) in 
                      ajouter fil nom info_var ;
                      (typ , info_var)
                      
              ) lp 
              in 
              let nli = analyse_tds_bloc fil (Some nv_info) li in
              AstTds.Fonction(t, nv_info, nlp, nli)
  end 
  
let analyse_tds_enum maintds (AstSyntax.Enumerateur(nom,l_enum)) = 
  begin 
    match chercherGlobalement maintds nom with 
      |Some _ -> raise (DoubleDeclaration nom) 
      |None -> let info = InfoEnum(nom,0,List.length l_enum) in 
                ajouter maintds nom (info_to_info_ast(info)) ;
                List.iteri (fun index n -> 
                match chercherGlobalement maintds n with 
                | Some _ -> raise (DoubleDeclaration n)
                | None -> 
                    let info = info_to_info_ast(InfoVar(n, Type_enum nom, index, "ENUM")) in 
                    ajouter maintds n info 
                ) l_enum;
                AstTds.Enumerateur(nom,l_enum)
  end

let analyse_tds_programme tds (AstSyntax.Programme (fonctions,prog)) =
  let nf = List.map (analyse_tds_fonction tds) fonctions in
  let nb = analyse_tds_bloc tds None prog in
  AstTds.Programme (nf,nb)


(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Main (l_enum,AstSyntax.Programme (fonctions,prog))) =
  let tds = creerTDSMere () in
  let ne = List.map (analyse_tds_enum tds) l_enum in
  let np = analyse_tds_programme tds (AstSyntax.Programme(fonctions,prog)) in
  AstTds.Main (ne,np)

