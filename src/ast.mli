{ open Parser }

(*Building Blocks*)
let sep = ['-' '_'];;
let lAlpha = ['a' - 'z'];;
let uAlpha = ['A' - 'Z'];;
let Alpha = ['a' - 'z' 'A' - 'Z'];;
let ints = ['0' - '9'];;
let floats = ['0' - '9']+.['0'-'9'](1,8);; (*TODO: Make sure this regular expression works.*)
let AlphaNum = ['a' - 'z' 'A' - 'Z' '0' -'9'];;
let AlphaNumSep = 'a' - 'z' 'A' - 'Z' '0' - '9' '_' '-'];;

(*Only three primitives*)
let False = 'false';;
let True = 'true';;
let bool = (False | True);;

let string = '"'[.]*'"';;

let number = ints*(.nums*(1,8))?;; (*TODO: Confirm this works*)

(*Data types*)

(*Fundamentals*)
let ids = lAlpha+AlphaNumSep*
let varNames = lAlpha+AlphaNumSep*;; (*TODO: See if we can compose from previous regex*)
let funcNames = 


rule token =
    parse [' ' '\t' '\r' '\n'] {token lexbuf}
    | '+'                       {PLUS}
    | '-'			            {MINUS}
    | '*'		      	        {TIMES}
    | '/'		      	        {DIVIDE}
    | '**' 		      	        {EXPONENT}
    | ids as id                 {ID(id)} (*TODO: Create a symbol table and link*)
    | bool as lit               { BOOL(lit) } 
    | string                    { STRING(str) }
    | ints+ as lit              {INTEGER(lit)}
    | floats as lit             {FLOAT(lit)}
    | (' number '|' String '|' boolean ') {TYPES}
    | ';'                       {SEQUENCE}
    | '{'     	       	      	{OPENCB}
    | '}'			            {CLOSECB}
    | '('			            {OPENP}
    | ')'			            {CLOSEP}
    | '['                       {OPENB}
    | ']'                       {CLOSEB}
    | 'if'  	       	      	{IF}
    | 'else'		      	    {ELSE}
    | 'while'			        {WHILE}
    | 'for'			            {FOR}
    | eof	    	            {EOF}