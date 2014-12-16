#include "array.h"
#include <stdio.h>

//Array tutorial

int main() {
  Array x, y, z;

  //initialize arrays
  initArray(&x);
  initArray(&y); 
  initArray(&z);

  //inserting an integer
  //insertInt(Array *a, int offset, int element)
  insertInt(&x, 0, 10);
  //print x.array[0].i means the element in x's array at offset 0, of type .i (int) 
  printf("x[0] holding an int: %d\n", x.array[0].i);

  //inserting a char
  //insertChar(Array *a, int offset, char element)
  insertChar(&x, 1, 'c');
  //print x.array[1].i means the element in x's array at offset 1, of type .c (char) 
  printf("x[1] holding a char: %c\n", x.array[1].c);

  //inserting a float
  //insertChar(Array *a, int offset, float element)
  insertFloat(&x, 2, 3.145);
  //print x.array[2].i means the element in x's array at offset 2, of type .f (float) 
  printf("x[2] holding a float: %f\n", x.array[2].f);

  //inserting an array. This marks the first array as an array of arrays 
  //insertArray(Array *a, int offset, Array *element)
  insertArray(&x, 3, &y);
  //now we can add an int to what is effectively x[3][0]
  //the .a suffix indicates that x.array[3] holds an array, and we pass that as Array a*
  insertInt(x.array[3].a, 0, 30);
  //This is where it gets tricky
  //x.array[3].a == x[3], but then we need to access the array held inside x[3], which is accessed
  //through a pointer, so a->array[0].i means element [0] of the array held in x's array, which is
  //an integer (.i)
  printf("x[3][0] holding an int: %d\n", x.array[3].a->array[0].i);

  //If we want to add a third dimension, the syntax is the same. However, if a dimension holds
  //an array, it can ONLY hold arrays. Otherwise the freeArray method will leak memory. 
  //I am ignoring that for this demo, but semantics check should ensure this. 
  //insert array z into the array in x[3], offset = 1, so x[3][1] = z
  insertArray(x.array[3].a, 1, &z);
  //add int 310 to x[3][1][0]
  insertInt(x.array[3].a->array[1].a, 0, 310);
  //print x[3][0][0]
  printf("x[3][1][0] holding an int: %d\n",x.array[3].a->array[1].a->array[0].i);
  
  //as long as precautions I outlined above are followed, calling this on the
  //bottom level array will recursively free all levels of a multidimensional array
  freeArray(&x);

  return 0;
}
