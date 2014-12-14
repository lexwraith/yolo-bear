/* multiple if else */
int main()
{
	int a;
	int b;
    int c;
	a = 7;
	b = 10;
    c = 15;

    if (b  > c) {
	    a = a + 1;
	} else {
		a = a + 2;
	}

    if ( b < c) {
	    a = a + 3;
	} else {
		a = a + 4;
	}

    if ( c == b) {
	    a = a + 5;
	} else {
		a = a + 6;
	}

    return a;

}