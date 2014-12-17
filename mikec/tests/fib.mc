int decideFib(int t)
{
   int fibs[];
   fibs[0] = 1;
   fibs[1] = 1;
   int i = 1;
   while(fibs[i] < t){
      i = i + 1;
      fibs[i] = fibs[i - 2] + fibs[i - 1];
      int g = fibs[i];
      printf(" %d \n",g);
   }
   if(fibs[i] == t){
      return 1;}
   return 0;
}
int main()
{
   int n = 1245235;
   int y = decideFib(n);
   if(y){
        printf("%d is a fibonacci number.\n",n);
   }
    else{
    printf("%d is not a fibonacci number.\n",n);
  }
   return 0;
}
