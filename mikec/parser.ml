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
\001\000\001\000\001\000\003\000\003\000\003\000\004\000\004\000\
\007\000\007\000\005\000\005\000\002\000\006\000\006\000\008\000\
\008\000\008\000\008\000\008\000\008\000\008\000\010\000\010\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\011\000\011\000\012\000\012\000\000\000"

let yylen = "\002\000\
\000\000\002\000\002\000\008\000\009\000\009\000\000\000\001\000\
\001\000\003\000\000\000\002\000\003\000\000\000\002\000\002\000\
\003\000\003\000\005\000\007\000\009\000\005\000\000\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\004\000\004\000\003\000\
\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\000\000\000\000\002\000\003\000\
\000\000\000\000\000\000\013\000\000\000\000\000\009\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\011\000\
\010\000\011\000\011\000\000\000\000\000\000\000\000\000\012\000\
\000\000\000\000\000\000\000\000\000\000\014\000\004\000\000\000\
\000\000\000\000\000\000\000\000\025\000\000\000\015\000\000\000\
\006\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\040\000\018\000\
\017\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\029\000\030\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\039\000\000\000\000\000\000\000\022\000\000\000\000\000\000\000\
\020\000\000\000\000\000\021\000"

let yydgoto = "\002\000\
\003\000\032\000\008\000\016\000\028\000\033\000\017\000\047\000\
\048\000\076\000\080\000\081\000"

let yysindex = "\008\000\
\000\000\000\000\078\255\246\254\250\254\034\255\000\000\000\000\
\133\255\068\255\049\255\000\000\049\255\049\255\000\000\070\255\
\076\255\084\255\088\255\091\255\074\255\104\255\112\255\000\000\
\000\000\000\000\000\000\098\255\098\255\098\255\099\255\000\000\
\033\255\058\255\067\255\128\255\021\255\000\000\000\000\021\255\
\136\255\139\255\144\255\124\255\000\000\032\255\000\000\178\255\
\000\000\000\000\254\254\092\255\195\255\021\255\021\255\021\255\
\121\255\021\255\021\255\000\000\021\255\021\255\021\255\021\255\
\021\255\021\255\021\255\021\255\021\255\021\255\000\000\000\000\
\000\000\056\000\095\000\154\255\071\000\021\255\095\000\160\255\
\166\255\095\000\149\255\149\255\000\000\000\000\106\000\106\000\
\173\255\173\255\173\255\173\255\126\255\021\255\126\255\095\000\
\000\000\021\255\164\255\188\255\000\000\095\000\126\255\021\255\
\000\000\196\255\126\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\200\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\198\255\000\000\198\255\198\255\000\000\000\000\
\203\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\135\255\135\255\135\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\161\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\213\255\000\000\
\000\000\214\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\255\000\000\000\000\000\000\062\255\000\000\
\218\255\039\255\212\255\229\255\000\000\000\000\130\255\088\000\
\246\255\007\000\024\000\041\000\000\000\213\255\000\000\047\255\
\000\000\000\000\101\255\000\000\000\000\106\255\000\000\088\255\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\213\000\000\000\152\000\171\000\069\000\000\000\227\255\
\219\255\201\255\000\000\000\000"

let yytablesize = 379
let yytable = "\051\000\
\071\000\024\000\053\000\024\000\061\000\062\000\063\000\064\000\
\001\000\065\000\066\000\067\000\068\000\069\000\070\000\009\000\
\074\000\075\000\077\000\010\000\079\000\082\000\037\000\083\000\
\084\000\085\000\086\000\087\000\088\000\089\000\090\000\091\000\
\092\000\058\000\037\000\011\000\038\000\039\000\100\000\037\000\
\096\000\037\000\059\000\044\000\037\000\045\000\046\000\038\000\
\106\000\038\000\040\000\041\000\038\000\042\000\043\000\044\000\
\075\000\045\000\046\000\037\000\102\000\038\000\049\000\099\000\
\043\000\101\000\075\000\043\000\037\000\014\000\038\000\050\000\
\020\000\105\000\015\000\040\000\041\000\108\000\042\000\043\000\
\044\000\021\000\045\000\046\000\040\000\041\000\022\000\042\000\
\043\000\044\000\023\000\045\000\046\000\037\000\024\000\038\000\
\072\000\034\000\035\000\025\000\004\000\005\000\019\000\006\000\
\019\000\019\000\052\000\026\000\044\000\040\000\041\000\044\000\
\042\000\043\000\044\000\027\000\045\000\046\000\019\000\019\000\
\031\000\019\000\019\000\019\000\036\000\019\000\019\000\037\000\
\012\000\038\000\031\000\078\000\031\000\012\000\013\000\031\000\
\014\000\054\000\014\000\014\000\055\000\031\000\031\000\040\000\
\041\000\056\000\042\000\043\000\044\000\057\000\045\000\046\000\
\014\000\014\000\094\000\014\000\014\000\063\000\064\000\014\000\
\014\000\026\000\097\000\026\000\018\000\019\000\026\000\026\000\
\026\000\026\000\026\000\098\000\026\000\026\000\026\000\026\000\
\026\000\026\000\060\000\061\000\062\000\063\000\064\000\103\000\
\061\000\062\000\063\000\064\000\104\000\065\000\066\000\067\000\
\068\000\069\000\070\000\073\000\029\000\030\000\107\000\045\000\
\007\000\061\000\062\000\063\000\064\000\008\000\065\000\066\000\
\067\000\068\000\069\000\070\000\027\000\023\000\027\000\007\000\
\041\000\027\000\027\000\027\000\042\000\000\000\000\000\027\000\
\027\000\027\000\027\000\027\000\027\000\028\000\000\000\028\000\
\000\000\000\000\028\000\028\000\028\000\000\000\000\000\000\000\
\028\000\028\000\028\000\028\000\028\000\028\000\033\000\000\000\
\033\000\000\000\000\000\033\000\000\000\000\000\000\000\000\000\
\000\000\033\000\033\000\033\000\033\000\033\000\033\000\034\000\
\000\000\034\000\000\000\000\000\034\000\000\000\000\000\000\000\
\000\000\000\000\034\000\034\000\034\000\034\000\034\000\034\000\
\035\000\000\000\035\000\000\000\000\000\035\000\000\000\000\000\
\000\000\000\000\000\000\035\000\035\000\035\000\035\000\035\000\
\035\000\036\000\000\000\036\000\000\000\000\000\036\000\000\000\
\000\000\000\000\000\000\000\000\036\000\036\000\036\000\036\000\
\036\000\036\000\093\000\000\000\000\000\000\000\061\000\062\000\
\063\000\064\000\000\000\065\000\066\000\067\000\068\000\069\000\
\070\000\095\000\000\000\000\000\000\000\061\000\062\000\063\000\
\064\000\000\000\065\000\066\000\067\000\068\000\069\000\070\000\
\032\000\000\000\032\000\000\000\000\000\032\000\000\000\000\000\
\000\000\000\000\000\000\032\000\032\000\061\000\062\000\063\000\
\064\000\000\000\065\000\066\000\067\000\068\000\069\000\070\000\
\061\000\062\000\063\000\064\000\000\000\000\000\000\000\067\000\
\068\000\069\000\070\000"

let yycheck = "\037\000\
\003\001\001\001\040\000\003\001\007\001\008\001\009\001\010\001\
\001\000\012\001\013\001\014\001\015\001\016\001\017\001\026\001\
\054\000\055\000\056\000\026\001\058\000\059\000\002\001\061\000\
\062\000\063\000\064\000\065\000\066\000\067\000\068\000\069\000\
\070\000\002\001\002\001\002\001\004\001\005\001\094\000\001\001\
\078\000\003\001\011\001\023\001\006\001\025\001\026\001\001\001\
\104\000\003\001\018\001\019\001\006\001\021\001\022\001\023\001\
\094\000\025\001\026\001\002\001\098\000\004\001\005\001\093\000\
\003\001\095\000\104\000\006\001\002\001\002\001\004\001\005\001\
\003\001\103\000\026\001\018\001\019\001\107\000\021\001\022\001\
\023\001\006\001\025\001\026\001\018\001\019\001\003\001\021\001\
\022\001\023\001\003\001\025\001\026\001\002\001\004\001\004\001\
\005\001\029\000\030\000\026\001\023\001\024\001\002\001\026\001\
\004\001\005\001\038\000\004\001\003\001\018\001\019\001\006\001\
\021\001\022\001\023\001\004\001\025\001\026\001\018\001\019\001\
\023\001\021\001\022\001\023\001\026\001\025\001\026\001\002\001\
\001\001\004\001\001\001\011\001\003\001\001\001\002\001\006\001\
\002\001\002\001\004\001\005\001\002\001\012\001\013\001\018\001\
\019\001\002\001\021\001\022\001\023\001\026\001\025\001\026\001\
\018\001\019\001\001\001\021\001\022\001\009\001\010\001\025\001\
\026\001\001\001\003\001\003\001\013\000\014\000\006\001\007\001\
\008\001\009\001\010\001\006\001\012\001\013\001\014\001\015\001\
\016\001\017\001\001\001\007\001\008\001\009\001\010\001\020\001\
\007\001\008\001\009\001\010\001\001\001\012\001\013\001\014\001\
\015\001\016\001\017\001\001\001\026\000\027\000\003\001\000\000\
\003\001\007\001\008\001\009\001\010\001\003\001\012\001\013\001\
\014\001\015\001\016\001\017\001\001\001\001\001\003\001\003\000\
\003\001\006\001\007\001\008\001\003\001\255\255\255\255\012\001\
\013\001\014\001\015\001\016\001\017\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\255\255\255\255\
\255\255\012\001\013\001\014\001\015\001\016\001\017\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\255\255\
\255\255\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\001\001\255\255\003\001\255\255\255\255\006\001\255\255\255\255\
\255\255\255\255\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\001\001\255\255\003\001\255\255\255\255\006\001\255\255\
\255\255\255\255\255\255\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\003\001\255\255\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\003\001\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\001\001\255\255\003\001\255\255\255\255\006\001\255\255\255\255\
\255\255\255\255\255\255\012\001\013\001\007\001\008\001\009\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\007\001\008\001\009\001\010\001\255\255\255\255\255\255\014\001\
\015\001\016\001\017\001"

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
# 280 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 26 "parser.mly"
                 ( (_2 :: fst _1), snd _1 )
# 288 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 27 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 296 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 31 "parser.mly"
     ( { 
	 ftype = Dummy;
	 fname = _1;
	 formals = _3;
	 locals = List.rev _6;
	 body = List.rev _7 } )
# 311 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 39 "parser.mly"
 ( { 
	    ftype = Void;
	    fname = _2;
	    formals = _4;
	    locals = List.rev _7;
	    body = List.rev _8 } )
# 326 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 47 "parser.mly"
 ( { 
	    ftype = Int;
	    fname = _2;
	    formals = _4;
	    locals = List.rev _7;
	    body = List.rev _8 } )
# 341 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                  ( [] )
# 347 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 56 "parser.mly"
                  ( List.rev _1 )
# 354 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 59 "parser.mly"
                         ( [_1] )
# 361 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 60 "parser.mly"
                         ( _3 :: _1 )
# 369 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
                     ( [] )
# 375 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 64 "parser.mly"
                     ( _2 :: _1 )
# 383 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 67 "parser.mly"
               ( _2 )
# 390 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
                   ( [] )
# 396 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                   ( _2 :: _1 )
# 404 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
              ( Expr(_1) )
# 411 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Return(_2) )
# 418 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 76 "parser.mly"
                            ( Block(List.rev _2) )
# 425 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 77 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 433 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 78 "parser.mly"
                                            ( If(_3, _5, _7) )
# 442 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 80 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 452 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "parser.mly"
                                  ( While(_3, _5) )
# 460 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "parser.mly"
                  ( Noexpr )
# 466 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                  ( _1 )
# 473 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 88 "parser.mly"
                     ( Literal(_1) )
# 480 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "parser.mly"
                     ( Id(_1) )
# 487 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 495 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 503 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 511 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 519 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 527 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 535 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 543 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 551 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 559 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 567 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                     ( Assign(_1, _3) )
# 575 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                       ( Assign(_2, _4) )
# 583 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 102 "parser.mly"
                                 ( Call(_1, _3) )
# 591 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                       ( _2 )
# 598 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parser.mly"
                  ( [] )
# 604 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 107 "parser.mly"
                  ( List.rev _1 )
# 611 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "parser.mly"
                            ( [_1] )
# 618 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                            ( _3 :: _1 )
# 626 "parser.ml"
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
