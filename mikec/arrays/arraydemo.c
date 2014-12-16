/* This is a demo of dynamic array capabilities */

int main() {

  void automaticGrowth(){    
    int a[];
    int i, x;
    for(i = 0; i<20; i++) {
      a[i] = i;
      printf("%d, ");
    }

  void multiDimensional(){
    int a[][];
    int i, j;
    x = 0;
    for(i = 0; i<5; i++) {
      for(j = 0; j<5; j++) {
        a[i][j] = x;
        x++;
        printf("[%d][%d]: %d;", i, j, x);
      }
    }
  }
}

