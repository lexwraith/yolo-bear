open Sast

module StringMap = Map.Make(String)

(* Symbol table: Information about all the names in scope *)
type env = {
    function_index : int StringMap.t; (* Index for each function *)
    global_index   : int StringMap.t; (* "Address" for global variables *)
    local_index    : int StringMap.t; (* FP offset for args, locals *)
  }

(* val enum : int -> 'a list -> (int * 'a) list *)
let rec enum stride n = function
    [] -> []
  | hd::tl -> (n, hd) :: enum stride (n+stride) tl

(* val string_map_pairs StringMap 'a -> (int * 'a) list -> StringMap 'a *)
let string_map_pairs map pairs =
  List.fold_left (fun m (i, n) -> StringMap.add n i m) map pairs

let rec print_formal_bracket = function n ->
	match n with
	 0 -> ""
	| _ -> "[]" ^ print_formal_bracket (n-1)  

let rec print_stars = function n ->
	match n with
	 0 -> ""
	| _ -> "*" ^ print_stars (n-1) 

let print_formals = function (a,b,c) ->
	let star = match a with 
	 Types.DArray(_,_) -> " *"
	|_ -> " "
	in
	(Types.output_of_type a)  ^star ^ b 

let typstr = function (a,b) -> (Types.output_of_type a) ^ " " ^ b

let typstrstr = function (a,b,c) -> (Types.output_of_type a) ^ " " ^ b ^ " = " ^ c ^ ";"

let strstr = function (a,b) -> a ^ " " ^ b

let strstrstr = function (a,b,c) -> a ^ " " ^ b ^ " = " ^ c ^ ";" (* Currently only for global vars *)

let rec string_of_elem = function elem -> 
	match elem with 
		Ast.ElemLiteral(e) -> e
	|	Ast.ElemList(elist) -> "{" ^ String.concat "," (List.map string_of_elem elist)^ "}"			

let print_vars = function vars->
	List.fold_left 
		(fun str var -> 
			let (id,t) = var in
			str ^ "\n" ^ (Types.string_of_type t) ^ " "^ id)
		"" vars
let free_array = function array->
	List.fold_left 
		(fun str var -> 
			let (id,t) = var in
			match t with
				Types.DArray(_,_) ->str ^ "\n//freeArray(" ^ (Types.string_of_type t) ^ " "^ id ^ ")"
			| _ -> str ^ ""
			)
		"" array		

let rec expr_s = 
	let rec string_of_ind = function (slist : expr_detail list) ->
	 match slist with
	  [hd] -> "array[" ^ expr_s hd ^ "]."
		| hd::tail -> "array[" ^ expr_s hd ^ "].a->" ^ string_of_ind tail
		
		
	in
	function
   ILiteral(l) -> string_of_int l
 | String(s) -> s
 | Char(c) -> c 
 | Id(v, _) ->  v
 | Float(s) -> s
 | Binop(e1, o, e2) -> expr_s e1 ^ 
       (match o with Ast.Add -> " + " | Ast.Sub -> " - " | Ast.Mult -> " * " |
                     Ast.Div -> " / " | Ast.Equal -> " == " | Ast.Neq -> " != " |
                     Ast.Less -> " < " | Ast.Leq -> " <= " | Ast.Greater -> " > " |
                     Ast.Geq -> " >= ") ^ expr_s e2  
 | Call(f, es) -> f ^ "(" ^
        String.concat ", " (List.map (fun e -> "(" ^ expr_s e ^ ")") es) 
 | Assign(v, e) -> v ^ " = " ^ expr_s e ^ ";"
 | Noexpr -> ""
 | ArrId(typ,name,nlist) ->  
	let tname = match typ with
		Types.Int -> "i"
	| Types.Float -> "f"
	| Types.Char -> "c"
	in	
	name ^ "->" ^ string_of_ind nlist ^ tname
 | DArrId(name,n) -> name ^ print_formal_bracket n


let rec checkArray id ind=
		match ind with
		[hd] -> ""
		| hd::tail -> 
			"if (!(" ^ id ^ "->array[" ^ expr_s hd ^ "].a)) {\n" ^
			"Array temp;\n" ^
			"initArray(&temp);\n" ^
			"insertArray(" ^ id ^ "," ^ expr_s hd ^ ",&temp);\n" ^
			"}\n" ^ checkArray (id ^ "->array[" ^ expr_s hd ^ "].a") tail
			
let rec insertArray id ind=
		match ind with
		[hd] -> id ^ "", expr_s hd
		| hd::tail -> 
			insertArray (id ^ "->array[" ^ expr_s hd ^ "].a") tail


let rec stmt_s = function
   Block(symbol_table,ss,unused_vars) -> "{\n"^ (String.concat "\n"
                              (List.map (fun s -> stmt_s s ) ss)) ^"\n"
														(*
															^ "/*Free Arrays:" 
															^ (free_array symbol_table.S.variables)
															^ "\n*/\n" *)
															^ "}"
 | Expr(e,_) -> expr_s e
 | Print(s) -> "printf(" ^ s ^ ");"
 | Printlist(s,l) -> "printf(" ^ s ^ "," ^ String.concat "," l ^ ");" 
 | Return(e, vars, is_darr) -> 
		(*(free_array vars) ^ "\n" ^ *)
		"Array *ptr;\n" ^
		"while (stackEmpty(stack)==0){\n"^
		"stack = popStack(stack, ptr);\n"^
		"freeArray(ptr);\n"^
		"}\n"^
		"freeStack(stack);\n"^
		"return" ^ " " ^ expr_s e ^ ";" 
 | If(e, s1, s2) -> "If (" ^ expr_s e ^ ") (" ^ stmt_s s1 ^ ") (" ^
                                                stmt_s s2 ^ ")"
 | For(e1, e2, e3, s) -> "For (" ^ expr_s e1 ^ " " ^ expr_s e2 ^
                            "; " ^ expr_s e3 ^ ") " ^ stmt_s s ^ ""
 | While(e, s) -> "While (" ^ expr_s e ^ ") (" ^ stmt_s s ^ ")"
 | VDecl(t,v) -> Types.output_of_type t ^ " " ^ v ^ ";"
 | NAssign(t,v,e) -> Types.output_of_type t ^ " " ^ v ^ " = " ^ expr_s e ^ ";"
 | Arr(t,v,l) -> (Types.output_of_type t) ^ " " ^ v ^ "[" ^ String.concat "][" (List.map (fun s-> expr_s s) l) ^ "];"
 | Braces (t, id, ind, elem) -> Types.output_of_type t ^ " " ^ id ^ 
  	"[" ^ String.concat "][" (List.map (fun s-> expr_s s) ind) ^ "]" ^
		" = " ^ List.fold_left (fun str elem-> str ^ string_of_elem elem) "" elem ^ ";"
 | DBraces (t, id, dim, elem) -> Types.output_of_type t ^ (print_formal_bracket dim) ^ " " ^ 
				id ^ " = " ^ List.fold_left (fun str elem-> str ^ string_of_elem elem) "" elem ^ ";"
 | AAssign(t,id,ind, e) -> 
	let idstr, indstr = insertArray id ind in
			checkArray id ind ^ 
			"insert" ^ Types.string_of_type t ^ "("^ idstr ^"," ^ indstr ^","^ expr_s e ^");" 
 | SAssign(t,id,ind, e) -> 
		"char[] " ^ id ^ " = " ^ String.concat "" e ^ ";"
 | DArr(t,id,dim)-> "Array " ^ id ^ "_o;\n" ^
			"initArray(&" ^ id ^ "_o);\n" ^
			"Array *" ^ id ^ " = &" ^ id ^ "_o;\n" ^
			"stack = pushStack(stack, " ^ id ^ ");"
			
			
let func_decl_s (f:func_decl_detail) =
	let star = match f.ftype_s with 
	 Types.DArray(_,_) -> " *"
	|_ -> " "
	in
  (Types.output_of_type f.ftype_s) ^ star 
	  ^ f.fname_s ^ "(" ^
  String.concat "\n" (List.map print_formals f.formals_s) ^ "){\n" ^
	"Stack stack_o;\n" ^
  "initStack(&stack_o);\n" ^
	"Stack *stack = &stack_o;\n" ^
	String.concat "\n" (List.map stmt_s f.body_s) ^ "\n}\n"

let program_s (vars, funcs) = "#include <stdio.h>\n#include \"array.h\"\n\n" ^ 
				String.concat ", " (List.map typstrstr vars) ^ "\n" ^
				String.concat "\n" (List.map func_decl_s funcs)

let translate (globals,functions) = print_string( program_s (globals,functions))
