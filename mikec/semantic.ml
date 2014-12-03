(* Takes in ast.program (see definition) and raises error if something doesn't add up*)

(* TODO: Parameter length checking
 *       Type checking for variable declarations
 *       Type checking for function calls 
 *       Lexical scope checking
 *       Global scope checking
 *       Array index checking
 *       Operations checking, e.g. string + int
 *       Return type check
 *       *)
let check (globals,functions) = function
