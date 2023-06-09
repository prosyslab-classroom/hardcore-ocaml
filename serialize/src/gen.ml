let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let long_list n = List.init n (fun _ -> Random.int 10000000 |> string_of_int)

let generate_unopt oc lst =
  List.iter
    (fun n ->
      output_string oc n;
      output_char oc '\n')
    lst

let generate_opt oc lst = failwith "Not implemeneted"

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let init_list = long_list n in
  let oc = open_out "large.out" in
  let generate = if !opt then generate_opt else generate_unopt in
  generate oc init_list;
  close_out oc

let _ = main ()
