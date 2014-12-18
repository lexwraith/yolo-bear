type t = 
		Void
	| Int
	| Float
	| Char
	| String
	| Nonetype
	| Struct of string * ((string * t) array) (* name, fields *)
	| Array of t * int												(* type, dimension *)
	| DArray of t * int 											(* type, dimension *)                     
	| Exception of string

let rec print_array_bracket = function n ->
	match n with
	 0 -> ""
	| _ -> "[]" ^ print_array_bracket (n-1) 

let rec string_of_type t1 =
	match t1 with
		Void -> "Void"
	|	Int -> "Int"
	| Char -> "Char"
	| String -> "String"
	| Float -> "Float"
	| Struct(name,_) -> "Struct: " ^ name (* TODO complete struct string*)
	| Array(t_a, num) -> 
		(string_of_type t_a) ^	(print_array_bracket num)
	| DArray(t_a, num) -> 
		(string_of_type t_a) ^	(print_array_bracket num)                    
	| Exception(s) -> "Exception: " ^ s
	| Nonetype
	| _ -> "Unknown type"


let rec output_of_type t1 =
	match t1 with
		Void -> "void"
	|	Int -> "int"
	| Char -> "char"
	| String -> "char[]"
	| Float -> "float"
	(*| Struct(name,_) -> "Struct: " ^ name (* TODO complete struct string*) *)
	| Array(t_a, _) ->  output_of_type t_a	  
	| DArray(t_a, _) -> "Array"           
	| Exception(_) -> "exception"
	| Nonetype -> ""
	| _ -> ""

let type_from_string s1 =
	match s1 with
		"void" -> Void
	|	"int" -> Int
	| "char" -> Char
	| "String" -> String
	| "float" -> Float
	| _ -> Nonetype

let array_type_from_string s =
	match s with
		"int" -> Int
	| "char" -> Char
	| "float" -> Float
	| _ -> raise (Failure ("Array cannot have type '" ^ s ^"'"))
