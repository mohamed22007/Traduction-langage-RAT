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

let pathFichiersRat = "../../../../../tests/tam/sans_fonction/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

(* requires ppx_expect in jbuild, and `opam install ppx_expect` *)

let%expect_test "testprintint" =
  runtam (pathFichiersRat^"testprintint.rat");
  [%expect{| 42 |}]

let%expect_test "testprintbool" =
  runtam (pathFichiersRat^"testprintbool.rat");
  [%expect{| true |}]

let%expect_test "testprintrat" =
   runtam (pathFichiersRat^"testprintrat.rat");
   [%expect{| [4/5] |}]

let%expect_test "testaddint" =
  runtam (pathFichiersRat^"testaddint.rat");
  [%expect{| 42 |}]

let%expect_test "testaddrat" =
  runtam (pathFichiersRat^"testaddrat.rat");
  [%expect{| [7/6] |}]

let%expect_test "testmultint" =
  runtam (pathFichiersRat^"testmultint.rat");
  [%expect{| 440 |}]

let%expect_test "testmultrat" =
  runtam (pathFichiersRat^"testmultrat.rat");
  [%expect{| [14/3] |}]

let%expect_test "testnum" =
  runtam (pathFichiersRat^"testnum.rat");
  [%expect{| 4 |}]

let%expect_test "testdenom" =
  runtam (pathFichiersRat^"testdenom.rat");
  [%expect{| 7 |}]

let%expect_test "testwhile1" =
  runtam (pathFichiersRat^"testwhile1.rat");
  [%expect{| 19 |}]

let%expect_test "testif1" =
  runtam (pathFichiersRat^"testif1.rat");
  [%expect{| 18 |}]

let%expect_test "testif2" =
  runtam (pathFichiersRat^"testif2.rat");
  [%expect{| 21 |}]

let%expect_test "factiter" =
  runtam (pathFichiersRat^"factiter.rat");
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)
  (Failure error)
  Raised at Stdlib.failwith in file "stdlib.ml", line 29, characters 17-33
  Called from Rat__PasseCodeRatToTam.analyse_code_expression in file "PasseCodeRatToTam.ml", line 41, characters 23-49
  Called from Rat__PasseCodeRatToTam.analyse_code_expression in file "PasseCodeRatToTam.ml", line 42, characters 23-49
  Called from Rat__PasseCodeRatToTam.analyse_code_instruction in file "PasseCodeRatToTam.ml", line 90, characters 22-47
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc.(fun) in file "PasseCodeRatToTam.ml", line 106, characters 34-62
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc in file "PasseCodeRatToTam.ml", line 106, characters 4-74
  Called from Rat__PasseCodeRatToTam.analyser in file "PasseCodeRatToTam.ml", line 113, characters 4-26
  Called from Rat__Compilateur.compiler in file "compilateur.ml", line 96, characters 28-57
  Called from Sans_fonction_tam__Test.runtamcode in file "tests/tam/sans_fonction/test.ml", line 10, characters 16-32
  Called from Sans_fonction_tam__Test.runtam in file "tests/tam/sans_fonction/test.ml" (inlined), line 22, characters 15-46
  Called from Sans_fonction_tam__Test.(fun) in file "tests/tam/sans_fonction/test.ml", line 85, characters 2-41
  Called from Ppx_expect_runtime__Test_block.Configured.dump_backtrace in file "runtime/test_block.ml", line 142, characters 10-28
  |}]

let%expect_test "complique" =
  runtam (pathFichiersRat^"complique.rat");
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)
  (Failure error)
  Raised at Stdlib.failwith in file "stdlib.ml", line 29, characters 17-33
  Called from Rat__PasseCodeRatToTam.analyse_code_expression in file "PasseCodeRatToTam.ml", line 41, characters 23-49
  Called from Rat__PasseCodeRatToTam.analyse_code_expression in file "PasseCodeRatToTam.ml", line 41, characters 23-49
  Called from Rat__PasseCodeRatToTam.analyse_code_instruction in file "PasseCodeRatToTam.ml", line 71, characters 22-47
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc.(fun) in file "PasseCodeRatToTam.ml", line 106, characters 34-62
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc in file "PasseCodeRatToTam.ml", line 106, characters 4-74
  Called from Rat__PasseCodeRatToTam.analyse_code_instruction in file "PasseCodeRatToTam.ml", line 96, characters 8-27
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc.(fun) in file "PasseCodeRatToTam.ml", line 106, characters 34-62
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Stdlib__List.fold_right in file "list.ml", line 128, characters 16-37
  Called from Rat__PasseCodeRatToTam.analyse_code_bloc in file "PasseCodeRatToTam.ml", line 106, characters 4-74
  Called from Rat__PasseCodeRatToTam.analyser in file "PasseCodeRatToTam.ml", line 113, characters 4-26
  Called from Rat__Compilateur.compiler in file "compilateur.ml", line 96, characters 28-57
  Called from Sans_fonction_tam__Test.runtamcode in file "tests/tam/sans_fonction/test.ml", line 10, characters 16-32
  Called from Sans_fonction_tam__Test.runtam in file "tests/tam/sans_fonction/test.ml" (inlined), line 22, characters 15-46
  Called from Sans_fonction_tam__Test.(fun) in file "tests/tam/sans_fonction/test.ml", line 89, characters 2-42
  Called from Ppx_expect_runtime__Test_block.Configured.dump_backtrace in file "runtime/test_block.ml", line 142, characters 10-28
  |}]

