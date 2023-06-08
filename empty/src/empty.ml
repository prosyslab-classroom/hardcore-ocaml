let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let empty_list = []
let non_empty_list = List.init 10000 Fun.id

let long_list n =
  List.init n (fun _ -> if Random.bool () then empty_list else non_empty_list)

let empty_unopt lst =
  List.fold_left (fun n lst -> if List.length lst = 0 then n + 1 else n) 0 lst

let empty_opt lst = failwith "Not implemented"

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let init_list = long_list n in
  let empty = if !opt then empty_opt else empty_unopt in
  let empty_list = empty init_list in
  Printf.printf "%d\n" empty_list

let _ = main ()
