#C Without Pointers...And References?#

##TODO:##
Mike -

####GRAMMAR####
* Fix "return"; -doesn't work
* Fix control structures;


Eli -
* Continue developing idea on dynamic arrays/garbage collection/memory management

Yuchen -
* Printlist

Prateek -
* 100 test cases, with a comment at the top, when run with test script, explains which tests passed and which tests failed, with the description of test

###12/12/14###
Mike -
* Huge consolidation of Yuchen's work
* Fixed all tests cases that use single line comments
* Added more static array test cases
* UNTESTED - Array value assignment in
Eli -
* Added set of test cases for dynamic arrays

###12/11/14###
Eli -
* Split up all test cases into incremental

Yuchen -
* Worked miracles in semantic analyzer

###12/10/14###
Mike -
* Redid tester = fully operational pending further features
* I fucking hate recursive data types - can't figure out how to do array
* Printf now works with (str,args);

###12/9/14###
Eli -
* Added more tests cases to account for arrays
* Progress on dynamic arrays and automatic garbage collection

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
