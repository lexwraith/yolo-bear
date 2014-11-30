type cinst = 
    Lit of Ast.lit  (* Our literals can be strings/ints/chars *)
    Func_Call of int     (* How we call functions using function integer map *)


(*type binst =      (* Binary Instructions *)
  | Drp           (* Discard a value *)
  | Bin of Ast.op (* Perform arithmetic on top of stack *)
  | Lod of int    (* Fetch global variable *)
  | Str of int    (* Store global variable *)
  | Lfp of int    (* Load frame pointer relative *)
  | Sfp of int    (* Store frame pointer relative *)
  | Jsr of int    (* Call function by absolute address *)
  | Ent of int    (* Push FP, FP -> SP, SP += i *)
  | Rts of int    (* Restore FP, SP, consume formals, push result *)
  | Beq of int    (* Branch relative if top-of-stack is zero *)
  | Bne of int    (* Branch relative if top-of-stack is non-zero *)
  | Bra of int    (* Branch relative *)
  | Hlt           (* Terminate *)
*)
type prog = {
    num_globals : int;   (* Number of global variables *)
    text : cinst array; (* Code for all the functions *)
  }


let string_of_stmt = function
    Lit(i) -> "Lit " ^ string_of_int i
  | Bin(Ast.Add) -> "+"
  | Bin(Ast.Sub) -> "-"
  | Bin(Ast.Mult) -> "*"
  | Bin(Ast.Div) -> "/"
  | Bin(Ast.Equal) -> "="
  | Bin(Ast.Neq) -> "!="
  | Bin(Ast.Less) -> "<"
  | Bin(Ast.Leq) -> "<="
  | Bin(Ast.Greater) -> ">"
  | Bin(Ast.Geq) -> ">="

let string_of_prog p =
  string_of_int p.num_globals ^ " global variables\n" ^
  let funca = Array.mapi
      (fun i s -> string_of_int i ^ " " ^ string_of_stmt s) p.text
  in String.concat "\n" (Array.to_list funca)
