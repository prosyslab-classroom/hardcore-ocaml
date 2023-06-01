let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let rec length_unopt l = match l with [] -> 0 | _ :: t -> 1 + length_unopt t
let length_opt l = failwith "Not implemented"

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let length = if !opt then length_opt else length_unopt in
  List.init n (fun _ -> 0) |> length |> Printf.printf "%d\n"

let _ = main ()
