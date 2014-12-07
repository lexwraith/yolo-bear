type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq

type expr =
    ILiteral of int
  | Float of string (* TODO: Consider changing this*)
  | String of string
  | Char of string
  | Id of string
  | Binop of expr * op * expr
  | Call of string * expr list
  | Noexpr
  | Assign of string * expr

type stmt =
    Block of stmt list
  | Expr of expr
  | Print of string
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt
  | VDecl of string * string
  | NAssign of string * string * expr (* Variable declaration AND assignment *)
  | Arr of string * string * int list  (* Type, and ID, and a list of indices *)
 
type func_decl = { 
    ftype : string;
    fname : string;
    formals : (string * string) list;
    body : stmt list;
  }

type program = (string * string * string) list * func_decl list

(* Custom printing tools because Ocaml *)
let strstr = function (a,b) -> a ^ b
let strstrstr = function (a,b,c) -> a ^ b ^ c

(* Low-level AST printing, to help debug the structure.  These functions are
   only for debugging (the -r flag) and can be removed. *)

let rec expr_s = function
   ILiteral(l) -> "Literal " ^ string_of_int l
 | String(s) -> "String " ^ s
 | Char(c) -> "Char" ^ c
 | Id(s) -> "Id " ^ s
 | Binop(e1, o, e2) -> "Binop (" ^ expr_s e1 ^ ") " ^
       (match o with Add -> "Add" | Sub -> "Sub" | Mult -> "Mult" |
                     Div -> "Div" | Equal -> "Equal" | Neq -> "Neq" |
                     Less -> "Less" | Leq -> "Leq" | Greater -> "Greater" |
                     Geq -> "Geq") ^ " (" ^ expr_s e2 ^ ")"
 | Call(f, es) -> "Call " ^ f ^ " [" ^
        String.concat ", " (List.map (fun e -> "(" ^ expr_s e ^ ")") es) ^ "]"
 | Assign(v, e) -> "Assign " ^ v ^ " (" ^ expr_s e ^ ")"
 | Noexpr -> "Noexpr"

let rec stmt_s = function
   Block(ss) -> "Block [" ^ String.concat ",\n"
                             (List.map (fun s -> "(" ^ stmt_s s ^ ")") ss) ^ "]"
 | Expr(e) -> "Expr (" ^ expr_s e ^ ")"
 | Return(e) -> "Return (" ^ expr_s e ^ ")"
 | If(e, s1, s2) -> "If (" ^ expr_s e ^ ") (" ^ stmt_s s1 ^ ") (" ^
                                                stmt_s s2 ^ ")"
 | For(e1, e2, e3, s) -> "For (" ^ expr_s e1 ^ ") (" ^ expr_s e2 ^
                            ") (" ^ expr_s e3 ^ ") (" ^ stmt_s s ^ ")"
 | While(e, s) -> "While (" ^ expr_s e ^ ") (" ^ stmt_s s ^ ")"
 | VDecl(t,v) -> t ^ " " ^ v
 | Print(_) -> "Print " ^ "\"Some string here\"" (* TODO: UNFUCK THIS *)
 | NAssign(t,v,e) -> "New Assign " ^  t ^ v ^ " (" ^ expr_s e ^ ")"
 
let func_decl_s f =
  " { fname = \"" ^ f.fname ^ "\"\n   formals = [" ^
  String.concat ", " (List.map strstr f.formals) ^ "]\n   body = ["  ^
  String.concat ",\n" (List.map stmt_s f.body) ^
  "]}\n"

let program_s (vars, funcs) = "([" ^ String.concat ", " (List.map strstrstr vars) ^ "],\n" ^
  String.concat "\n" (List.map func_decl_s funcs) ^ ")"

(* "Pretty printed" version of the AST, meant to generate a MicroC program
   from the AST.  These functions are only for pretty-printing (the -a flag)
   the AST and can be removed. *)

let rec string_of_expr = function
    ILiteral(l) -> string_of_int l
  | String(s) -> s
  | Char(c) -> c
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      (match o with
	Add -> "+" | Sub -> "-" | Mult -> "*" | Div -> "/"
      | Equal -> "==" | Neq -> "!="
      | Less -> "<" | Leq -> "<=" | Greater -> ">" | Geq -> ">=") ^ " " ^
      string_of_expr e2
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
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
  | VDecl(t,v) -> t ^ " " ^ v
  | Print(_) -> "printf(\"%d\",SOMETHINGGOESHERE);" (* TODO: Unfuck this *)
  | NAssign(t, v, e) ->  t ^ v ^ " = " ^ string_of_expr e

let string_of_fdecl fdecl =
  fdecl.fname ^ "(" ^ String.concat ", " (List.map strstr fdecl.formals) ^ ")\n{\n" ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map strstrstr vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)

