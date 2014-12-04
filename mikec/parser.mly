%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA DQUOTE
%token PLUS MINUS TIMES DIVIDE ASSIGN
%token EQ NEQ LT LEQ GT GEQ
%token RETURN IF ELSE FOR WHILE
%token <string> TYPE
%token <int> ILITERAL
%token <string> ID
%token EOF PRINT

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE

%start program
%type <Ast.program> program

%%

/* 
program consists of two lists:
1 - global vars of string * string list
2 - func_decls list 
*/
program:
   /* nothing */ { [], [] }
 | program vdecl { ($2 :: fst $1), snd $1 } 
 | program fdecl { fst $1, ($2 :: snd $1) }

fdecl:
     TYPE ID LPAREN formals_opt RPAREN LBRACE stmt_list RBRACE
	{ 
	  { 
	    ftype = $1;
	    fname = $2;
	    formals = $4;
	    body = List.rev $7 
	  } 
	}

/* Note that the following two fall under fdecl */
formals_opt: 
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    TYPE ID                   { [($1,$2)] }
  | formal_list COMMA TYPE ID { ($3,$4) :: $1 }

vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

/* Note that in C, no statements or expressiosn allowed in file scope */
vdecl:
   TYPE ID SEMI { ($1,$2) } 

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
  | expr SEMI { Expr($1) }
  | TYPE ID SEMI { VDecl($1,$2) }
  | PRINT LPAREN expr RPAREN SEMI { Print($3) }
  | RETURN expr SEMI { Return($2) }
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
     { For($3, $5, $7, $9) }
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

expr:
    ILITERAL          { ILiteral($1) }
  | ID               { Id($1) }
  | expr PLUS   expr { Binop($1, Add,   $3) }
  | expr MINUS  expr { Binop($1, Sub,   $3) }
  | expr TIMES  expr { Binop($1, Mult,  $3) }
  | expr DIVIDE expr { Binop($1, Div,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | expr LT     expr { Binop($1, Less,  $3) }
  | expr LEQ    expr { Binop($1, Leq,   $3) }
  | expr GT     expr { Binop($1, Greater,  $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3) }
  | ID ASSIGN expr   { Assign($1, $3) }
  | TYPE ID ASSIGN expr { NAssign($1, $2, $4) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 }

actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
