(* 너와 나의 연결 고리 *)

module type A_T = sig
  type t
end

module type B_T = sig
  module A : A_T
end

module type C_T = sig
  module B : B_T
  module A = B.A
end

module A : A_T = struct
  type t = int
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
