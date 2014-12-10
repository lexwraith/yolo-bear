type action = Raw | Ast | Compile (*| Semantic*)

let _ =
  let action = if Array.length Sys.argv > 1 then
    List.assoc Sys.argv.(1) [ ("-r", Raw);
                              ("-a", Ast);
			    (*("-s", Semantic);*)
			      ("-C", Compile)]
  else Compile in
  let lexbuf = Lexing.from_channel stdin in
  let program = Parser.program Scanner.token lexbuf in
  match action with
    Raw -> print_string (Ast.program_s program)
  | Ast -> let listing = Ast.string_of_program program
           in print_string listing
  | Compile -> Ccompile.translate program
(*	| Semantic -> ignore(Semantic.check program)*)
