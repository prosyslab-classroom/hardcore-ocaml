(* 정의 구현 *)

module type A_T = sig
  type t
end

module type B_T = sig
  type t
end

module type C_T = sig
  module A : A_T
  module B : B_T
end

module A : A_T = struct
  type t = int
end

(* DO NOT MODIFY ANYTHING ABOVE THIS LINE *)

module B : B_T = struct end
module C : C_T = struct end
