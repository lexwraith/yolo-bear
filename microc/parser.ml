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
  | STR
  | CHAR
  | INTEGER of (int)
  | CHARACTER of (int)
  | STRING of (string)
  | ID of (string)
  | EOF

open Parsing;;
# 1 "parser.mly"
 open Ast 
# 37 "parser.ml"
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
  280 (* STR *);
  281 (* CHAR *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  282 (* INTEGER *);
  283 (* CHARACTER *);
  284 (* STRING *);
  285 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\003\000\004\000\004\000\007\000\007\000\
\005\000\005\000\002\000\002\000\006\000\006\000\008\000\008\000\
\008\000\008\000\008\000\008\000\008\000\010\000\010\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\011\000\011\000\012\000\012\000\000\000"

let yylen = "\002\000\
\000\000\002\000\002\000\008\000\000\000\001\000\001\000\003\000\
\000\000\002\000\003\000\003\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\004\000\003\000\
\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\000\000\000\000\002\000\003\000\
\000\000\000\000\000\000\011\000\012\000\007\000\000\000\000\000\
\000\000\000\000\009\000\008\000\000\000\010\000\000\000\000\000\
\013\000\004\000\000\000\000\000\000\000\000\000\024\000\025\000\
\026\000\000\000\014\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\015\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\040\000\
\017\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\030\000\031\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\039\000\
\000\000\000\000\000\000\021\000\000\000\000\000\000\000\019\000\
\000\000\000\000\020\000"

let yydgoto = "\002\000\
\003\000\007\000\008\000\015\000\021\000\023\000\016\000\035\000\
\036\000\061\000\064\000\065\000"

let yysindex = "\038\000\
\000\000\000\000\051\255\014\255\017\255\058\255\000\000\000\000\
\052\255\063\255\036\255\000\000\000\000\000\000\074\255\065\255\
\079\255\050\255\000\000\000\000\246\254\000\000\040\255\006\255\
\000\000\000\000\006\255\086\255\089\255\090\255\000\000\000\000\
\000\000\255\254\000\000\166\255\027\000\068\255\183\255\006\255\
\006\255\006\255\006\255\006\255\000\000\006\255\006\255\006\255\
\006\255\006\255\006\255\006\255\006\255\006\255\006\255\000\000\
\000\000\000\000\042\000\085\000\092\255\057\000\085\000\097\255\
\098\255\085\000\046\255\046\255\000\000\000\000\096\000\096\000\
\107\255\107\255\107\255\107\255\120\255\006\255\120\255\000\000\
\006\255\083\255\104\255\000\000\085\000\120\255\006\255\000\000\
\115\255\120\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\111\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\116\255\000\000\000\000\000\000\000\000\117\255\
\000\000\000\000\000\000\000\000\080\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\149\255\000\000\000\000\000\000\000\000\000\000\000\000\
\122\255\000\000\118\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\004\255\000\000\000\000\003\255\000\000\
\125\255\075\255\200\255\217\255\000\000\000\000\074\000\078\000\
\035\255\234\255\251\255\012\000\000\000\122\255\000\000\000\000\
\000\000\108\255\000\000\000\000\034\255\000\000\128\255\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\104\000\000\000\000\000\000\000\107\000\000\000\181\255\
\232\255\190\255\000\000\000\000"

let yytablesize = 369
let yytable = "\037\000\
\043\000\082\000\039\000\084\000\023\000\043\000\023\000\024\000\
\043\000\044\000\088\000\083\000\004\000\005\000\091\000\059\000\
\060\000\062\000\063\000\066\000\089\000\067\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\075\000\076\000\031\000\
\032\000\033\000\034\000\034\000\044\000\034\000\001\000\044\000\
\034\000\024\000\009\000\025\000\026\000\010\000\034\000\034\000\
\034\000\034\000\034\000\034\000\012\000\060\000\048\000\049\000\
\085\000\027\000\028\000\011\000\029\000\030\000\060\000\013\000\
\014\000\031\000\032\000\033\000\034\000\024\000\018\000\025\000\
\057\000\004\000\005\000\038\000\017\000\038\000\020\000\006\000\
\038\000\013\000\019\000\013\000\013\000\027\000\028\000\040\000\
\029\000\030\000\041\000\042\000\078\000\031\000\032\000\033\000\
\034\000\013\000\013\000\080\000\013\000\013\000\086\000\081\000\
\087\000\013\000\013\000\013\000\013\000\018\000\045\000\018\000\
\018\000\046\000\047\000\048\000\049\000\090\000\005\000\006\000\
\041\000\024\000\022\000\025\000\022\000\018\000\018\000\042\000\
\018\000\018\000\022\000\038\000\000\000\018\000\018\000\018\000\
\018\000\027\000\028\000\000\000\029\000\030\000\000\000\000\000\
\000\000\031\000\032\000\033\000\034\000\027\000\000\000\027\000\
\000\000\000\000\027\000\027\000\027\000\027\000\027\000\000\000\
\027\000\027\000\027\000\027\000\027\000\027\000\045\000\000\000\
\000\000\000\000\000\000\000\000\046\000\047\000\048\000\049\000\
\000\000\050\000\051\000\052\000\053\000\054\000\055\000\058\000\
\000\000\000\000\000\000\000\000\000\000\046\000\047\000\048\000\
\049\000\000\000\050\000\051\000\052\000\053\000\054\000\055\000\
\028\000\000\000\028\000\000\000\000\000\028\000\028\000\028\000\
\000\000\000\000\000\000\028\000\028\000\028\000\028\000\028\000\
\028\000\029\000\000\000\029\000\000\000\000\000\029\000\029\000\
\029\000\000\000\000\000\000\000\029\000\029\000\029\000\029\000\
\029\000\029\000\035\000\000\000\035\000\000\000\000\000\035\000\
\000\000\000\000\000\000\000\000\000\000\035\000\035\000\035\000\
\035\000\035\000\035\000\036\000\000\000\036\000\000\000\000\000\
\036\000\000\000\000\000\000\000\000\000\000\000\036\000\036\000\
\036\000\036\000\036\000\036\000\037\000\000\000\037\000\000\000\
\000\000\037\000\000\000\000\000\000\000\000\000\000\000\037\000\
\037\000\037\000\037\000\037\000\037\000\056\000\000\000\000\000\
\000\000\046\000\047\000\048\000\049\000\000\000\050\000\051\000\
\052\000\053\000\054\000\055\000\077\000\000\000\000\000\000\000\
\046\000\047\000\048\000\049\000\000\000\050\000\051\000\052\000\
\053\000\054\000\055\000\079\000\000\000\000\000\000\000\046\000\
\047\000\048\000\049\000\000\000\050\000\051\000\052\000\053\000\
\054\000\055\000\032\000\000\000\032\000\000\000\033\000\032\000\
\033\000\000\000\000\000\033\000\000\000\032\000\032\000\000\000\
\000\000\033\000\033\000\046\000\047\000\048\000\049\000\000\000\
\050\000\051\000\052\000\053\000\054\000\055\000\046\000\047\000\
\048\000\049\000\000\000\000\000\000\000\052\000\053\000\054\000\
\055\000"

let yycheck = "\024\000\
\002\001\077\000\027\000\079\000\001\001\003\001\003\001\002\001\
\006\001\011\001\086\000\078\000\023\001\024\001\090\000\040\000\
\041\000\042\000\043\000\044\000\087\000\046\000\047\000\048\000\
\049\000\050\000\051\000\052\000\053\000\054\000\055\000\026\001\
\027\001\028\001\029\001\001\001\003\001\003\001\001\000\006\001\
\006\001\002\001\029\001\004\001\005\001\029\001\012\001\013\001\
\014\001\015\001\016\001\017\001\001\001\078\000\009\001\010\001\
\081\000\018\001\019\001\002\001\021\001\022\001\087\000\001\001\
\029\001\026\001\027\001\028\001\029\001\002\001\006\001\004\001\
\005\001\023\001\024\001\001\001\003\001\003\001\029\001\029\001\
\006\001\002\001\004\001\004\001\005\001\018\001\019\001\002\001\
\021\001\022\001\002\001\002\001\001\001\026\001\027\001\028\001\
\029\001\018\001\019\001\003\001\021\001\022\001\020\001\006\001\
\001\001\026\001\027\001\028\001\029\001\002\001\000\000\004\001\
\005\001\007\001\008\001\009\001\010\001\003\001\003\001\003\001\
\003\001\002\001\001\001\004\001\021\000\018\001\019\001\003\001\
\021\001\022\001\003\001\025\000\255\255\026\001\027\001\028\001\
\029\001\018\001\019\001\255\255\021\001\022\001\255\255\255\255\
\255\255\026\001\027\001\028\001\029\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\009\001\010\001\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\001\001\255\255\
\255\255\255\255\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\012\001\013\001\014\001\015\001\016\001\017\001\001\001\
\255\255\255\255\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\001\001\255\255\003\001\255\255\255\255\006\001\007\001\008\001\
\255\255\255\255\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\255\255\255\255\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\001\001\255\255\003\001\255\255\255\255\006\001\
\255\255\255\255\255\255\255\255\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\255\255\255\255\255\255\012\001\013\001\
\014\001\015\001\016\001\017\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\255\255\255\255\255\255\012\001\
\013\001\014\001\015\001\016\001\017\001\003\001\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\012\001\013\001\
\014\001\015\001\016\001\017\001\003\001\255\255\255\255\255\255\
\007\001\008\001\009\001\010\001\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\003\001\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\001\001\255\255\003\001\255\255\001\001\006\001\
\003\001\255\255\255\255\006\001\255\255\012\001\013\001\255\255\
\255\255\012\001\013\001\007\001\008\001\009\001\010\001\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\014\001\015\001\016\001\
\017\001"

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
  STR\000\
  CHAR\000\
  EOF\000\
  "

let yynames_block = "\
  INTEGER\000\
  CHARACTER\000\
  STRING\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "parser.mly"
                 ( [], [] )
# 281 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 28 "parser.mly"
                 ( (_2 :: fst _1), snd _1 )
# 289 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 29 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 297 "parser.ml"
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
# 310 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "parser.mly"
                  ( [] )
# 316 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 40 "parser.mly"
                  ( List.rev _1 )
# 323 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
                         ( [_1] )
# 330 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 44 "parser.mly"
                         ( _3 :: _1 )
# 338 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
                     ( [] )
# 344 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 48 "parser.mly"
                     ( _2 :: _1 )
# 352 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 51 "parser.mly"
               ( _2 )
# 359 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 52 "parser.mly"
               ( _2 )
# 366 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                   ( [] )
# 372 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 56 "parser.mly"
                   ( _2 :: _1 )
# 380 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
              ( Expr(_1) )
# 387 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 60 "parser.mly"
                     ( Return(_2) )
# 394 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 61 "parser.mly"
                            ( Block(List.rev _2) )
# 401 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 409 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 63 "parser.mly"
                                            ( If(_3, _5, _7) )
# 418 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 65 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 428 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 66 "parser.mly"
                                  ( While(_3, _5) )
# 436 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "parser.mly"
                  ( Noexpr )
# 442 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
                  ( _1 )
# 449 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 74 "parser.mly"
                     ( Literal(Int _1) )
# 456 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 75 "parser.mly"
                     ( Literal(Int _1) )
# 463 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 76 "parser.mly"
                  ( Literal(String _1) )
# 470 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 77 "parser.mly"
                     ( Id(_1) )
# 477 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 485 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 493 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 501 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 509 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 517 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 525 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 533 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 541 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 549 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 557 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                     ( Assign(_1, _3) )
# 565 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 89 "parser.mly"
                                 ( Call(_1, _3) )
# 573 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                       ( _2 )
# 580 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
                  ( [] )
# 586 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 94 "parser.mly"
                  ( List.rev _1 )
# 593 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                            ( [_1] )
# 600 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                            ( _3 :: _1 )
# 608 "parser.ml"
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
