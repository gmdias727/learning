let speak2 () = 
  print_endline "Hello from my first module (or is it a library?)"

let show_sqlite_version () = "aaaaaaaaa"

let is_cpf_length_valid (cpf : string) : bool =
  match String.length cpf with
  | 11 -> true
  | _ -> false;;

let crop_cpf_special_characters (cpf_string : string) : string =
  String.to_seq cpf_string
  |> Seq.filter (fun c -> c >= '0' && c <= '9')
  |> String.of_seq

let cpf_builder (cpf : string) : string =
  is_cpf_length_valid cpf;;
  crop_cpf_special_characters cpf;


  (* "488.350.508-12" *)