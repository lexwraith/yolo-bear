%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA LBRAC RBRAC
%token PLUS MINUS TIMES DIVIDE ASSIGN
%token EQ NEQ LT LEQ GT GEQ 
%token RETURN IF ELSE FOR WHILE
%token <string> TYPE STR CHR
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

/* Next two exclusively for file/global scope declarations */
vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

/* Note that in C, no statements or expressiosn allowed in file scope */
/* TODO: Make declaration only? Change program first element to stringstringstring */
vdecl:
    TYPE ID ASSIGN ILITERAL SEMI { ($1,$2, string_of_int $4) }
  | TYPE ID ASSIGN STR SEMI { ($1, $2, $4) }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

/* Cause side effects */
stmt:
  | expr SEMI { Expr($1) } /* TODO: This should never happen */
  | TYPE ID SEMI { VDecl($1,$2) }
  | PRINT LPAREN expr RPAREN SEMI { Print($3) }
  | RETURN expr SEMI { Return($2) }
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
     { For($3, $5, $7, $9) }
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }
  | TYPE ID ASSIGN expr SEMI{ NAssign($1, $2, $4) } /* TODO: This might need to move for chained assignments */

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

/* Resolve into something (no side effects) */

expr:
  literals           { $1 }
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
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 }
  | ID ASSIGN expr { Assign($1, $3) } /* For chained assignments */

literals:
    ILITERAL         { ILiteral($1) }
  | STR              { String($1) }
  | CHR              { Char($1) }


actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

array_opt:
    /* No array*/ { [] }
  | LBRAC ILITERAL RBRAC array_opt { [] } 
