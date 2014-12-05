{ open Parser }

let symbols = ['!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '_' '+' '=' '-' '[' ']'
              '{' '}' '|' '\\' ':' '"' ';' ''' '<' '>' '?' '.' '/' ' ']
let ascii = (['a'-'z' 'A'-'Z' '0'-'9']|symbols)
let numbers = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let alphanumeric = (numbers|alpha)
let bool = ('0' | '1' | "false" | "true")
let types = ("int" | "void" |"char")

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LBRAC }
| ']'      { RBRAC }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }
| "printf"  { PRINT }
| types as lxm { TYPE(lxm) }
| ['0'-'9']+ as lxm { ILITERAL(int_of_string lxm) } (*Scans literal integers*)
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) } (*Scans IDs*)
| '"' ascii* '"' as lxm { STR(lxm) } (* Strings*)
| '\'' ascii '\'' as lxm { CHR(lxm) } (* Chars *)
| eof { EOF } 
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
