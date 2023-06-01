let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let lst1 = List.init 1000000 (fun _ -> 1)
let lst2 = List.init 1000000 (fun _ -> 2)

let generate n =
  let rec loop n acc =
    if n = 0 then acc
    else if Random.bool () then lst1 :: acc |> loop (n - 1)
    else lst2 :: acc |> loop (n - 1)
  in
  loop n []

let count_unopt ll =
  let rec loop ll acc =
    match ll with
    | [] -> acc
    | l :: t -> if l = lst1 then acc + 1 |> loop t else loop t acc
  in
  loop ll 0

let count_opt ll = failwith "Not implemented"

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let count = if !opt then count_opt else count_unopt in
  let ll = generate n in
  count ll |> Printf.printf "%d\n"

let _ = main ()
