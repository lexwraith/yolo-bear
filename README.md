#C Without Pointers...And References?#

##TODO:##
* PENDING VJ - Array TOKENS, due to situations like i[][].
* TYPE ID+ (for declaration chaining)
* Chained variable declarations
* {} symbols for array declaration - Use nesting strategy
* PENDING ELI - sizeof/malloc - Treat as builtin function

Prateek -
* Implement argparse with flags to target directors at command line e.g. test /test/optional
* More test cases
* Conslidate test cases
* 25 test cases, with a comment at the top, when run with test script, explains which tests passed and which tests failed, with the description of test

Eli -
* Write a full implementation plan of an idea of how we're going to go pointerless

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
