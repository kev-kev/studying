#include <stdio.h>

int main(void) {
  int x;
  int y;
  printf("Width:\n");
  scanf("%d", &x);
  printf("Height:\n");
  scanf("%d", &y);
  for (int i = 0; i < y; i ++) {
    for (int j = 0; j < x; j ++) {
      printf("#");
    }
    printf("\n");
  }
}