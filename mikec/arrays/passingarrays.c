#include "array.h"

int main() {

  Array a;
  initArray(&a);
  int x;  
  for(x=0; x<10; x++){
    //printf("Test");
    insertInt(&a, x, x);
  //  printf("%d\n", a.array[x].i);
  }

  Array doubleArray(Array funcArray){
    for(x=0; x < a.size; x++){
      insertInt(&a, x, a.array[x].i);
    }
  return funcArray;
  }
  
  Array b;  
  b = doubleArray(a);
 
  for(x=0; x<10; x++){
    printf("a: %d\n", a.array[x].i);
    printf("b: %d\n", b.array[x].i);
  }
  
}
