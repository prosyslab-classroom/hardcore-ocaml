let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]

let read_file_unopt filename =
  let file = open_in filename in
  let rec read_lines acc =
    try
      let line = input_line file in
      read_lines (line :: acc)
    with End_of_file -> List.rev acc
  in
  let lines = read_lines [] in
  close_in file;
  lines

let read_file_opt filename = failwith "Not implemented"

let count lst =
  List.fold_left
    (fun c line ->
      let n = int_of_string line in
      if n mod 2 = 0 then c + 1 else c)
    0 lst

let main () =
  Arg.parse options (fun x -> input := x) "";
  let read_file = if !opt then read_file_opt else read_file_unopt in
  read_file !input |> count |> Printf.printf "%d\n"

let _ = main ()
