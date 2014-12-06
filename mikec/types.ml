type t = 
		Void
	| Int
	| Float
	| Char
	| String
	| Struct of string * ((string * t) array) (* name, fields *)
	| Array of t * int												(* type, size *)                       
	| Exception of string

let rec string_of_type t1 =
	match t1 with
		Void -> "Void"
	|	Int -> "Int"
	| Char -> "Char"
	| String -> "String"
	| Struct(name,_) -> "Struct: " ^ name (* TODO complete struct string*)
	| Array(t_a, num) ->  (string_of_type t_a) ^ "[" ^ (string_of_int num) ^ "]"	              
	| Exception(s) -> "Exception: " ^ s

