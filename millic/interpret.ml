open Ast

module NameMap = Map.Make(String)

(* Symbol table for variables: map from variable names to values *)
type vsymtab = lit NameMap.t

(* Execution environment: local variables * global variables *)
type env = vsymtab * vsymtab

(* Used to handle the "return" statement: (value, global variables) *)
exception ReturnException of lit * vsymtab

(* Main entry point: run a program *)
let run ((vars, funcs) : program) : unit =

  (* Build a symbol table for function declarations *)
  let func_decls : (func_decl NameMap.t) = List.fold_left
      (fun funcs fdecl -> NameMap.add fdecl.fname fdecl funcs)
      NameMap.empty funcs
  in

  (* Invoke a function and return an updated global symbol table *)
  let rec call
     (fdecl : func_decl) (actuals : lit list) (globals : vsymtab) : vsymtab =

    (* Evaluate an expression; return value and updated environment *)
    let rec eval (env : env) (exp : expr) : lit * env = match exp with (*(env:env) means parameter called env of type env*)
	Literal(i) -> i, env
      | Noexpr -> Int(1), env (* must be non-zero for the for loop predicate *)
      | Id(var) ->
	  let locals, globals = env in
	  if NameMap.mem var locals then
	   NameMap.find var locals, env
	  else if NameMap.mem var globals then
	    NameMap.find var globals, env
	  else raise (Failure ("undeclared identifier " ^ var))
      | Assign(var, e) ->
	  let v, (locals, globals) = eval env e in
	  if NameMap.mem var locals then
	    v, (NameMap.add var v locals, globals)
	  else if NameMap.mem var globals then
	    v, (locals, NameMap.add var v globals)
	  else raise (Failure ("undeclared identifier " ^ var))
      | Binop(e1, op, e2) ->
	  let v1, env = eval env e1 in
          let v2, env = eval env e2 in
					let v1 = (match v1 with |Int(v)->v |String(v) -> 0) in
					let v2 = (match v2 with |Int(v)->v |String(v) -> 0) in
	  let boolean i = if i then 1 else 0 in
	  Int(match op with
	    Add -> v1 + v2
	  | Sub -> v1 - v2
	  | Mult -> v1 * v2
	  | Div -> v1 / v2
	  | Equal -> boolean (v1 = v2)
	  | Neq -> boolean (v1 != v2)
	  | Less -> boolean (v1 < v2)
	  | Leq -> boolean (v1 <= v2)
	  | Greater -> boolean (v1 > v2)
	  | Geq -> boolean (v1 >= v2)), env
      | Call("print", [e]) ->
	  let v, env = eval env e in
		(match v with Int(l) -> print_endline (string_of_int l) | String(l) -> print_endline (l));
	  Int(0), env
      | Call(f, actuals) ->
	  let fdecl =
	    try NameMap.find f func_decls
	    with Not_found -> raise (Failure ("undefined function " ^ f))
	  in
		
		(* Evaluate all actuals and store their values in a list called 'actuals'*)
		(* actuals after '=' is from call (actural_opt: a reverseed list of expr) *)
		(* actuals before '=' is the result (a list of int) *)
	  let (actuals : lit list), (env : env) = List.fold_left
	      (fun (actuals, env) actual ->
		let v, env = eval env actual in v :: actuals, env)
   	      ([], env) (List.rev actuals)
	  in
		
	  let (locals, globals) = env in
	  try
	    let globals = call fdecl actuals globals
	    in Int(0), (locals, globals)
	  with ReturnException(v, globals) -> v, (locals, globals)
		(* End of Call *)
    in (* End of 'eval' *)

    (* Execute a statement and return an updated environment *)
    let rec exec (env : env) (stmt : stmt) : env = match stmt with
	Block(stmts) -> List.fold_left exec env stmts
      | Expr(e) -> let _, env = eval env e in env
      | If(e, s1, s2) ->
	  let v, env = eval env e in
			let v = (match v with |Int(l)->l |String(l) -> (Char.code l.[0]) - (Char.code '0')) in
	  exec env (if v != 0 then s1 else s2)
      | While(e, s) ->
	  let rec loop env =
	    let v, env = eval env e in
				let v = (match v with |Int(l)->l |String(l) -> (Char.code l.[0]) - (Char.code '0')) in
	    if v != 0 then loop (exec env s) else env
	  in loop env
      | For(e1, e2, e3, s) ->
	  let _, env = eval env e1 in
	  let rec loop env =
	    let v, env = eval env e2 in
				let v = (match v with |Int(l)->l |String(l) -> (Char.code l.[0]) - (Char.code '0')) in
	    if v != 0 then
	      let _, env = eval (exec env s) e3 in
	      loop env
	    else
	      env
	  in loop env
      | Return(e) ->
	  let v, (_, globals) = eval env e in
	  raise (ReturnException(v, globals))
    in  (* End of exec *)

    (* Body of "call": bind actual values to formal arguments *)
    let locals : vsymtab =
      try List.fold_left2
	  (fun locals formal actual -> NameMap.add formal actual locals)
	  NameMap.empty fdecl.formals actuals
      with Invalid_argument(_) ->
	raise (Failure ("wrong number of arguments passed to " ^ fdecl.fname))
    in
    (* Initialize local variables to 0 *)
    let locals : vsymtab = List.fold_left
	(fun locals local -> NameMap.add local (Int(0)) locals) locals fdecl.locals
    in
    (* Execute each statement in sequence, return updated global symbol table *)
    snd (List.fold_left exec (locals, globals) fdecl.body)

  (* Body of "run": initialize global variables to 0, find and run "main" *)
  in let globals : vsymtab = List.fold_left
      (fun globals vdecl -> NameMap.add vdecl (Int(0)) globals) NameMap.empty vars
  in try
    ignore (call (NameMap.find "main" func_decls) [] globals)
  with Not_found -> raise (Failure ("did not find the main() function"))
