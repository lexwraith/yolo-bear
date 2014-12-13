#ifndef ARRAY_HEADER
#define ARRAY_HEADER

#include <stdlib.h>
#define initSize 10



typedef union {
  int i;
  char c;
} Data;  

typedef struct {
  Data *array;
  size_t used;
  size_t size; 
} Array;

void initArray(Array *a) {
  a->array = (Data *)malloc(initSize * sizeof(Data));
  a->used = 0;
  a->size = initSize;
}

void insert(Array *a, int offset, Data element) {
  if (a->size <= offset ) {
    a->size *= 2;
    a->array = (Data *)realloc(a->array, a->size * sizeof(Data));
    a->used = offset;
    a->array[offset] = element;
  }
  else {
    if ( offset > a->used ) {
      a->used = offset;
    }
    a->array[offset] = element;
  }
}

void insertArray(Array *a, Data element) {
  if (a->used == a->size) {
    a->size *= 2;
    a->array = (Data *)realloc(a->array, a->size * sizeof(Data));
  }
  a->array[a->used++] = element;
}

void freeArray(Array *a) {
  free(a->array);
  a->array = NULL;
  a->used = a->size = 0;
}

#endif
