let () = print_endline "\nHello, World!\n"

type todo_list = {
    mutable title : string;
    mutable edition: int;
    mutable release_date: Ptime.t option
};;

let format_ptime_option (time_opt : Ptime.t option) : string =
    match time_opt with
    | Some ptime_val ->
        let time_str = Ptime.to_rfc3339 ptime_val in
        Printf.sprintf "%s" time_str
    | None ->
        "No time provided";;

let pp_todo fmt { title; edition; release_date} =
    let release_date_string = format_ptime_option release_date in
    Format.fprintf fmt "{ title = \"%s\"; edition = \"%d\"; release_date = \"%s\"}" title edition release_date_string;;

let create_todo title edition = { title; edition; release_date};;

let () =
