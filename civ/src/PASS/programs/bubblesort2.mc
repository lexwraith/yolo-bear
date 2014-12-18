void bubblesort(int t[]){
    int i,j;
    int n;
    n = maxArrayElement(t) + 1;
    for(i = 1; i < n; i = i + 1){
        for(j = 0; j < n - i - 1; j = j + 1){
            if(t[j] > t[j + 1]){
                int a = t[j];
                int b = t[j + 1];
                int temp = t[j];
                t[j] = t[j + 1];
                t[j + 1] = temp;
                printf("\nSWAPPING: %d %d",a,b);
            }   
        }    
    }
return;
}

void main(){
    printf("Bubblesort");
    int g[];
    int z;
    for(z = 10; z > 0; z = z - 1){
    g[10 - z] = z;
    }
    for(z = 0; z < 10; z = z + 1){ 
    int temp = g[z];
    printf("%d ", temp);
    }
    bubblesort(g);
    printf("Sorted! \n");
    for(z = 0; z < 10; z = z + 1){
        int temp = g[z];
        printf("%d ", temp);
    }
    return;
}

