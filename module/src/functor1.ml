(* 관통하는 진실 *)

module type A_T = sig
  type t
end

module type S_T = sig
  module A : A_T
end

(* DO NOT MODIFY ANYTHING ABOVE THIS LINE *)

module Make (A : A_T) : S_T = struct
  module A = A
end

module A : A_T = struct
  type t = int
end

(* DO NOT MODIFY ANYTHING BELOW THIS LINE *)

module S = Make (A)

let f (x : A.t) (y : S.A.t) = x = y
