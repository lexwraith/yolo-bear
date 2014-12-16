%{ 
open Ast

let str_of_c s = Char.escaped s

let explode s =
  let rec exp i l =
    if i < 0 
        then l 
    else if i > 0 && s.[i-1] = '\\'
        then exp (i - 2) (String.concat "" [str_of_c s.[i-1];str_of_c s.[i]] :: l)
    else exp (i - 1) ((str_of_c s.[i]) :: l) in
  exp (String.length s - 1) []


%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA LBRAC RBRAC
%token PLUS MINUS TIMES DIVIDE ASSIGN
%token EQ NEQ LT LEQ GT GEQ 
%token RETURN IF ELSE FOR WHILE
%token BREAK CONST CONTINUE EXTERN STATIC DECR INCR
%token STRUCT
%token <string> STR CHR ID FLITERAL TYPE
%token <int> ILITERAL
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

program:
   /* nothing */ { [], [] }
 | program vdecl { ($2 :: fst $1), snd $1 } 
 | program fdecl { fst $1, ($2 :: snd $1) }

fdecl:
     TYPE ID LPAREN formals_opt RPAREN LBRACE stmt_list RBRACE
	{ 
	  { 
	    ftype = $1;
			typebrackets = 0;
	    fname = $2;
	    formals = $4;
	    body = List.rev $7 
			
	  } 
	}
	| TYPE fbrackets_list ID LPAREN formals_opt RPAREN LBRACE stmt_list RBRACE
	{ 
	  { 
	    ftype = $1;
			typebrackets = $2;
	    fname = $3;
	    formals = $5;
	    body = List.rev $8 
			
	  } 
	}
	
fbrackets_list:
	 LBRAC RBRAC { 1 }
  | LBRAC RBRAC fbrackets_list { 1 + $3 }

/* Note that the following two fall under fdecl */
formals_opt: 
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    formal                    { [$1] }
  | formal_list COMMA formal { $3 :: $1 }

formal:
    TYPE ID                   {  ($1 ,$2, 0)  }
  | TYPE ID dbrackets_list    { ($1, $2, $3) }

/* Next two exclusively for file/global scope declarations */
vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }
  

/* Trying to fix this results in error AFTER compiler is written. Strange. */
vdecl:
    TYPE ID ASSIGN ILITERAL SEMI { ($1, $2, string_of_int $4) }
  | TYPE ID ASSIGN STR SEMI { ($1, $2, $4) }
  | TYPE ID ASSIGN CHR SEMI { ($1, $2, $4) }
  | TYPE ID ASSIGN FLITERAL SEMI { ($1, $2, $4) }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

    /* TODO: Could consolidate opt/list pairs */
stmt:
    BREAK SEMI { Flow("break;") }
  | CONTINUE SEMI { Flow("continue;") }
  | expr SEMI { Expr($1) }
  | TYPE ID SEMI { VDecl($1,$2) }
  | TYPE id_list SEMI { VDecllist($1,$2) }
  | TYPE ID brackets_list SEMI { Arr($1,$2, List.rev $3) }
  | TYPE ID brackets_list ASSIGN elem_list_braces SEMI { Braces($1,$2, $3, $5) }
  | TYPE ID brackets_list ASSIGN expr SEMI { AAssign($1, $2, $3, $5) }
  | TYPE ID ASSIGN expr SEMI{ NAssign($1, $2, $4) }
  | TYPE ID dbrackets_list SEMI { DArr($1, $2, $3) }
  | TYPE ID dbrackets_list ASSIGN elem_list_braces SEMI { DBraces($1,$2,$3,$5) }
  | TYPE ID dbrackets_list ASSIGN strliterals SEMI { SAssign($1,$2,$3,explode($5))}
  | ID brackets_list ASSIGN expr SEMI { AAssign("", $1, $2, $4) }
  | PRINT LPAREN strliterals RPAREN SEMI { Print($3) }
  | PRINT LPAREN strliterals COMMA id_list RPAREN SEMI {Printlist($3,$5)}
  | RETURN expr SEMI { Return($2) }
  | RETURN SEMI {Return(Noexpr)}
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt   { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
     { For($3, $5, $7, $9) }
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }

vdecl_opt:
  /* nothing */ { Noexpr}
  | expr {$1}

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

dbrackets_list:
  LBRAC RBRAC { 1 }
  | LBRAC RBRAC dbrackets_list { 1 + $3 }

expr:
  literals           { $1 }
  | ids              { $1 }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 }
  | ID ASSIGN expr      { Assign($1, $3) } /* For chained assignments */
 /*  | ID INCR            { Id($1) + 1 } */
/*  | ID DECR         { Id($1) + 1 } */
  | binop            { $1 }

ids:
  ID               { Id($1) }
  | ID dbrackets_list { DArrId($1,$2) }
  | ID brackets_list { ArrId($1, $2) }


binop:
   expr PLUS   expr  { Binop($1, Add,   $3) }
  | expr MINUS  expr { Binop($1, Sub,   $3) }
  | expr TIMES  expr { Binop($1, Mult,  $3) }
  | expr DIVIDE expr { Binop($1, Div,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | expr LT     expr { Binop($1, Less,  $3) }
  | expr LEQ    expr { Binop($1, Leq,   $3) }
  | expr GT     expr { Binop($1, Greater,  $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3) }

literals:
    ILITERAL         { ILiteral($1) }
  | FLITERAL         { Float($1) }
  | STR              { String($1) }
  | CHR              { Char($1) }

strliterals:
    ILITERAL         {string_of_int $1}
  | FLITERAL         { $1 }
  | STR              { $1 }
  | CHR              { $1 }

id_list:
  ID { [$1] }
  |  ID COMMA id_list { $1 :: $3}

actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

brackets_opt:
  /*Nothing*/ {[]}
  | brackets_list { $1 }

brackets_list:
   LBRAC expr RBRAC { [$2] }
  | brackets_list LBRAC expr RBRAC { $3::$1 }

elem_list_braces:
  LBRACE elem_list RBRACE { $2 }

elem_list:
  elem { [$1] }
  | elem COMMA elem_list {$1 :: $3} 

elem: 
  strliterals { ElemLiteral($1) } 
  | LBRACE elem_list RBRACE { ElemList($2) }

