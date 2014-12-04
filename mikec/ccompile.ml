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

let rec expr_s = function
   ILiteral(l) -> string_of_int l
 | Id(v) -> "Id " ^ v
 | Binop(e1, o, e2) -> "Binop (" ^ expr_s e1 ^ ") " ^
       (match o with Add -> "Add" | Sub -> "Sub" | Mult -> "Mult" |
                     Div -> "Div" | Equal -> "Equal" | Neq -> "Neq" |
                     Less -> "Less" | Leq -> "Leq" | Greater -> "Greater" |
                     Geq -> "Geq") ^ " (" ^ expr_s e2 ^ ")"
 | Assign(v, e) -> v ^ " = " ^ expr_s e ^ ";"
 | NAssign(t,v,e) -> t ^ " " ^ v ^ " = " ^ expr_s e ^ ";\n"
 | Call(f, es) -> "Call " ^ f ^ " [" ^
        String.concat ", " (List.map (fun e -> "(" ^ expr_s e ^ ")") es) ^ "]"
 | Noexpr -> ""

let rec stmt_s = function
   Block(ss) -> String.concat ",\n"
                              (List.map (fun s -> "(" ^ stmt_s s ^ ")") ss) ^ "]"
 | Expr(e) -> expr_s e
 | Print(s) -> "printf(" ^ expr_s s ^ ");\n"
 | Return(e) -> "return" ^ " " ^ expr_s e ^ ";" 
 | If(e, s1, s2) -> "If (" ^ expr_s e ^ ") (" ^ stmt_s s1 ^ ") (" ^
                                                stmt_s s2 ^ ")"
 | For(e1, e2, e3, s) -> "For (" ^ expr_s e1 ^ ") (" ^ expr_s e2 ^
                            ") (" ^ expr_s e3 ^ ") (" ^ stmt_s s ^ ")"
 | While(e, s) -> "While (" ^ expr_s e ^ ") (" ^ stmt_s s ^ ")"
 | VDecl(t,v) -> t ^ " " ^ v ^ ";"

let func_decl_s f =
  f.ftype ^ " " ^ f.fname ^ "(" ^
  String.concat "," (List.map (fun (a,b) -> a ^ " " ^ b) f.formals) ^ "){\n" ^
  String.concat "\n" (List.map stmt_s f.body) ^
  "}\n"

let program_s (vars, funcs) = "#include <stdio.h>\n\n" ^ 
				String.concat ", " (List.map (fun (a,b) -> a ^ " " ^ b) vars) ^ "\n" ^
				String.concat "\n" (List.map func_decl_s funcs)

let translate (globals,functions) = print_string( program_s (globals,functions))
