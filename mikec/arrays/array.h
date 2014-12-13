#ifndef ARRAY_HEADER
#define ARRAY_HEADER

#include <stdlib.h>
#include <stdio.h>
#define initSize 10

/*typedef union Data {
    int i;
    char c;
    float f;
} Data; 
*/

typedef struct Array {
 int datatype;
 union Data {
    int i;
    char c;
    float f;
    struct Array *a;
  } Data;
  union Data *array;
  size_t used;
  size_t size; 
} Array;

typedef union Data Data;

void initArray(Array *a) {
  a->array = (Data *)malloc(initSize * sizeof(Data));
  a->used = 0;
  a->size = initSize;
}

//insert Data type element
void insert(Array *a, int offset, Data element) {
  while (a->size <= offset ) {
    a->size *= 2;
    a->array = (Data *)realloc(a->array, a->size * sizeof(Data));
    a->array[offset] = element;
  }

  if ( offset > a->used ) {
    a->used = offset;
  }
  a->array[offset] = element;
}

void freeArray(Array *ar) {
  int x;
  if (ar->datatype == 0){
    for(x = 0; x <= ar->used; x++){
      printf("%d\n", x);
      freeArray(ar->array[x].a);
    }
  }
  free(ar->array);
  ar->array = NULL;
  ar->used = ar->size = 0;
}

#endif
