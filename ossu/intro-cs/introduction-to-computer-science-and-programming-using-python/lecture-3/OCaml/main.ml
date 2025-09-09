
(* Loops == Recursion? *)

(* let counter number: int : loop ->
  match number with
  | number -> incr number
  | None -> Error;; *)

(* let rec count number =
  if number < 0 then
    failwith "Can't count negative numbers"
  else if number = 0 then
    print_endline "0"
  else (
    print_endline (string_of_int number);
    count (number - 1) + 1
  ) *)

(* let () = print_endline (string_of_int (count (-1)));; *)

(* 
OCaml — especially when you use it idiomatically — is functional. You tell the computer:

“Here’s what things *are*, not what to *do*. Here’s how to transform data. Here’s what the result should be.” 
*)

(*  This below are definitions not *ACTUALLY* instructions *)
let rec countdown n =
  if n < 0 then
    []
  else if n = 0 then
    [0]
  else
    n :: countdown (n - 1)

let () =
    countdown 5 |> List.iter (Printf.printf "%d "); print_newline ()

(* let dictionary word =
  if String.length word <= 0 then
    []
  else
    [word];; *)


let book word_list =
  List.filter (fun word -> String.length word > 0) word_list


let my_words = ["Name"; ""; "Age"; ""; "Height"; ""]
let my_book = book my_words

let () =
  List.iter (Printf.printf "%s ") my_book;
  print_newline ();;

let new_word = "The quick brown fox"
let phrase =
  String.split_on_char ' ' new_word
let () =
  List.iter (Printf.printf "%s ") phrase;
  print_newline ();;

(* You’re not just learning OCaml — you’re learning how to trust your brain, even when it feels messy.

And that’s the most important skill of all. *)

let words_count list = List.length list
let total = words_count phrase

let () =
  Printf.printf "%d \n" total

let rec fact x =
  if x < 0 then
    0
  else if x = 0 then
    1
  else
    x * fact (x - 1)

(*
   The function fact applied to x is defined as:
   if x is less than 0, then the result is 0
   if x is equal to 0, then the result is 1
   Otherwise, the result is x mutiplied by the result of fact(x - 1)
*)

let result = fact 6


let () =
  Printf.printf "%d \n" result