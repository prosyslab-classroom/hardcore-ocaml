(* 모두 모아서 *)

module type A_T = sig
  type t
  type u

  val f : t -> u
end

module type B_T = sig
  module A : A_T
end

module type C_T = sig
  module A : A_T
  module B : B_T with module A = A
end

module A : A_T = struct
  type t = int
  type u = int

  let f x = x
end

(* DO NOT MODIFY ANYTHING ABOVE THIS LINE *)

module B : B_T = struct
  module A = A
end

module C : C_T = struct
  module A = A
  module B = B
end

(* DO NOT MODIFY ANYTHING BELOW THIS LINE *)

let f (x : C.A.t) (y : C.B.A.t) = x = y
let f (x : C.A.u) (y : C.B.A.u) = x = y
