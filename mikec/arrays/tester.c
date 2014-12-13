#include "array.h"
#include <stdio.h>

int main() {
  Array x, y, z;
  Data temp;
 // int x;

  initArray(&x);
  initArray(&y); 
  initArray(&z);
  x.datatype = 0;
  y.datatype = 0;
  z.datatype = 1;

  temp.a = &y;
  insert(&x, 0, temp);

  temp.a = &z;
  insert(x.array[0].a, 0, temp);

  temp.i = 1;
  insert(x.array[0].a->array[0].a, 0, temp);
  printf("%d\n",x.array[0].a->array[0].a->array[0].i);
  temp.i = 2;
  insert(x.array[0].a->array[0].a, 1, temp);
  printf("%d\n",x.array[0].a->array[0].a->array[1].i);

//  x.array[1].a = &z;
//  printf("%d\n", x.array[0].i);
/*   
  for (x = 0; x < 20; x++){
    temp.i = x;
    insert(foo.array[0].a, x, temp); 
  }   
  temp.c = 'a'; 
  insert(foo.array[0].a, 25, temp); 
  printf("%d\n", a.array[9].i);  
  printf("%c\n", a.array[25].c);
  printf("%c\n", a.array[23].i);
  printf("%d\n", a.used);   
*/  
  freeArray(&x);

  return 0;
}
