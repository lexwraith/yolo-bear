//test char ASCII arithmatic
int main(){

    char a;
    a = 97;	//ASCII val of 'a'
    a = c-32;	//should be 'A' now (ASCII 65)
    
    char b;
    b = 'b';
    b = b - 32;	//should be 'B' (ASCII 66)

    printf("A: %c, B: %c\n", a, b);

    return 0;
}
