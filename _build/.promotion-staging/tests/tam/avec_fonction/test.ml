open Rat
open Compilateur

(* Changer le chemin d'accès du jar. *)
let runtamcmde = "java -jar ../../../../../tests/runtam.jar"
(* let runtamcmde = "java -jar /mnt/n7fs/.../tools/runtam/runtam.jar" *)

(* Execute the TAM code obtained from the rat file and return the ouptut of this code *)
let runtamcode cmde ratfile =
  let tamcode = compiler ratfile in
  let (tamfile, chan) = Filename.open_temp_file "test" ".tam" in
  output_string chan tamcode;
  close_out chan;
  let ic = Unix.open_process_in (cmde ^ " " ^ tamfile) in
  let printed = input_line ic in
  close_in ic;
  Sys.remove tamfile;    (* à commenter si on veut étudier le code TAM. *)
  String.trim printed

(* Compile and run ratfile, then print its output *)
let runtam ratfile =
  print_string (runtamcode runtamcmde ratfile)

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/tam/avec_fonction/fichiersRat/"

(**********)
(*  TESTS *)
(**********)


(* requires ppx_expect in jbuild, and `opam install ppx_expect` *)
let%expect_test "testfun1" =
  runtam (pathFichiersRat^"testfun1.rat");
  [%expect{| 1 |}]

let%expect_test "testfun2" =
  runtam (pathFichiersRat^"testfun2.rat");
  [%expect{| 7 |}]

let%expect_test "testfun3" =
  runtam (pathFichiersRat^"testfun3.rat");
  [%expect{| 10 |}]

let%expect_test "testfun4" =
  runtam (pathFichiersRat^"testfun4.rat");
  [%expect{| 10 |}]

let%expect_test "testfun5" =
  runtam (pathFichiersRat^"testfun5.rat");
  [%expect{| |}]

let%expect_test "testfun6" =
  runtam (pathFichiersRat^"testfun6.rat");
  [%expect{|truetrue|}]

let%expect_test "testfuns" =
  runtam (pathFichiersRat^"testfuns.rat");
  [%expect{| 28 |}]

let%expect_test "factrec" =
  runtam (pathFichiersRat^"factrec.rat");
  [%expect{| 120 |}]

let%expect_test "testPointerFunc" =
  runtam (pathFichiersRat^"testPointerFunc.rat");
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Failure
    "Pointeurs imbriqu\195\169s complexes non g\195\169r\195\169s dans cette snippet simplifi\195\169")
  Raised at Stdlib.failwith in file "stdlib.ml", line 29, characters 17-33
  Called from Rat__PasseCodeRatToTam.analyse_code_instruction in file "PasseCodeRatToTam.ml", line 168, characters 37-64
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc.(fun) in file "PasseCodeRatToTam.ml", line 213, characters 18-44
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Rat__PasseCodeRatToTam.analyser in file "PasseCodeRatToTam.ml", line 250, characters 4-26
  Called from Rat__Compilateur.compiler in file "compilateur.ml", line 96, characters 28-57
  Called from Avec_fonction_tam__Test.runtamcode in file "tests/tam/avec_fonction/test.ml", line 10, characters 16-32
  Called from Avec_fonction_tam__Test.runtam in file "tests/tam/avec_fonction/test.ml" (inlined), line 22, characters 15-46
  Called from Avec_fonction_tam__Test.(fun) in file "tests/tam/avec_fonction/test.ml", line 69, characters 2-48
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "testenum1" =
  runtam (pathFichiersRat^"testenum1.rat");
  [%expect{| falsetrue |}]


let%expect_test "testvoid1" =
  runtam (pathFichiersRat^"testvoid1.rat");
  [%expect{| [1/2][3/4][5/4] |}]

let%expect_test "testTout" =
  runtam (pathFichiersRat^"testTout.rat");
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Failure "Implementation pointer complex")
  Raised at Stdlib.failwith in file "stdlib.ml", line 29, characters 17-33
  Called from Rat__PasseCodeRatToTam.analyse_code_instruction in file "PasseCodeRatToTam.ml", line 165, characters 22-54
  Called from Rat__PasseCodeRatToTam.analyse_code_fonction.(fun) in file "PasseCodeRatToTam.ml", line 238, characters 35-63
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Rat__PasseCodeRatToTam.analyse_code_fonction in file "PasseCodeRatToTam.ml", line 238, characters 4-75
  Called from Rat__PasseCodeRatToTam.analyser.(fun) in file "PasseCodeRatToTam.ml", line 248, characters 35-60
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 126, characters 16-37
  Called from Rat__PasseCodeRatToTam.analyser in file "PasseCodeRatToTam.ml", line 248, characters 4-80
  Called from Rat__Compilateur.compiler in file "compilateur.ml", line 96, characters 28-57
  Called from Avec_fonction_tam__Test.runtamcode in file "tests/tam/avec_fonction/test.ml", line 10, characters 16-32
  Called from Avec_fonction_tam__Test.runtam in file "tests/tam/avec_fonction/test.ml" (inlined), line 22, characters 15-46
  Called from Avec_fonction_tam__Test.(fun) in file "tests/tam/avec_fonction/test.ml", line 82, characters 2-41
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]