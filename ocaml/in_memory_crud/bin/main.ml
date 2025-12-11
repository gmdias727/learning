(* open Core;; *)

let () = print_endline "\nHello, World!\n"

type todo = {
    id: int;
    mutable title : string;
    mutable edition: int;
    release_date: Ptime.t option
};;

type todo_list = {
    mutable todos : todo list
}

let format_ptime_option (time_opt : Ptime.t option) : string =
    match time_opt with
    | Some ptime_val ->
        let time_str = Ptime.to_rfc3339 ptime_val in
        Printf.sprintf "%s" time_str
    | None ->
        "No time provided";;

(* let hardcoded_ptime =
    match Ptime.of_date_time ((2025, 12, 10), ((12, 30, 0), 0)) with
    | Some ptime -> ptime
    | None -> failwith "Invalid ptime value";; *)


(* let prepare_item (id: int): int =
    match todo_list with
    | List.length todo_list *)

(* let pp_todo fmt { id; title; edition; release_date} =
    let release_date_string = format_ptime_option release_date in
    Format.fprintf fmt "{id = %d; title = \"%s\"; edition = %d; release_date = \"%s\"}" id title edition release_date_string;; *)

(* let pp_todo_yojson json_fmt { id; title; edition; release_date } =
    let release_date_string = format_ptime_option release_date in
    Yojson.write_json json_fmt;;
    Yojson.write_int id json_fmt;; *)

let pp_todo_yojson json_fmt { id; title; edition; release_date; _} =
    let release_date_string = format_ptime_option release_date in
    let json = `Assoc [
        ("id", `Int id);
        ("title", `String title);
        ("edition", `Int edition);
        ("release_date", `String release_date_string);
        ("jump", `String "\n");
    ] in
    Yojson.pretty_print json_fmt json;;
    

let create_todo id title edition release_date = { id; title; edition; release_date };;

let my_todo_list = { todos = [] };;

let add_todo todo =
    my_todo_list.todos <- todo :: my_todo_list.todos;;

let remove_todo_from_list_by_id id =
    my_todo_list.todos <- List.filter (fun todo -> todo.id <> id) my_todo_list.todos;;
    (* todo_list := List.filter (fun todo -> todo.title <> title) !todo_list;; *)


(* let print_todos () = List.iter (fun todo -> Format.printf "%a\n" pp_todo todo) my_todo_list.todos;; *)

let print_todos_as_json () =
    List.iter (fun todo -> Format.printf "%a" pp_todo_yojson todo) my_todo_list.todos;;

(* let print_todos_as_json () =
    print_endline "[";
    let rec print_list = function
        | [] -> ()
        | [last] -> Format.printf "  %a\n" pp_todo_yojson last
        | todo :: rest ->
            Format.printf "  %a,\n" pp_todo_yojson todo;
            print_list rest;
        in
        print_list my_todo_list.todos;
        print_endline "]";; *)

(* let () =
    let todo1 = create_todo 1 "Learning OCaml" 1 None in
    let todo2 = create_todo 2 "Learning Elixir" 1 None in

    add_todo todo1;
    add_todo todo2;
    print_endline "Todos after adding:";
    print_todos ();

    remove_todo_from_list_by_id 1;
    print_endline "Todos after removing id 1:";
    print_todos (); *)

(* let release_date_helper =
    match Ptime.of_rfc3339 "2025-12-10T21:53:00Z" with
    | Ok (ptime, _, _) -> ptime
    | Error _ -> failwith "Invalid RFC3339 date format" *)

let release_date_helper str =
    match Ptime.of_rfc3339 str with
    | Ok (ptime, _, _) -> ptime
    | Error _ -> failwith "Invalid RFC3339 date format"


let () =
    let todo1 = create_todo 1 "Learning OCaml" 1 None in
    (* let todo2 = create_todo 2 "Learning Elixir" 2 None in
    let todo3 = create_todo 3 "Learning Clojure" 3 
        (Some (release_date_helper "2025-12-10T21:53:00Z")) in *)

    (* add_todo todo1;
    add_todo todo2;
    add_todo todo3;
    print_endline "Todos after adding:"; *)
    print_todos_as_json ();

    (* remove_todo_from_list_by_id 1;
    print_endline "Todos after removing id 1:";
    print_todos_as_json (); *)

    add_todo todo1;
    todo1.title <- "I'm learning!";
    todo1.edition <- 25;
    print_todos_as_json ();
