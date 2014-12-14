type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq

type elem = 
    ElemLiteral of string
  | ElemList of elem list

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
  | Array of elem
  | ArrId of string * int list
  | DArrId of string * int

type stmt =
    Block of stmt list
  | Expr of expr
  | Print of string
  | Printlist of string * string list
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt
  | VDecl of string * string
  | VDecllist of (string * string) list
  | NAssign of string * string * expr (* Variable declaration AND assignment *)
  | Arr of string * string * int list  (* Type, and ID, and a list of indices *)
  | Braces of string * string * int list * elem list (* Type, ID, Indices, Values *)
  | DArr of string * string * int (*Type, ID, Dimensions *)
  | AAssign of string * string * int list * expr (*ID,value position, new value*)


type func_decl = { 
    ftype : string;
    fname : string;
    formals : (string * string * int) list;
    body : stmt list;
  }

type program = (string * string * string) list * func_decl list
