#C Without Pointers...And References?#

###12/16/14###
Team -
* Finished up last minute tests
* Wrote report
*Nomenclature/renamed some stuff

###12/15/14###
Mike -
* Fixed float parsing
* Test suite now fully gcc's
* Added in continue/break
* Varchaining fully implemented
* Fixed some code generation (For/Call/If/While)

###12/14/14###
Mike - 
* Strings are in e.g. char x[] = "test"; -- see SAssign in ast.ml
* String declarations in char x[] = now string * string * string list
* For loop's last argument is now stmt list as opposed to stmt
* If's last argument is now stmt list as opposed to stmt
* Escape characters are in treated as chars of max size 2.
* Variable declaration chaining in e.g. int x,y; - see VDecllist in ast.ml
* INCR/DECR added under expressions - Will add a type under EXPR for it later

Yuchn -
* Dynamic Arrays are in
* Add string in sast, semantic and ccompilesast
* Fixed a few test cases

###12/13/14###
Mike/Yuchen -
* Arrays now have their own ID type
* Arrays can be used to describe formal arguments
* Changed all iliterals into expressions that hopefully get resolved
* Added in GCC to test suite

Yuchen/Eli
* Code Generation of Static/Dynamic Arrays

Eli -
* Added in more testing of the dynamic array header file

###12/12/14###
Mike -
* Consolidated pipeline
* Fixed all tests cases that use single line comments
* Added more static array test cases
* Added more features to test suite
* Static arrays fully functional
* Dynamic array declarations in

Eli -
* Added set of test cases for dynamic arrays
* Single dynamic array C header up
* Prototype for C automatic garbage collction up

Yuchen -
* Consolidated pipeline
* Add 'Printlist' in sast
* Add semantic checking for static array declaration
* Worked more miracles

Prateek -
* Doubled test cases to ~100
* Reorganized all test cases into PASS/-feature and FAIL/-feature folders to test individual features
###12/11/14###
Eli -
* Split up all test cases into incremental

Yuchen -
* Worked miracles in semantic analyzer
* Add 'Array' and 'Print' in sast
* Make the compile using sast work

###12/10/14###
Mike -
* Redid tester = fully operational pending further features
* I fucking hate recursive data types - can't figure out how to do array
* Printf now works with (str,args);

Yuchen
* Add return type checking
* Write the function convert program in ast to program in sast and merge sast into the pipeline

###12/9/14###
Eli -
* Added more tests cases to account for arrays
* Progress on dynamic arrays and automatic garbage collection

Yuchen -
* Most problems about scope are solved and tested (Scope for 'While' and 'For', scope for global environment, scope for multi functions, scope for formals)
* Add test cases for scope and multi functions

###12/8/14###
Yuchen -
* Problem with 'call' is solved and tested. Function's name and type, arguments' number and types are checked.
* Add semantic checking and ast-sast converting for 'Call', 'Return'


###12/6/14###
Mike -
* Nested Arrays are in

Eli -
* Strategy for implementing pointerless C done

Yuchen - 
* Worked towards putting SAST between AST -> CCompile

Prateek - 
* Rewrote python test script

###12/6/14###
Yuchen - 
* Add semantic checking and ast-sast converting for 'While', 'For', 'VDecl' 
  UNTESTED - semantic checking and ast-sast converting for 'While', 'For'
* Add semantic checking: if there is id confict when initialing new vairable in both 'VDecl' and 'NAssign'

###12/5/14###
Yuchen -
* Added Types.ml, Sast.ml
* UNTESTED - Began work on Semantic; implemented: utility functions for AST traversal, scoping environments, equality tests, type checking, type requirements, environmeny var/func checks

###12/4/14###
Mike -
* IN PROGRESS - Added in array optionals that come after ID Token
* Adjusted TYPE ID ASSIGN expr to statements. CONSIDER MOVING BACK TO EXPR FOR CHAINED.
* Global declarations are now ALWAYS TYPE ID ASSIGN LITERAL.
* Arithmetic operations working as expected
* UNTESTED - float literals - currently viewed as strings
* UNTESTED/OPTIONAL - Added break,const,continue,extern,float,static 
* UNTESTED - Added increment/decrement, NOT ADDED TO GRAMMAR YET
* More test cases

Eli -
* Created more in-depth test cases 

Prateek -
* Added python test script

###12/3/14###
Mike -
* Var Declaration can occur anywhere, e.g. int x; now works like c99 standard
* All grammar rules accounted for with two conflicts
* Formal arguments take type now
* Print accounted for
* Added three print test cases in tests/ps/
* Global variable INITIALIZATION in (seems useless)
* UNTESTED - Strings added to lexer/parser/compiler
* UNTESTED - Chars added, same as strings

###12/2/14###
Mike - 	
* Code generation up and running!
* Basic formatting to do basic C code up.
* UNTESTED - Added print statement to scanner and grammar
* UNTESTED - Differentiated new variable declaration AND assignment
* Removed all old code e.g. bytecode/compile (now ccompile), etc.
* Removed all old test cases and modified Makefile for new environment


###12/1/14###
Mike -  
* Started over from scratch
* Added in type declarations for functions
* Added in variable declaration and assignment of expression
* Added ccompile/ccode.ml to be used for actual compilation
* Microc now has a -C flag that is used for actual ccompile.translate
* Codegeneration has begun - need to adjust formatting and account for type_decl string formatting
* Mikhail helped
