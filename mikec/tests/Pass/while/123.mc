/* test while*/
int fun(int a ,int b)
{
	return a + b;
}

int main()
{
	int a;
	int b;
	a = 5;
	b = 0;
	while( a != 0) {
		b = fun(a,b);
		a = a - 1;
	}
	return b;
}