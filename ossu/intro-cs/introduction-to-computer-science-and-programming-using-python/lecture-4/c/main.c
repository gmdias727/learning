#include <stdio.h>

int is_even(int range[], int length) {
    int count = 0;
    for (int i = 0; i < length; i++) {
        if (range[i] % 2 == 0) {
            count++;
        }
    }
    return count;
};

int main() {
    int list[] = {2, 9, 3, 4};
    int len = sizeof(list) / sizeof(list[0]);
    printf("%d\n", is_even(list, len));
} 