#include "array.h"

int main() {

  Array a;
  initArray(&a);
  Array *ptra = &a;
  int x;  
  for(x=0; x<10; x++){
    insertInt(ptra, x, x);
  }

  Array *doubleArray(Array *funcArray){
    for(x=0; x < a.size; x++){
      insertInt(funcArray, x, 2*(funcArray->array[x].i));
    }
  return funcArray;
  }
  
 /* Array b; 
  initArray(&b); 
*/  Array *ptrb = NULL;

  ptrb = doubleArray(ptra);
  
  Stack *head = NULL;
  initStack(head);

  head = pushStack(head, ptra);
  head = pushStack(head, ptrb);
  printf("%d\n", head->data->array[0].i);
  Array *temp = NULL;
//  head = popStack(head, &temp);
  freeStack(head);
//  printf("%d\n", temp->array[1].i);
  
 
  for(x=0; x<10; x++){
    printf("a: %d\n", ptra->array[x].i);
    printf("b: %d\n", ptrb->array[x].i);
  }
  
  freeArray(ptra);
 
}
