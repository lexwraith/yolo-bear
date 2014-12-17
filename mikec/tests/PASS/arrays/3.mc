int main(){
    int g[];
    int temp;
    g[0] = 15;
    g[1] = 30;
    temp = g[0];
    int print = g[1];
    printf("%d\n\n\n%d",print,print);
    g[0] = g[1];
    g[1] = temp;
    return 0;
}
