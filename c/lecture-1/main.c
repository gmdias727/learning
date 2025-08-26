#include <stdio.h>

const char* sayName(const char* name) {
  return name;
};

int sum(int a, int b) {
  return a + b;
}

int calc(char op, int x, int y) {
  switch (op)
  {
  case '+':
    return x + y;
    break;
  case '-':
    return x - y;
    break;
  case '*':
    return x * y;
    break;
  case '/':
    return x / y;
    break;
  default:
    printf("error");
    return 0;
    break;
  }
}

int main() {
  printf("%s\n", sayName("Gabriel"));
  printf("%d\n", sum(900, 1000));
  printf("%d\n", calc('*', 20, 50));
  printf("%d\n", calc('+', 20, 50));
  printf("%d\n", calc('-', 20, 50));
  printf("%d\n", calc('/;', 200, 3));

  return 0;
};
