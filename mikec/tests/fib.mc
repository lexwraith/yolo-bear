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
      printf(" %d ",g);
   }
   if(fibs[i] == t){
      return 1;}
   return 0;
}
int main()
{
   decideFib(1000);
   return 0;
}
