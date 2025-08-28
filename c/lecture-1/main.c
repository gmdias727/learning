#include <stdio.h>

const char* sayName(const char* name) {
  return name;
};

int sum(int a, int b) {
  return a + b;
}

typedef struct {
  int value;
  int error;
} Result;

Result calc(char op, int x, int y) {
  Result r = {0 , 0};

  switch (op) {
  case '+':
    r.value = x + y;
    break;
  case '-':
    r.value = x - y;
    break;
  case '*':
    r.value = x * y;
    break;
  case '/':
    if (y == 0 || x == 0) r.error = 1;
    r.value = x / y;
    break;
  default:
    r.error = 1;
  }

  return r;
}

int main() {
  printf("%s\n", sayName("Gabriel"));
  printf("%d\n", sum(900, 1000));
  printf("%d\n", calc('*', 20, 50));
  printf("%d\n", calc('+', 20, 50));
  printf("%d\n", calc('-', 20, 50));
  printf("%d\n", calc('/', 0, 3));

  return 0;
};
