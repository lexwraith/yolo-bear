/* Test for array and "while" keyword. Should Work*/
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
	
    return sum;
}

int main()
{
    int arr[2];

    arr[0] = 4;
    arr[1] = 5;

   sumArr(arr, 2);
}