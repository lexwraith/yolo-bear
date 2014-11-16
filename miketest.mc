int[] genfibo(int[] arr, int n){
    arr[0] = 0;
    arr[1] = 1;
    arr[2] = 1;
    for(int x = 3: x < n; x++){
        arr[x] = arr[x-1] + arr[x-2];
    }
    return arr;
}

int fibo(int n):
    int[n] arr;
    arr = genfibo(arr,n)
    return arr[n-1];

int main(){
    fibo(5);
}
