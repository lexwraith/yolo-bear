/* function calls. Should Work */

int sumArr(int array[], int len)
{
    int i;
    int sum;
    i = 0;
    sum = 0;

    while (i < len){
        sum = sum + array[i];
        i = i + 1;
    }
	
    test(sum);
}

int test(int a)
{
int c = a+5;
return c;
}

int main()
{
    int arr[2];

    arr[0] = 4;
    arr[1] = 5;

   sumArr(arr, 2);
}