#include <stdio.h>
#include <stdint.h>

int rec_sum(int a, int b) {
    if (b == 1) {
        return a;
    } else {
        return a + rec_sum(a , b-1);
    }
}

int32_t rec_mult(int32_t a, int32_t b) {
    if (b == 1) {
        return a;
    } else {
        return a * rec_mult(a , b-1);
    }
}

int main(void) {
    printf("%d\n", rec_sum(10, 3));
    printf("%d\n", rec_mult(3, 3));
    return 0;
}
