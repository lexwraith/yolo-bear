#ifndef ARRAY_HEADER
#define ARRAY_HEADER

#include <stdlib.h>
#include <stdio.h>
#define initSize 10

////////////////////////////////////////////
// Dynamic array and associated functions //
////////////////////////////////////////////

//Array structure itself. Holds the elements of the array in a
//union defined as any type the array can hold. This includes
//pointers to the array struct to allow for multidimensional arrays.
//Also holds size and max element used
//If array holds another array, flag datatype must be set = 1.
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

//Usage syntax:
// Array *x = initArray(x);
Array *initArray(Array *ar) {
  ar = (Array *)malloc(sizeof(Array));
  ar->array = NULL;
  ar->array = (Data *)malloc(initSize * sizeof(Data));
  if(!(ar->array)){
    printf("Initarray malloc failed\n");
  }
  ar->used = 0;
  ar->size = initSize;
  return ar;
}

//insert Data type element. Used by other insert methods to
//handle memory allocation and setting of used and size fields.
void insert(Array *ar, int offset, Data element) {
  while (ar->size <= offset ) {
    ar->size *= 2;
    ar->array = (Data *)realloc(ar->array, ar->size * sizeof(Data));
    if(!(ar->array)){
      printf("Realloc in insert failed\n");
     }
    ar->array[offset] = element;
  }
  if ( offset > ar->used ) {
    ar->used = offset;
  }
  ar->array[offset] = element;
}

void insertInt(Array *ar, int offset, int element){
  Data temp;
  temp.i = element;
  insert(ar, offset, temp);
  ar->datatype = 0;
}

void insertChar(Array *ar, int offset, char element){
  Data temp;
  temp.c = element;
  insert(ar, offset, temp);
  ar->datatype = 0;
}

void insertFloat(Array *ar, int offset, float element){
  Data temp;
  temp.f = element;
  insert(ar, offset, temp);
  ar->datatype = 0;
}

void insertArray(Array *ar, int offset, Array *element){
  Data temp;
  temp.a = element;
  insert(ar, offset, temp);
  ar->datatype = 1;
}

void freeArray(Array *ar) {
  int x;
  if (ar->datatype == 1){
    for(x = 0; x <= ar->used; x++){
      if(ar->array[x].a){
        freeArray(ar->array[x].a);
      }
    }
  }
  free(ar->array);
  free(ar);
}

///////////////////////////////////
//  Stack for garbage collection //
///////////////////////////////////

//Stack is implemented as a linked list, where Stack structs
//are the nodes of the list
typedef struct Stack {
  Array *data;
  struct Stack *next;
} Stack;

//
void initStack(Stack *head){
  head = NULL;
}

//Arguments: Stack *head
Stack *pushStack(Stack *head, Array *ptr){
  Stack *temp = (Stack *)malloc(sizeof(Stack));
  temp->data = ptr;
  temp->next = head;
  head = temp;
  return head;  
}

//Pass in ptr to Stack head and Array* which will hold the
//data you are popping. Function returns new Stack head
Stack* popStack(Stack *head, Array **ptr) {
    Stack* temp = head;
    *ptr = head->data;
    head = head->next;
    free(temp);
    return head;
}

//Checks if the stack is empty
int stackEmpty(Stack *head){
  if(head == NULL)
    return 1;
  else
   return 0;
}

//Frees the whole stack, pass in the head of the stack
void freeStack(Stack *head) {
  Stack *temp = NULL;
  if(head != NULL){
    do{
      temp = head;
      head = head->next;
      free(temp);
    }
    while (head != NULL);
  }
}
 
#endif

