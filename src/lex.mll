{}

(*Building Blocks*)
let sep = ['-' '_']
let lAlpha = ['a' - 'z']
let uAlpha = ['A' - 'Z']
let Alpha = ['a' - 'z' 'A' - 'Z']
let ints = ['0' - '9']
let AlphaNum = ['a' - 'z' 'A' - 'Z' '0' -'9']
let AlphaNumSep = ['a' - 'z' 'A' - 'Z' '0' - '9' '_' '-']

rule token =
    parse [' ' '\t' '\r' '\n'] {token lexbuf}
    | '+'                       {PLUS}
    | '-'			            {MINUS}
    | '*'		      	        {TIMES}
    | '/'		      	        {DIVIDE}
    | "**" 		      	        {EXPONENT}
    | Alpha AlphaNumSep* as id                 {ID(id)} (*TODO: Create a symbol table and link*)
    | ("false" | "true") as lit { BOOL(lit) } 
    | '"' _* '"'                    { STRING(str) }
    | ints+ as lit              {INTEGER(int_of_str lit)}
    | ints* ('.' ints+)? as lit             {FLOAT(float_of_str lit)}
    | ("number" | "String" | "boolean"  | "void" ) {TYPES}
    | ';'                       {SEQUENCE}
    | '{'     	       	      	{OPENCB}
    | '}'			            {CLOSECB}
    | '('			            {OPENP}
    | ')'			            {CLOSEP}
    | '['                       {OPENB}
    | ']'                       {CLOSEB}
    | "/*"                      {COMMENTO}
    | "*/"                      {COMMMENTC}
    | '>'			            {GT}
    | '<'			            {LT}
    | ">="			            {GEQ}
    | "<="			            {LEQ}
    | "if"  	       	      	{IF}
    | "else"		      	    {ELSE}
    | "while"			        {WHILE}
    | "for"			            {FOR}
    | "print"                   {PRINT}
    | "return"                  {RETURN}
    | '='                       {ASSIGN}
    | "=="                      {COMPARE}
    | eof	    	            {EOF}