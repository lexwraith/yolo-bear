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
  | Call of string * expr list
  | Noexpr
  | Assign of string * expr_detail

type stmt_detail =
    Block of S.symbol_table * stmt_detail list
  | Expr of expr_detail * Types.t
  | Print of string
  | Return of expr
  | If of expr_detail * stmt_detail * stmt_detail
  | For of expr * expr * expr * stmt
  | While of expr * stmt
  | VDecl of string * string
  | NAssign of Types.t * string * expr_detail (* Variable declaration AND assignment *)
  | Arr of string * string * int list  (* Type, and ID, and a list of indices *)

type expression = expr_detail * Types.t
