%{open Ast %}

%token PLUS MINUS TIMES DIVIDE EOF SEQ ASN
%token <int> LITERAL VARIABLE

$left VARIABLE
%left PLUS MINUS
%left TIMES DIVIDE

%start expr
%type <Ast.expr> expr

%%

expr:
    LITERAL 		 {Lit($1)}
|   VARIABLE 		 {Var($1)}
|   VARIABLE ASN expr    {Asn($1,$3)}
|   expr PLUS    expr    {Binop($1, Add, $3)}
|   expr MINUS 	 expr	 {Binop($1, Sub, $3)}
|   expr TIMES	 expr	 {Binop($1, Mul, $3)}
|   expr DIVIDE	 expr	 {Binop($1, Div, $3)}