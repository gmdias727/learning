#include <stdio.h>
#include <stdlib.h>

void count_numbers(int number) {
    while (number <= 10) {
        printf("%d ", number);
        number++;
    }
    printf("\n");
}

void count_indefinitely(int count) {
    int true = 1;
    while (true) {
        printf("%d ", count);
        count++;
    }
    true = 2;
    exit(0);
}

int main() {
    count_indefinitely(0);
    return 0;
}