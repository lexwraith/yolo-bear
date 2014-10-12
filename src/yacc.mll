%{ open Ast %}

%token PLUS MINUS TIMES DIVIDE SEQUENCE EOF
%token EXPONENT OPENCB CLOSECB OPENP CLOSEP OPENB CLOSEB GT LT
%token IF ELSE WHILE FOR 
%token <int> LITERAL VARIABLE ASSIGN
%token <int> INTEGER
%token <float> FLOAT
%token <string> STRING ID BOOL TYPES


%left SEQUENCE
%left ASSIGN
%left PLUS MINUS
%left TIMES DIVIDE

%start expr
%type <Ast.expr> expr

%%

expr:
		expr PLUS		expr	{ Binop($1, Add, $3) }
	| expr MINUS	expr	{ Binop($1, Sub, $3) }
	| expr TIMES	expr	{ Binop($1, Mul, $3) }
	| expr DIVIDE	expr	{ Binop($1, Div, $3) }
	| LITERAL						{ Lit($1) }
	| expr SEQUENCE expr { Seq($1, $3) }
	| ASSIGN expr	{ Asn($1, $2) }
	| VARIABLE					{ Var($1) }