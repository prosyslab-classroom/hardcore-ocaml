let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let to_string_unopt lst = List.fold_left (fun s n -> s ^ string_of_int n) "" lst
let to_string_opt lst = failwith "Not implemented"

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let init_list = List.init n Fun.id in
  let to_string = if !opt then to_string_opt else to_string_unopt in
  let to_string_list = to_string init_list in
  String.length to_string_list |> Printf.printf "%d\n"

let _ = main ()
