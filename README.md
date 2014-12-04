###TODO 12/4/14###
Eli -
* Confirm that only variable declaration is allowed in file scope
* Create 25 test cases for core C to fully flesh out language
* Create 10 test cases with broken semantics
* Create another 10 in a separate folder that enables references without pointers 


Prateek -
* Remake testall.sh into a one-line run that microc -C all our test cases, gcc's it to an appropriate outfile, and runs the outfile, and compares it against the test case expected output

###12/3/14###
Mike -
* Var Declaration can occur anywhere, e.g. int x; now works like c99 standard
* All grammar rules accounted for with two conflicts
* Print accounted for
* Added three print test cases in tests/ps/
* Global variable INITIALIZATION in (seems useless)
* UNTESTED - Strings added to lexer/parser/compiler
* UNTESTED - Chars added, same as strings

###12/2/14###
Mike - 	
* Code generation up and running!
* Basic formatting to do basic C code up.
* UNTESTED - Added print statement to scanner and grammar (same as return)
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
