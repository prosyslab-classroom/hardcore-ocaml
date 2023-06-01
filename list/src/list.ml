let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]

let square_unopt lst =
  List.fold_left (fun result n -> result @ [ n * n ]) [] lst

let square_opt lst = failwith "Not implemented"
let check lst1 lst2 = List.for_all2 (fun x y -> x * x = y) lst1 lst2

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let init_list = List.init n Fun.id in
  let square = if !opt then square_opt else square_unopt in
  let square_list = square init_list in
  check init_list square_list |> Printf.printf "%B\n"

let _ = main ()
