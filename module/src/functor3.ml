(* 손에 손잡고 *)

module type A_T = sig
  type t
end

module type B_T = sig
  type t
end

module type S_T = sig
  module A : A_T
  module B : B_T with type t = A.t
end

module A = struct
  type t = int
end

module B = struct
  type t = int

  module A = A
end

(* DO NOT MODIFY ANYTHING ABOVE THIS LINE *)

module Make (A : A_T) (B : B_T) : S_T = struct
  module A = A
  module B = B
end

(* DO NOT MODIFY ANYTHING BELOW THIS LINE *)

module S = Make (A) (B)

let f (x : S.A.t) (y : S.B.t) = x = y
