open Ast
type variable_decl = string * Types.t

module S = struct
  type symbol_table = {
  	parent : symbol_table option;
  	mutable variables : variable_decl list 
  }
end

type expr_detail =
    ILiteral of int
  | Float of string (* TODO: Consider changing this*)
  | String of string
  | Char of string
  | Id of variable_decl
  | Binop of expr_detail * Ast.op * expr_detail
  | Call of string * expr_detail list
  | Noexpr
  | Assign of string * expr_detail

type stmt_detail =
    Block of S.symbol_table * stmt_detail list * variable_decl list
  | Expr of expr_detail * Types.t
  | Print of string
	| Printlist of string * string list
  | Return of expr_detail * variable_decl list
  | If of expr_detail * stmt_detail * stmt_detail
  | For of expr_detail * expr_detail * expr_detail * stmt_detail
  | While of expr_detail * stmt_detail
  | VDecl of Types.t * string
  | NAssign of Types.t * string * expr_detail (* Variable declaration AND assignment *)
  | Arr of Types.t * string * int list  (* Type, and ID, and a list of indices *)
  | Braces of Types.t * string * int list * Ast.elem list(* Type, ID, Indices, Values *)

type expression = expr_detail * Types.t


type func_decl_detail = { 
    ftype_s : Types.t;
    fname_s : string;
    formals_s : (Types.t * string) list;
    body_s : stmt_detail list;
  }

