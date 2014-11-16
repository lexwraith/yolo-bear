type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | INTEGER of (int)
  | CHAR of (string)
  | STRING of (string)
  | ID of (string)
  | EOF

open Parsing;;
# 1 "parser.mly"
 open Ast 
# 35 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIVIDE *);
  267 (* ASSIGN *);
  268 (* EQ *);
  269 (* NEQ *);
  270 (* LT *);
  271 (* LEQ *);
  272 (* GT *);
  273 (* GEQ *);
  274 (* RETURN *);
  275 (* IF *);
  276 (* ELSE *);
  277 (* FOR *);
  278 (* WHILE *);
  279 (* INT *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  280 (* INTEGER *);
  281 (* CHAR *);
  282 (* STRING *);
  283 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\003\000\004\000\004\000\007\000\007\000\
\005\000\005\000\002\000\006\000\006\000\008\000\008\000\008\000\
\008\000\008\000\008\000\008\000\010\000\010\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\011\000\011\000\012\000\
\012\000\000\000"

let yylen = "\002\000\
\000\000\002\000\002\000\008\000\000\000\001\000\001\000\003\000\
\000\000\002\000\003\000\000\000\002\000\002\000\003\000\003\000\
\005\000\007\000\009\000\005\000\000\000\001\000\001\000\001\000\
\001\000\001\000\003\000\004\000\003\000\000\000\001\000\001\000\
\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\000\000\002\000\003\000\000\000\
\000\000\011\000\007\000\000\000\000\000\000\000\000\000\009\000\
\008\000\000\000\010\000\000\000\000\000\012\000\004\000\000\000\
\000\000\000\000\000\000\023\000\024\000\025\000\000\000\013\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\014\000\029\000\016\000\015\000\000\000\022\000\000\000\
\000\000\032\000\000\000\000\000\027\000\000\000\000\000\000\000\
\028\000\000\000\000\000\000\000\020\000\033\000\000\000\000\000\
\018\000\000\000\000\000\019\000"

let yydgoto = "\002\000\
\003\000\006\000\007\000\012\000\018\000\020\000\013\000\032\000\
\033\000\048\000\051\000\052\000"

let yysindex = "\005\000\
\000\000\000\000\242\254\241\254\024\255\000\000\000\000\030\255\
\005\255\000\000\000\000\035\255\033\255\037\255\021\255\000\000\
\000\000\028\255\000\000\003\255\052\255\000\000\000\000\052\255\
\057\255\060\255\063\255\000\000\000\000\000\000\255\254\000\000\
\070\255\071\255\031\255\074\255\052\255\052\255\052\255\052\255\
\052\255\000\000\000\000\000\000\000\000\080\255\000\000\083\255\
\082\255\000\000\085\255\075\255\000\000\078\255\052\255\078\255\
\000\000\052\255\081\255\090\255\000\000\000\000\078\255\052\255\
\000\000\095\255\078\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\106\000\000\000\000\000\000\000\000\000\000\000\
\104\255\000\000\000\000\000\000\105\255\000\000\000\000\000\000\
\000\000\042\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\039\255\000\000\
\000\000\000\000\000\000\000\000\000\000\108\255\000\000\107\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\109\255\000\000\000\000\108\255\000\000\
\000\000\000\000\068\255\000\000\000\000\000\000\000\000\110\255\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\093\000\000\000\000\000\000\000\092\000\000\000\204\255\
\235\255\215\255\000\000\000\000"

let yytablesize = 114
let yytable = "\034\000\
\040\000\059\000\036\000\061\000\021\000\001\000\022\000\023\000\
\004\000\041\000\065\000\008\000\005\000\060\000\068\000\046\000\
\047\000\049\000\050\000\053\000\024\000\025\000\066\000\026\000\
\027\000\009\000\028\000\029\000\030\000\031\000\010\000\011\000\
\021\000\047\000\022\000\044\000\062\000\014\000\015\000\026\000\
\016\000\026\000\047\000\012\000\026\000\012\000\012\000\017\000\
\024\000\025\000\004\000\026\000\027\000\021\000\028\000\029\000\
\030\000\031\000\037\000\012\000\012\000\038\000\012\000\012\000\
\039\000\012\000\012\000\012\000\012\000\017\000\042\000\017\000\
\017\000\043\000\045\000\028\000\029\000\030\000\031\000\021\000\
\058\000\022\000\054\000\055\000\056\000\017\000\017\000\057\000\
\017\000\017\000\064\000\017\000\017\000\017\000\017\000\024\000\
\025\000\067\000\026\000\027\000\063\000\028\000\029\000\030\000\
\031\000\034\000\005\000\006\000\021\000\030\000\019\000\031\000\
\021\000\035\000"

let yycheck = "\021\000\
\002\001\054\000\024\000\056\000\002\001\001\000\004\001\005\001\
\023\001\011\001\063\000\027\001\027\001\055\000\067\000\037\000\
\038\000\039\000\040\000\041\000\018\001\019\001\064\000\021\001\
\022\001\002\001\024\001\025\001\026\001\027\001\001\001\027\001\
\002\001\055\000\004\001\005\001\058\000\003\001\006\001\001\001\
\004\001\003\001\064\000\002\001\006\001\004\001\005\001\027\001\
\018\001\019\001\023\001\021\001\022\001\002\001\024\001\025\001\
\026\001\027\001\002\001\018\001\019\001\002\001\021\001\022\001\
\002\001\024\001\025\001\026\001\027\001\002\001\001\001\004\001\
\005\001\003\001\001\001\024\001\025\001\026\001\027\001\002\001\
\006\001\004\001\003\001\001\001\003\001\018\001\019\001\003\001\
\021\001\022\001\001\001\024\001\025\001\026\001\027\001\018\001\
\019\001\003\001\021\001\022\001\020\001\024\001\025\001\026\001\
\027\001\000\000\003\001\003\001\001\001\003\001\018\000\003\001\
\003\001\022\000"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  EOF\000\
  "

let yynames_block = "\
  INTEGER\000\
  CHAR\000\
  STRING\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "parser.mly"
                 ( [], [] )
# 200 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 28 "parser.mly"
                 ( (_2 :: fst _1), snd _1 )
# 208 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 29 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 216 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 33 "parser.mly"
     ( { fname = _1;
	 formals = _3;
	 locals = List.rev _6;
	 body = List.rev _7 } )
# 229 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "parser.mly"
                  ( [] )
# 235 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 40 "parser.mly"
                  ( List.rev _1 )
# 242 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
                         ( [_1] )
# 249 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 44 "parser.mly"
                         ( _3 :: _1 )
# 257 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
                     ( [] )
# 263 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 48 "parser.mly"
                     ( _2 :: _1 )
# 271 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 51 "parser.mly"
               ( _2 )
# 278 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                   ( [] )
# 284 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 55 "parser.mly"
                   ( _2 :: _1 )
# 292 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 58 "parser.mly"
              ( Expr(_1) )
# 299 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                     ( Return(_2) )
# 306 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 60 "parser.mly"
                            ( Block(List.rev _2) )
# 313 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 321 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                                            ( If(_3, _5, _7) )
# 330 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 340 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 65 "parser.mly"
                                  ( While(_3, _5) )
# 348 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
                  ( Noexpr )
# 354 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 69 "parser.mly"
                  ( _1 )
# 361 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 73 "parser.mly"
                     ( Literal(_1) )
# 368 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
              ( Literal(_1) )
# 375 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 75 "parser.mly"
                ( Literal(_1) )
# 382 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 76 "parser.mly"
                     ( Id(_1) )
# 389 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                     ( Assign(_1, _3) )
# 397 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 88 "parser.mly"
                                 ( Call(_1, _3) )
# 405 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                       ( _2 )
# 412 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser.mly"
                  ( [] )
# 418 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 93 "parser.mly"
                  ( List.rev _1 )
# 425 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                            ( [_1] )
# 432 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                            ( _3 :: _1 )
# 440 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
