(* 더 깊이 가려진 비밀 *)

module type A_T = sig
  type t
end

module type B_T = sig
  module A : A_T

  type t
end

module type C_T = sig
  module A : A_T
  module B : B_T with type t = A.t
end

module A : A_T = struct
  type t = int
end

(* DO NOT MODIFY ANYTHING ABOVE THIS LINE *)

module B : B_T = struct
  module A = A

  type t = A.t
end

module C : C_T = struct
  module A = A
  module B = B
end

(* DO NOT MODIFY ANYTHING BELOW THIS LINE *)

let f (x : C.A.t) (y : C.B.t) = x = y
