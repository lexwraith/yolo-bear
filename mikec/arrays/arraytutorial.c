#include "array.h"
#include <stdio.h>

//Array tutorial

int main() {

  //initialize arrays
  Array *x = initArray(x);
  Array *y = initArray(y); 
  Array *z = initArray(z);
  Array *inception = initArray(inception);

  //inserting an integer
  //insertInt(Array *a, int offset, int element)
  insertInt(x, 0, 10);
  //print x.array[0].i means the element in x's array at offset 0, of type .i (int) 
  printf("x[0] holding an int: %d\n", x->array[0].i);

  //inserting a char
  //insertChar(Array *a, int offset, char element)
  insertChar(x, 1, 'c');
  //print x.array[1].i means the element in x's array at offset 1, of type .c (char) 
  printf("x[1] holding a char: %c\n", x->array[1].c);

  //inserting a float
  //insertChar(Array *a, int offset, float element)
  insertFloat(x, 2, 3.145);
  //print x.array[2].i means the element in x's array at offset 2, of type .f (float) 
  printf("x[2] holding a float: %f\n", x->array[2].f);

  //inserting an array. This marks the first array as an array of arrays 
  //insertArray(Array *a, int offset, Array *element)
  insertArray(y, 3, z);

  //now we can add an array to what is effectively y[3][1], adding another dimension
  //the .a suffix indicates that y.array[3] holds an array, and we pass that as Array a*
  //If we want to add a third dimension, the syntax is the same. However, if a dimension holds
  //an array, it can ONLY hold arrays. Otherwise the freeArray method will leak memory. 
  //Semantics check should ensure this. 
  //insert array inception into the array in y[3], offset = 1, so x[3][1] = inception
  insertArray(y->array[3].a, 1, inception);

  //now we can add an int to what is effectively y[3][1][0]
  //add int 310 to y[3][1][0]
  insertInt(y->array[3].a->array[1].a, 0, 310);
  //print y[3][0][0]
  printf("y[3][1][0] holding an int: %d\n",y->array[3].a->array[1].a->array[0].i);

  printf("The size of x is %d\n", maxArrayElement(x));
  printf("The size of y is %d\n", maxArrayElement(y));
  printf("The size of z is %d\n", maxArrayElement(z));
  printf("The size of inception is %d\n", maxArrayElement(inception));
  
 
  //as long as precautions I outlined above are followed, calling this on the
  //bottom level array will recursively free all levels of a multidimensional array
  freeArray(x);
  freeArray(y);

  return 0;
}
