#include <stdio.h>
#include <math.h>
#include <string.h>

double floating_point_to_binary() {
    double x = 0.625;
    int p = 0;

    // Find power of 2 to make integer
    while (fmod(pow(2,p) * x, 1.0) != 0) {
        double remainder = pow(2, p) * x - (int)(pow(2, p) * x);
        printf("Remainder %f\n", remainder);
        p += 1;
    }

    // convert to int
    int num = (int)(x*pow(2, p));


    // Encode as binary number
    char result[32] = "";
    char temp[32];
    int len = strlen(result);
    if (len == 0) {
        strcpy(result, "0");
    }
    
    while (num > 0) {
        sprintf(temp, "%d", num % 2);
        strcat(result, temp);
        num = num / 2;
    }

    // Pad front with 0's, e.g shift right
    int current_len = strlen(result);
    if (current_len < p) {
        memmove(result + (p - current_len), result, current_len + 1);
        memset(result, '0', p - current_len);
    }

    // Insert decimal
    memmove(result + strlen(result) - p + 1, result + strlen(result) - p, p + 1);
    result[len - p] = '.';

    printf("Binary: %s \n", result);
    return 0;
}

int main() {
    floating_point_to_binary();
    return 0;
}