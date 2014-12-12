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
	| Float -> "Float"
	| Struct(name,_) -> "Struct: " ^ name (* TODO complete struct string*)
	| Array(t_a, num) ->  (string_of_type t_a) ^ "[" ^ (string_of_int num) ^ "]"	              
	| Exception(s) -> "Exception: " ^ s
	| _ -> "Unknown type"

let rec output_of_type t1 =
	match t1 with
		Void -> "void"
	|	Int -> "int"
	| Char -> "char"
	| String -> "String"
	| Float -> "float"
	(*| Struct(name,_) -> "Struct: " ^ name (* TODO complete struct string*) *)
	| Array(t_a, _) ->  output_of_type t_a	              
	| Exception(_) -> "exception"
	| _ -> ""

let type_from_string s1 =
	match s1 with
		"void" -> Void
	|	"int" -> Int
	| "char" -> Char
	| "String" -> String
	| "float" -> Float
	| _ -> Void