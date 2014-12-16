#include <stdio.h>

#include "array.h"


int main(){
	printf("Program starts\n");

	Array x_o;
	printf("Address of x_o: %p\n", &x_o);
	printf("Initializing first array\n");
	initArray(&x_o);
	printf("Address of x_o after init: %p\n", &x_o);
	Array *x = &x_o;
	printf("Address of x: %p\n", x);

	if (!(x->array[3].a)) {
		Array temp1;
		printf("Address of temp1 before init: %p\n", &temp1);
		printf("Initializing temp1\n");
		initArray(&temp1);
		printf("Address of temp1 after init: %p\n", &temp1);
		Array *x_1 = &temp1;
		printf("Address of x_1: %p\n", x_1);
		printf("Inserting temp1 array\n");
		insertArray(x,3,x_1);
	}
	if (!(x->array[3].a->array[2].a)) {
		Array temp2;
		printf("Address of temp2 before init: %p\n", &temp2);
		printf("Initializing temp2 array\n");
		initArray(&temp2);
		printf("Address of temp2 after init: %p\n", &temp2);
		Array *x_2 = &temp2;
		printf("Address of x_2: %p\n", x_2);
		printf("Insert temp2 array\n");
		insertArray((x->array[3].a),2,x_2);
	}
//	insertInt(x->array[3].a->array[0].a, 8, 5);
//        printf("x[3][1]: %d\n", x->array[3].a->array[1].i);

	if (/*!(x->array[3].a->array[2].a->array[1].a)*/ 1) {
		Array temp3;
		printf("Address of temp3 before init: %p\n", &temp3);
		printf("Initializing temp3 array\n");
		initArray(&temp3);
		printf("Address of temp3 after init: %p\n", &temp3);
		Array *x_3 = &temp3;
		printf("Address of x_2: %p\n", x_3);
		printf("Insert temp2 array\n");
//		printf("Size of temp 3: %d\n", x_3->size);
		printf("Inserting temp3 array after init\n");	
		insertArray((x->array[3].a->array[2].a),0,x_3);
	}
//	insertInt(x->array[3].a->array[2].a->array[1].a,5,42);

//	printf("%d\n", x->array[3].a->array[2].a->array[1].a->array[5].i);

//        freeArray(x);
 return 0;
}

