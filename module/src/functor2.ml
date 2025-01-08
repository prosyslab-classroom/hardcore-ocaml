(* 나를 잊지 말아요 *)

module type A_T = sig
  type t
end

module type B_T = sig
  module A : A_T
end

module type S_T = sig
  module B : B_T
  module A : A_T
end

module A = struct
  type t = int
end

module B = struct
  type t = int

  module A = A
end

(* DO NOT MODIFY ANYTHING ABOVE THIS LINE *)

module Make (B : B_T) : S_T = struct
  module B = B
  module A = B.A
end

(* DO NOT MODIFY ANYTHING BELOW THIS LINE *)

module S = Make (B)

let f (x : S.B.A.t) (y : S.A.t) = x = y
