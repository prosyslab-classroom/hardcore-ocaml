let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let long_list n = List.init n (fun _ -> Random.int 10000000 |> string_of_int)

let filter_unopt lst =
  List.filter
    (fun n ->
      let regexp = Str.regexp ".*9.*9.*" in
      Str.string_match regexp n 0)
    lst

let filter_opt lst = failwith "Not implemented"

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let init_list = long_list n in
  let filter = if !opt then filter_opt else filter_unopt in
  let filter_list = filter init_list in
  List.length filter_list |> Printf.printf "%d\n"

let _ = main ()
