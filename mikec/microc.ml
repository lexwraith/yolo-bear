type action = Semantic | SastCompile

let _ =
  let action = if Array.length Sys.argv > 1 then
    List.assoc Sys.argv.(1) [   
		 ("-s", Semantic);
		("-SC", SastCompile)]
  else SastCompile in
  let lexbuf = Lexing.from_channel stdin in
  let program = Parser.program Scanner.token lexbuf in
  match action with
    Semantic -> ignore(Semantic.check program)
  | SastCompile -> Ccompilesast.translate (Semantic.check program)
