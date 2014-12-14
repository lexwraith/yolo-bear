type t = 
		Void
	| Int
	| Float
	| Char
	| String
<<<<<<< HEAD
	| NoneType
=======
	| Nonetype
>>>>>>> tbm
	| Struct of string * ((string * t) array) (* name, fields *)
	| Array of t * int list										(* type, size *)
	| DArray of t * int 											(* type, dimension *)                     
	| Exception of string

let rec string_of_type t1 =
	match t1 with
		Void -> "Void"
	|	Int -> "Int"
	| Char -> "Char"
	| String -> "String"
	| Float -> "Float"
	| Struct(name,_) -> "Struct: " ^ name (* TODO complete struct string*)
	| Array(t_a, num) -> 
		let ind = 
			List.fold_left 
				(fun output list -> output ^ "[" ^ (string_of_int list) ^ "]") "" num
		in 
		(string_of_type t_a) ^ ind	              
	| Exception(s) -> "Exception: " ^ s
<<<<<<< HEAD
	| NoneType
=======
	| Nonetype
>>>>>>> tbm
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
	| DArray(t_a, _) -> output_of_type t_a            
	| Exception(_) -> "exception"
<<<<<<< HEAD
	| NoneType -> ""
=======
	| Nonetype -> ""
>>>>>>> tbm
	| _ -> ""

let type_from_string s1 =
	match s1 with
		"void" -> Void
	|	"int" -> Int
	| "char" -> Char
	| "String" -> String
	| "float" -> Float
<<<<<<< HEAD
	| _ -> NoneType
=======
	| _ -> Nonetype
>>>>>>> tbm
