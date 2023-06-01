let random_string () = Random.int 1000000000 |> string_of_int

let generate oc num_of_lines =
  let rec loop n =
    if n = 0 then ()
    else
      let s = random_string () in
      output_string oc s;
      output_char oc '\n';
      loop (n - 1)
  in
  loop num_of_lines

let main argv =
  let num_of_lines = argv.(1) |> int_of_string in
  let oc = open_out "large.txt" in
  generate oc num_of_lines;
  close_out oc

let _ = main Sys.argv
