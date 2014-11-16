{ open Parser }

let symbols = ['!','@','#','$','%','^','&','*','(',')','_','+','=','-','[',']',
              '{','}','|','\',':','"',';',''','<','>','?',',','.','/'];
let ascii = (['a'-'z' 'A'-'Z' '0'-'9']|symbols)
let numbers = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let alphanumeric = (numbers|alpha)
let bool = ['false' 'true' '0' '1']
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
| ['0'-'9']+ as lxm { LITERAL(int_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
(*Our shit*)
| '"' (['a'-'z' 'A'-'Z' '0'-'9']|symbols)* '"' as s { STRING(s) }
| ''' (['a'-'z' 'A'-'Z' '0'-'9']|symbols)? ''' as c { CHAR(c) }
| '{' (ascii ',')* ascii '}' as c {ARR_CHAR(c)}
(*| '{' bool ',' bool '}' as b {ARR_BOOL(b)}
| '{' '}'
| '{' '}'*)
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
