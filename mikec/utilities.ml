let str = function
 e:string -> e
| (a:string, b:string) -> e ^ " " e
| e:int -> string_of_int e
| (a:int, b:int) -> string_of_int a ^ " " ^ string_of_int b 
