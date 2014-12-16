int main(){
    int g[] = {9,8,7,6,5,4,3,2,1};
    int z;
    for(z = 0; z < 5; z = z + 1){
        g[z] = z;
    }
    for(z = 0; z < 8; z = z + 10){
        int y = g[z];
        printf("%d",y);
    }
}
