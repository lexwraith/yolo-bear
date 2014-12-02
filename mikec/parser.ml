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
  | VOID
  | LITERAL of (int)
  | ID of (string)
  | EOF

open Parsing;;
# 1 "parser.mly"
 open Ast 
# 34 "parser.ml"
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
  280 (* VOID *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  281 (* LITERAL *);
  282 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\003\000\003\000\004\000\004\000\007\000\
\007\000\005\000\005\000\002\000\006\000\006\000\008\000\008\000\
\008\000\008\000\008\000\008\000\008\000\010\000\010\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\011\000\011\000\
\012\000\012\000\000\000"

let yylen = "\002\000\
\000\000\002\000\002\000\008\000\009\000\000\000\001\000\001\000\
\003\000\000\000\002\000\003\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\004\000\003\000\000\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\000\000\000\000\002\000\003\000\
\000\000\000\000\000\000\012\000\000\000\008\000\000\000\000\000\
\000\000\000\000\000\000\000\000\010\000\009\000\010\000\000\000\
\000\000\011\000\000\000\000\000\000\000\013\000\004\000\000\000\
\000\000\000\000\000\000\024\000\000\000\014\000\000\000\005\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\015\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\038\000\017\000\016\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\028\000\029\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\037\000\000\000\000\000\000\000\021\000\
\000\000\000\000\000\000\019\000\000\000\000\000\020\000"

let yydgoto = "\002\000\
\003\000\026\000\008\000\015\000\024\000\027\000\016\000\038\000\
\039\000\065\000\068\000\069\000"

let yysindex = "\008\000\
\000\000\000\000\238\254\006\255\012\255\050\255\000\000\000\000\
\058\255\061\255\041\255\000\000\041\255\000\000\071\255\070\255\
\076\255\077\255\075\255\093\255\000\000\000\000\000\000\085\255\
\085\255\000\000\029\255\039\255\010\255\000\000\000\000\010\255\
\111\255\112\255\116\255\000\000\255\254\000\000\150\255\000\000\
\028\000\064\255\167\255\010\255\010\255\010\255\010\255\010\255\
\000\000\010\255\010\255\010\255\010\255\010\255\010\255\010\255\
\010\255\010\255\010\255\000\000\000\000\000\000\043\000\069\000\
\126\255\058\000\069\000\127\255\125\255\069\000\078\255\078\255\
\000\000\000\000\080\000\080\000\097\255\097\255\097\255\097\255\
\107\255\010\255\107\255\000\000\010\255\115\255\136\255\000\000\
\069\000\107\255\010\255\000\000\135\255\107\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\144\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\149\255\000\000\149\255\000\000\000\000\151\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\073\255\
\073\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\133\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\152\255\000\000\153\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\069\255\
\000\000\000\000\043\255\000\000\158\255\036\255\184\255\201\255\
\000\000\000\000\001\255\109\255\218\255\235\255\252\255\013\000\
\000\000\152\255\000\000\000\000\000\000\098\255\000\000\000\000\
\090\255\000\000\166\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\152\000\000\000\157\000\148\000\015\000\000\000\246\255\
\227\255\185\255\000\000\000\000"

let yytablesize = 353
let yytable = "\041\000\
\047\000\030\000\043\000\030\000\004\000\005\000\030\000\006\000\
\001\000\048\000\087\000\029\000\030\000\030\000\063\000\064\000\
\066\000\067\000\070\000\093\000\071\000\072\000\073\000\074\000\
\075\000\076\000\077\000\078\000\079\000\080\000\029\000\009\000\
\030\000\031\000\036\000\037\000\036\000\010\000\036\000\028\000\
\029\000\036\000\030\000\040\000\042\000\041\000\032\000\033\000\
\041\000\034\000\035\000\011\000\064\000\036\000\037\000\089\000\
\032\000\033\000\012\000\034\000\035\000\064\000\013\000\036\000\
\037\000\029\000\014\000\030\000\061\000\023\000\086\000\023\000\
\088\000\018\000\013\000\019\000\013\000\013\000\020\000\092\000\
\021\000\032\000\033\000\095\000\034\000\035\000\052\000\053\000\
\036\000\037\000\013\000\013\000\042\000\013\000\013\000\042\000\
\023\000\013\000\013\000\018\000\022\000\018\000\018\000\050\000\
\051\000\052\000\053\000\004\000\029\000\031\000\030\000\031\000\
\044\000\045\000\031\000\018\000\018\000\046\000\018\000\018\000\
\031\000\031\000\018\000\018\000\032\000\033\000\082\000\034\000\
\035\000\084\000\085\000\036\000\037\000\025\000\090\000\025\000\
\091\000\094\000\025\000\025\000\025\000\025\000\025\000\043\000\
\025\000\025\000\025\000\025\000\025\000\025\000\049\000\006\000\
\022\000\007\000\007\000\039\000\050\000\051\000\052\000\053\000\
\040\000\054\000\055\000\056\000\057\000\058\000\059\000\062\000\
\022\000\017\000\025\000\000\000\000\000\050\000\051\000\052\000\
\053\000\000\000\054\000\055\000\056\000\057\000\058\000\059\000\
\026\000\000\000\026\000\000\000\000\000\026\000\026\000\026\000\
\000\000\000\000\000\000\026\000\026\000\026\000\026\000\026\000\
\026\000\027\000\000\000\027\000\000\000\000\000\027\000\027\000\
\027\000\000\000\000\000\000\000\027\000\027\000\027\000\027\000\
\027\000\027\000\032\000\000\000\032\000\000\000\000\000\032\000\
\000\000\000\000\000\000\000\000\000\000\032\000\032\000\032\000\
\032\000\032\000\032\000\033\000\000\000\033\000\000\000\000\000\
\033\000\000\000\000\000\000\000\000\000\000\000\033\000\033\000\
\033\000\033\000\033\000\033\000\034\000\000\000\034\000\000\000\
\000\000\034\000\000\000\000\000\000\000\000\000\000\000\034\000\
\034\000\034\000\034\000\034\000\034\000\035\000\000\000\035\000\
\000\000\000\000\035\000\000\000\000\000\000\000\000\000\000\000\
\035\000\035\000\035\000\035\000\035\000\035\000\060\000\000\000\
\000\000\000\000\050\000\051\000\052\000\053\000\000\000\054\000\
\055\000\056\000\057\000\058\000\059\000\081\000\000\000\000\000\
\000\000\050\000\051\000\052\000\053\000\000\000\054\000\055\000\
\056\000\057\000\058\000\059\000\083\000\000\000\000\000\000\000\
\050\000\051\000\052\000\053\000\000\000\054\000\055\000\056\000\
\057\000\058\000\059\000\050\000\051\000\052\000\053\000\000\000\
\054\000\055\000\056\000\057\000\058\000\059\000\050\000\051\000\
\052\000\053\000\000\000\000\000\000\000\056\000\057\000\058\000\
\059\000"

let yycheck = "\029\000\
\002\001\001\001\032\000\003\001\023\001\024\001\006\001\026\001\
\001\000\011\001\082\000\002\001\012\001\013\001\044\000\045\000\
\046\000\047\000\048\000\091\000\050\000\051\000\052\000\053\000\
\054\000\055\000\056\000\057\000\058\000\059\000\002\001\026\001\
\004\001\005\001\025\001\026\001\001\001\026\001\003\001\025\000\
\002\001\006\001\004\001\005\001\030\000\003\001\018\001\019\001\
\006\001\021\001\022\001\002\001\082\000\025\001\026\001\085\000\
\018\001\019\001\001\001\021\001\022\001\091\000\002\001\025\001\
\026\001\002\001\026\001\004\001\005\001\001\001\081\000\003\001\
\083\000\003\001\002\001\006\001\004\001\005\001\003\001\090\000\
\004\001\018\001\019\001\094\000\021\001\022\001\009\001\010\001\
\025\001\026\001\018\001\019\001\003\001\021\001\022\001\006\001\
\004\001\025\001\026\001\002\001\026\001\004\001\005\001\007\001\
\008\001\009\001\010\001\023\001\002\001\001\001\004\001\003\001\
\002\001\002\001\006\001\018\001\019\001\002\001\021\001\022\001\
\012\001\013\001\025\001\026\001\018\001\019\001\001\001\021\001\
\022\001\003\001\006\001\025\001\026\001\001\001\020\001\003\001\
\001\001\003\001\006\001\007\001\008\001\009\001\010\001\000\000\
\012\001\013\001\014\001\015\001\016\001\017\001\001\001\003\001\
\001\001\003\001\003\000\003\001\007\001\008\001\009\001\010\001\
\003\001\012\001\013\001\014\001\015\001\016\001\017\001\001\001\
\003\001\013\000\023\000\255\255\255\255\007\001\008\001\009\001\
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
\013\001\014\001\015\001\016\001\017\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\003\001\255\255\
\255\255\255\255\007\001\008\001\009\001\010\001\255\255\012\001\
\013\001\014\001\015\001\016\001\017\001\003\001\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\012\001\013\001\
\014\001\015\001\016\001\017\001\003\001\255\255\255\255\255\255\
\007\001\008\001\009\001\010\001\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\007\001\008\001\009\001\010\001\255\255\
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
  VOID\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 25 "parser.mly"
                 ( [], [] )
# 268 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 26 "parser.mly"
                 ( (_2 :: fst _1), snd _1 )
# 276 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 27 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 284 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 31 "parser.mly"
     ( { fname = _1;
	 formals = _3;
	 locals = List.rev _6;
	 body = List.rev _7 } )
# 297 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 37 "parser.mly"
 ( { fname = _2;
	    formals = _4;
	    locals = List.rev _7;
	    body = List.rev _8 } )
# 310 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 44 "parser.mly"
                  ( [] )
# 316 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 45 "parser.mly"
                  ( List.rev _1 )
# 323 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 48 "parser.mly"
                         ( [_1] )
# 330 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 49 "parser.mly"
                         ( _3 :: _1 )
# 338 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
                     ( [] )
# 344 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 53 "parser.mly"
                     ( _2 :: _1 )
# 352 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 56 "parser.mly"
               ( _2 )
# 359 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
                   ( [] )
# 365 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                   ( _2 :: _1 )
# 373 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
              ( Expr(_1) )
# 380 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                     ( Return(_2) )
# 387 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 66 "parser.mly"
                            ( Block(List.rev _2) )
# 394 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 67 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 402 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 68 "parser.mly"
                                            ( If(_3, _5, _7) )
# 411 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 70 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 421 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                                  ( While(_3, _5) )
# 429 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
                  ( Noexpr )
# 435 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                  ( _1 )
# 442 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 78 "parser.mly"
                     ( Literal(_1) )
# 449 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 79 "parser.mly"
                     ( Id(_1) )
# 456 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 464 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 472 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 480 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 488 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 496 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 504 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 512 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 520 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 528 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 536 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                     ( Assign(_1, _3) )
# 544 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 91 "parser.mly"
                                 ( Call(_1, _3) )
# 552 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                       ( _2 )
# 559 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
                  ( [] )
# 565 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 96 "parser.mly"
                  ( List.rev _1 )
# 572 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                            ( [_1] )
# 579 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                            ( _3 :: _1 )
# 587 "parser.ml"
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
