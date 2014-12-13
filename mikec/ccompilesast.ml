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

let typstr = function (a,b) -> (Types.output_of_type a) ^ " " ^ b

let typstrstr = function (a,b,c) -> (Types.output_of_type a) ^ " " ^ b ^ " = " ^ c ^ ";"

let strstr = function (a,b) -> a ^ " " ^ b

let strstrstr = function (a,b,c) -> a ^ " " ^ b ^ " = " ^ c ^ ";" (* Currently only for global vars *)

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
			str ^ "\nfreeArray(" ^ (Types.string_of_type t) ^ " "^ id ^ ")")
		"" array		

let rec expr_s = function
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
 | Return(e, vars) -> 
	(*
		"/*\nFree Arrays:" ^
		(free_array vars) ^ "\n*/\n" ^ 
		*)
		"return" ^ " " ^ expr_s e ^ ";" 
 | If(e, s1, s2) -> "If (" ^ expr_s e ^ ") (" ^ stmt_s s1 ^ ") (" ^
                                                stmt_s s2 ^ ")"
 | For(e1, e2, e3, s) -> "For (" ^ expr_s e1 ^ " " ^ expr_s e2 ^
                            "; " ^ expr_s e3 ^ ") " ^ stmt_s s ^ ""
 | While(e, s) -> "While (" ^ expr_s e ^ ") (" ^ stmt_s s ^ ")"
 | VDecl(t,v) -> Types.output_of_type t ^ " " ^ v ^ ";"
 | NAssign(t,v,e) -> Types.output_of_type t ^ " " ^ v ^ " = " ^ expr_s e ^ ";"
 | Arr(t,v,l) -> (Types.output_of_type t) ^ " " ^ v ^ "[" ^ String.concat "][" (List.map (fun s-> string_of_int s) l) ^ "];"

let func_decl_s (f:func_decl_detail) =
  (Types.output_of_type f.ftype_s) ^ " " ^ f.fname_s ^ "(" ^
  String.concat "\n" (List.map typstr f.formals_s) ^ "){\n" ^
  String.concat "\n" (List.map stmt_s f.body_s) ^ "\n}\n"

let program_s (vars, funcs) = "#include <stdio.h>\n#include \"array.h\"\n\n" ^ 
				String.concat ", " (List.map typstrstr vars) ^ "\n" ^
				String.concat "\n" (List.map func_decl_s funcs)

let translate (globals,functions) = print_string( program_s (globals,functions))
