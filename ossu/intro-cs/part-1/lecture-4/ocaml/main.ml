
let is_even numbers_item =
  List.filter (fun number -> number mod 2 == 0) numbers_item

let my_numbers = [1; 2; 3; 4; 5; 6]
let my_dict = is_even my_numbers

let () =
  is_even my_numbers |> List.iter (Printf.printf "%d, "); print_newline ()


let rec even_numbers numbers =
  match numbers with
  | [] -> []
  | l_start :: l_end ->
    if l_start mod 2 = 0 then
      l_start :: even_numbers l_end
    else
      even_numbers l_end

(*
Given a non-empty list, take its first element x, and add it to the sum
of the remaining elements
*)
let rec sum = function
| [] -> 0
| x :: xs -> x + sum xs

(* Keep renaming variables until they make sense. *)
let rec sum = function
  | [] -> 0
  | first :: rest -> first + sum rest

let rec sum (lst: int list): int =
  match lst with
  | [] -> 0
  | (first: int) :: (rest: int list) -> first + sum rest

(*
  your type = your constructors.
*)
type 'a my_own_list =
  | Empty
  | Cons of 'a * 'a my_own_list

let rec sum (lst: int my_own_list): int =
  match lst with
  | Empty -> 0
  | Cons (first, rest) -> first + sum rest