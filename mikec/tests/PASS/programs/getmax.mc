int foo(int g){
    g = g * 2 + 4;
    return g;    
}
int main(int g){
    printf("Hello world!");
    int x;
    x = 15;
    int y = foo(x);
    printf("%d",y);
}
