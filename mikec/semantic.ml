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
let check (globals,functions) = function
