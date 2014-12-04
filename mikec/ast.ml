type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq

type expr =
    ILiteral of int
  | Id of string
  | Binop of expr * op * expr
  | Assign of string * expr
  | NAssign of string * string * expr (* Variable declaration AND assignment *)
  | Call of string * expr list
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Print of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt
  | VDecl of string * string

type func_decl = { 
    ftype : string;
    fname : string;
    formals : (string * string) list;
    body : stmt list;
  }

type program = (string * string) list * func_decl list

(* Custom printing tools because Ocaml *)
let tup_of_strstr = function (a,b) -> a ^ b

(* Low-level AST printing, to help debug the structure.  These functions are
   only for debugging (the -r flag) and can be removed. *)

let rec expr_s = function
   ILiteral(l) -> "Literal " ^ string_of_int l
 | Id(s) -> "Id " ^ s
 | Binop(e1, o, e2) -> "Binop (" ^ expr_s e1 ^ ") " ^
       (match o with Add -> "Add" | Sub -> "Sub" | Mult -> "Mult" |
                     Div -> "Div" | Equal -> "Equal" | Neq -> "Neq" |
                     Less -> "Less" | Leq -> "Leq" | Greater -> "Greater" |
                     Geq -> "Geq") ^ " (" ^ expr_s e2 ^ ")"
 | Assign(v, e) -> "Assign " ^ v ^ " (" ^ expr_s e ^ ")"
 | NAssign(t,v,e) -> "New Assign " ^ t ^ v ^ " (" ^ expr_s e ^ ")"
 | Call(f, es) -> "Call " ^ f ^ " [" ^
        String.concat ", " (List.map (fun e -> "(" ^ expr_s e ^ ")") es) ^ "]"
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

let func_decl_s f =
  " { fname = \"" ^ f.fname ^ "\"\n   formals = [" ^
  String.concat ", " (List.map tup_of_strstr f.formals) ^ "]\n   body = ["  ^
  String.concat ",\n" (List.map stmt_s f.body) ^
  "]}\n"

let program_s (vars, funcs) = "([" ^ String.concat ", " (List.map tup_of_strstr vars) ^ "],\n" ^
  String.concat "\n" (List.map func_decl_s funcs) ^ ")"

(* "Pretty printed" version of the AST, meant to generate a MicroC program
   from the AST.  These functions are only for pretty-printing (the -a flag)
   the AST and can be removed. *)

let rec string_of_expr = function
    ILiteral(l) -> string_of_int l
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      (match o with
	Add -> "+" | Sub -> "-" | Mult -> "*" | Div -> "/"
      | Equal -> "==" | Neq -> "!="
      | Less -> "<" | Leq -> "<=" | Greater -> ">" | Geq -> ">=") ^ " " ^
      string_of_expr e2
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | NAssign(t, v, e) -> t ^ v ^ " = " ^ string_of_expr e
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
  | VDecl(t,v) -> t ^ " " ^ v
  | Print(_) -> "printf(\"%d\",SOMETHINGGOESHERE);" (* TODO: Unfuck this *)

let string_of_fdecl fdecl =
  fdecl.fname ^ "(" ^ String.concat ", " (List.map tup_of_strstr fdecl.formals) ^ ")\n{\n" ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map tup_of_strstr vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)

