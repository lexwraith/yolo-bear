#include <stdio.h>

#include "array.h"


int main(){
	printf("Program starts\n");

	Array *x = initArray(x);
	printf("Address of x: %p\n", x);
	printf("Address of x->array: %p\n", x->array);

	if (!(x->array[3].a)) {
		Array *x_1 = initArray(x_1);
		printf("Address of x_1: %p\n", x_1);		
		printf("Address of x_1->array: %p\n", x_1->array);
		printf("Inserting x_1 into x\n");
		insertArray(x,3,x_1);
	}

	if (!(x->array[3].a->array[2].a)) {
		Array *x_2 = initArray(x_2);
		printf("Address of x_2: %p\n", x_2);
		printf("Address of x_2->array: %p\n", x_2->array);
		printf("Insertint x_2 into x_1\n");
		insertArray((x->array[3].a),2,x_2);
	}
//	insertInt(x->array[3].a->array[0].a, 8, 5);
//        printf("x[3][1]: %d\n", x->array[3].a->array[1].i);

	if (/*!(x->array[3].a->array[2].a->array[1].a)*/ 1) {
		Array *x_3 = initArray(x_3);
		printf("Address of x_3: %p\n", x_3);
		printf("Address of x_3->array: %p\n", x_3->array);
		printf("Inserting x_3 into x_2\n");
		insertArray((x->array[3].a->array[2].a),1,x_3);
	}

	insertInt(x->array[3].a->array[2].a->array[1].a,5,42);


	printf("%d\n", x->array[3].a->array[2].a->array[1].a->array[5].i);

        freeArray(x);
 return 0;
}

