(* Takes in ast.program (see definition) and raises error if something doesn't add up*)

(* TODO: Parameter length checking
 *       Type checking for variable declarations
 *       Type checking for function calls 
 *       Lexical scope checking
 *       Global scope checking
 *       Array index checking
 *       Operations checking, e.g. string + int
 *       Return type check
 *	 Index type check - we could make this a grammar rule, but a semantic check is fine too
*        ID name validation (no crazy characters though scanner helps)

 *       *)

(* globals consists of string*string*string for Type/ID/Value *)
(* functions is a list of structs with 4 fields:
	ftype
	fname
	arguments (refer to ast for name)
	body (which is really another program in itself)
	*)
	
open Ast
open Sast
open Types

module NameMap = Map.Make(String)

type exception_scope = {
	excep_parent : exception_scope option;
	mutable exceptions : string list 
}

type translation_environment = {
  scope:S.symbol_table;			                (* symbol table for vars *)
	exception_scope : exception_scope; 			(* sym tab for exceptions *) 
  (*
	return_type : Types.t;
  in_switch : bool;
  case_labels : Big_int.big_int list ref; (* known case labels *) 
	break_label : label option; 						(* when break makes sense *) 
	continue_label : label	 option; 					(* when continue makes sense *) 
	exception_scope : exception_scope; 			(* sym tab for exceptions *) 
	labels : label list ref; 								(* labels on statements *) 
	forward_gotos : label list ref; 				(* forward goto destinations *)
	*)
}


(* Find variable in current scope ant its parent scopes *)
let rec find_variable (scope : S.symbol_table) name =
  try
  	List.find (fun (s, _) -> s = name) scope.variables
  with Not_found ->
    match scope.parent with
    	Some(parent) -> find_variable parent name 
  	| _ -> raise Not_found

(* check if e has type integer *)
let require_integer (env:translation_environment) e str =
	match e with
		Types.Int -> ()
	| _ -> env.exception_scope.exceptions <- str::env.exception_scope.exceptions; 
				 raise (Failure str) 
				
(* check if t1 and t2 are the same types *)				
let weak_eq_type t1 t2 =
	match t1,t2 with
		Types.Int,Types.Int -> true
	| Types.Char,Types.Char -> true
	| Types.Float,Types.Float -> true
	| Types.String,Types.String -> true
	| _, _ -> false

let rec expr (env : translation_environment)  = function
	(* Map the literals from ast to sast *)
		Ast.ILiteral(v) -> Sast.ILiteral(v), Types.Int
	| Ast.Char(c) -> Sast.Char(c), Types.Char
	| Ast.Float(f) -> Sast.Float(f), Types.Float
	| Ast.String(s) -> Sast.String(s), Types.String
	| Ast.Noexpr -> Sast.Noexpr, Types.Void
  (* An identifier: verify it is in scope and return its type *)
	| Ast.Id(vname) -> let vdecl = try
			find_variable env.scope vname (* locate a variable by name *) 
  	with Not_found ->
  		raise (Failure ("undeclared identifier " ^ vname))
  	in
  	let (_, typ) = vdecl in (* get the variable’s type *) 
  	Sast.Id(vdecl), typ
	| Ast.Binop(e1, op, e2) ->
		let e1 = expr env e1 (* Check left and right children *) 
		and e2 = expr env e2 in
		
		let ep1, t1 = e1 (* Get the type of each child *)
		and ep2, t2 = e2 in
		
		if op <> Ast.Equal && op <> Ast.Neq then
			(* Most operators require both left and right to be integer *) 
			(require_integer env t1 "Left operand must be integer";
			 require_integer env t2 "Right operand must be integer") 
			else
		if not (weak_eq_type t1 t2) then
			(* Equality operators just require types to be "close" *) 
			(* error ("Type mismatch in comparison: left is " ^
							Printer.string_of_sast_type t1 ^ "\" right is \"" ^
							Printer.string_of_sast_type t2 ^ "\"" ) loc; *)
			raise (Failure ("Type mismatch in comparison: left is " ^
							string_of_type t1 ^ "\" right is \"" ^
							string_of_type t2 ^ "\"" ));
		Sast.Binop(ep1, op, ep2), Types.Int (* Success: result is int *)
	| Ast.Assign(id, ep2) ->
		let e1 = expr env (Ast.Id(id)) in
		let e2 = expr env ep2 in
		let (ep1, t1) = e1 in
		let (ep2, t2) = e2 in
		if not (weak_eq_type t1 t2) then
			raise (Failure ("Type mismatch in assign value: left is " ^
							string_of_type t1 ^ "\" right is \"" ^
							string_of_type t2 ^ "\"" ));
		Sast.Assign(id,ep2), Types.Void

let rec stmt env = function
		(* Expression statement: just check the expression *)
		Ast.Expr(e) -> 
			let e1 = expr env e in
			let (ep1,t1) = e1 in
				Sast.Expr(ep1,t1)
		
		(* If statement: verify the predicate is integer *)
	| Ast.If(e, s1, s2) ->
		let e = expr env e in (* Check the predicate *)
		let (ep,t) = e in
		require_integer env t "Predicate of if must be integer"; 
		
		Sast.If(ep, stmt env s1, stmt env s2) (* Check then, else *)
	
	(* These codes are in the slides, but I cannot figure out how they work *)
	(*	
	| Ast.VDecl(vdecl) ->
		let decl, (init, _) = check_local vdecl (* already declared? *)
		in
   (* side-effect: add variable to the environment *)
		env.scope.S.variables <- decl :: env.scope.S.variables;
		init (* initialization statements, if any *)
	*)
	
	(* Initial local variables *)
	| Ast.NAssign(t1,id,ep1) ->
		let t1 = Types.type_from_string t1 in
		let e2 = expr env ep1 in
		let (ep2, t2) = e2 in
		(* Should assign the same type as required *)
		if not (weak_eq_type t1 t2) then
			raise (Failure ("Type mismatch in variable declaration: left is " ^
							string_of_type t1 ^ "\" right is \"" ^
							string_of_type t2 ^ "\"" ));
		env.scope.S.variables <- (id,t1) :: env.scope.S.variables;
		Sast.NAssign(t1,id,ep2)
		 
	| Ast.Block(sl) ->
		(* New scopes: parent is the existing scope, start out empty *)
		let scope' = { S.parent = Some(env.scope); S.variables = [] } 
		and exceptions' =
			{ excep_parent = Some(env.exception_scope); exceptions = [] } 
		in
    
		(* New environment: same, but with new symbol tables *)
		let env' = { env with scope = scope'; 
								 exception_scope = exceptions' } in
								
    (* Check all the statements in the block *)		
		let sl = List.map (fun s -> stmt env' s) sl in
		scope'.S.variables <-
			List.rev scope'.S.variables; (* side-effect *) 
			
		Sast.Block(scope', sl) (* Success: return block with symbols *)	

let check (globals,functions) = 
	(* Construct a map of functions' name and functions' decl *)
	let func_decls : (func_decl NameMap.t) = List.fold_left
      (fun funcs fdecl -> NameMap.add fdecl.fname fdecl funcs)
      NameMap.empty functions
  in
	
	(* Convert global:(string*string*string) to variable_decl list *)
	let vars = List.fold_left
			(fun varlist global1 -> 
				let (t, name, _) = global1 in
				let t = Types.type_from_string t in
					(name,t)::varlist )
			[] globals
	in
	
	(* Body of "run": initialize global variables to 0, find and run "main" *)
	let scope' = { S.parent = None; S.variables = vars } 
	and exceptions' = { excep_parent = None; exceptions = [] } 
	in
    
	(* New environment: same, but with new symbol tables *)
	let env' = { scope = scope'; exception_scope = exceptions' }
	in
	
	(*	
  let variables : variable_decl list = List.fold_left
      (fun globals vdecl -> NameMap.add vdecl (Int(0)) globals) NameMap.empty vars
  in
	*)
	
	(* Find 'main' function *)
	let main_fun = 
	try
   	NameMap.find "main" func_decls
  with Not_found -> raise (Failure ("did not find the main() function"))
	in
	stmt env' (Ast.Block(main_fun.body))
	(*ignore (List.fold_left (fun env stmts -> stmt env stmts) env' main_fun.body)*)
	
