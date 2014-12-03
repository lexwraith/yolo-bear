open Ast
open Bytecode

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
   Literal(l) -> string_of_int l
 | Id(s) -> "Id " ^ s
 | Binop(e1, o, e2) -> "Binop (" ^ expr_s e1 ^ ") " ^
       (match o with Add -> "Add" | Sub -> "Sub" | Mult -> "Mult" |
                     Div -> "Div" | Equal -> "Equal" | Neq -> "Neq" |
                     Less -> "Less" | Leq -> "Leq" | Greater -> "Greater" |
                     Geq -> "Geq") ^ " (" ^ expr_s e2 ^ ")"
 | Assign(v, e) -> v ^ " = " ^ expr_s e ^ ";"
 | Call(f, es) -> "Call " ^ f ^ " [" ^
        String.concat ", " (List.map (fun e -> "(" ^ expr_s e ^ ")") es) ^ "]"
 | Noexpr -> ""

let rec stmt_s = function
   Block(ss) -> String.concat ",\n"
                              (List.map (fun s -> "(" ^ stmt_s s ^ ")") ss) ^ "]"
 | Expr(e) -> expr_s e
 | Return(e) -> "return" ^ " " ^ expr_s e ^ ";" 
 | If(e, s1, s2) -> "If (" ^ expr_s e ^ ") (" ^ stmt_s s1 ^ ") (" ^
                                                stmt_s s2 ^ ")"
 | For(e1, e2, e3, s) -> "For (" ^ expr_s e1 ^ ") (" ^ expr_s e2 ^
                            ") (" ^ expr_s e3 ^ ") (" ^ stmt_s s ^ ")"
 | While(e, s) -> "While (" ^ expr_s e ^ ") (" ^ stmt_s s ^ ")"

let func_decl_s f =
  f.ftype ^ " " ^ f.fname ^ "(" ^
  String.concat "," f.formals ^ "){\n" ^
  String.concat "\n " f.locals ^ ";\n"  ^
  String.concat "\n" (List.map stmt_s f.body) ^
  "}\n"


let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      (match o with
	Add -> "+" | Sub -> "-" | Mult -> "*" | Div -> "/"
      | Equal -> "==" | Neq -> "!="
      | Less -> "<" | Leq -> "<=" | Greater -> ">" | Geq -> ">=") ^ " " ^
      string_of_expr e2
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

let string_of_vdecl id = "int " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  fdecl.ftype ^ " " ^ fdecl.fname ^ "(" ^ String.concat ", " fdecl.formals ^ "){\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)


let program_s (vars, funcs) = String.concat ", " vars ^ "\n" ^
  String.concat "\n" (List.map func_decl_s funcs) ^ ")"

let translate (globals,functions) = print_string( program_s (globals,functions))
