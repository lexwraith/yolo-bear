{ open Parser }

let symbols = ['!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '_' '+' '=' '-' '[' ']'
              '{' '}' '|' '\\' ':' '"' ';' ''' '<' '>' '?' '.' '/' ' ']
let ascii = (['a'-'z' 'A'-'Z' '0'-'9']|symbols)
let numbers = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let alphanumeric = (numbers|alpha)
let bool = ('0' | '1' | "false" | "true")

(*Add floats token here*)

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
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
| "int"    { INT }
| "char"   { CHAR }
| "string" { STR }
| ['0'-'9']+ as lxm { INTEGER(int_of_string lxm) } (*Used for scanning integer literals*)
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) } (*Used for getting Var names*)

(*Our shit*)
| '"' (['a'-'z' 'A'-'Z' '0'-'9']|symbols)* '"' as s { STRING(s) } (*Syntactic sugar for char arrays*)
| ''' (['a'-'z' 'A'-'Z' '0'-'9']|symbols)? ''' as c { CHAR(c) } (*Single chars*)
(*| '{' (ascii ',')* ascii '}' as c {ARR_CHAR(c)}
| '{' bool ',' bool '}' as b {ARR_BOOL(b)}
=======
| '"' ((['a'-'z' 'A'-'Z' '0'-'9']|symbols)* as s) '"'  { STRING(s) } (*Syntactic sugar for char arrays*)
| ''' ((['a'-'z' 'A'-'Z' '0'-'9']|symbols)? as c) '''  { CHARACTER(Char.code c.[0]) } (*Single chars*) (* Recorded as int using its ASCII *)
(*| '{' (ascii ',')* ascii '}' as c {ARR_CHAR(c)}*)
(*| '{' bool ',' bool '}' as b {ARR_BOOL(b)}
>>>>>>> Modification-Test
| '{' '}'
| '{' '}'*)
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
