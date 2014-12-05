open Ast

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

let strstr = function (a,b) -> a ^ " " ^ b

let strstrstr = function (a,b,c) -> a ^ " " ^ b ^ " = " ^ c ^ ";" (* Currently only for global vars *)

let rec expr_s = function
   ILiteral(l) -> string_of_int l
 | String(s) -> s
 | Char(c) -> c 
 | Id(v) ->  v
 | Binop(e1, o, e2) -> expr_s e1 ^ 
       (match o with Add -> " + " | Sub -> " - " | Mult -> " * " |
                     Div -> " / " | Equal -> " == " | Neq -> " != " |
                     Less -> " < " | Leq -> " <= " | Greater -> " > " |
                     Geq -> " >= ") ^ expr_s e2  
 | Call(f, es) -> f ^ "(" ^
        String.concat ", " (List.map (fun e -> "(" ^ expr_s e ^ ")") es) 
 | Assign(v, e) -> v ^ " = " ^ expr_s e ^ ";"
 | Noexpr -> ""

let rec stmt_s = function
   Block(ss) -> String.concat ",\n"
                              (List.map (fun s -> "(" ^ stmt_s s ^ ")") ss)
 | Expr(e) -> expr_s e
 | Print(s) -> "printf(" ^ s ^ ");"
 | Return(e) -> "return" ^ " " ^ expr_s e ^ ";" 
 | If(e, s1, s2) -> "If (" ^ expr_s e ^ ") (" ^ stmt_s s1 ^ ") (" ^
                                                stmt_s s2 ^ ")"
 | For(e1, e2, e3, s) -> "For (" ^ expr_s e1 ^ ") (" ^ expr_s e2 ^
                            ") (" ^ expr_s e3 ^ ") (" ^ stmt_s s ^ ")"
 | While(e, s) -> "While (" ^ expr_s e ^ ") (" ^ stmt_s s ^ ")"
 | VDecl(t,v) -> t ^ " " ^ v ^ ";"
 | NAssign(t,v,e) -> t ^ " " ^ v ^ " = " ^ expr_s e ^ ";"

let func_decl_s f =
  f.ftype ^ " " ^ f.fname ^ "(" ^
  String.concat "," (List.map strstr f.formals) ^ "){\n" ^
  String.concat "\n" (List.map stmt_s f.body) ^ "\n}\n"

let program_s (vars, funcs) = "#include <stdio.h>\n\n" ^ 
				String.concat ", " (List.map strstrstr vars) ^ "\n" ^
				String.concat "\n" (List.map func_decl_s funcs)

let translate (globals,functions) = print_string( program_s (globals,functions))
