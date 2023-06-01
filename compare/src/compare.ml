let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]

type entry = { data1 : int list; data2 : int list; id : int }

let entry id data1 data2 = { id; data1; data2 }
let random_list len = List.init len (fun _ -> 0)

let generate n =
  let rec loop n acc =
    if n = 0 then acc
    else
      let data1 = random_list 10 in
      let data2 = random_list 10 in
      let e = entry n data1 data2 in
      let duplicate = Random.bool () in
      if duplicate then e :: e :: acc |> loop (n - 1)
      else e :: acc |> loop (n - 1)
  in
  loop n []

module EntrySetUnopt = Set.Make (struct
  type t = entry

  let compare = compare
end)

module EntrySetOpt = Set.Make (struct
  type t = entry

  let compare a b = failwith "Not implemented"
end)

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let entry_list = generate n in
  let set =
    if !opt then (module EntrySetOpt : Set.S with type elt = entry)
    else (module EntrySetUnopt : Set.S with type elt = entry)
  in
  let (module EntrySet) = set in
  EntrySet.of_list entry_list
  |> EntrySet.cardinal |> string_of_int |> print_endline

let _ = main ()
