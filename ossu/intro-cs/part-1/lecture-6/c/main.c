#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>

// Bisection Search

void bisection(int value) {
    double epsilon = 0.01;
    double low, high;
    double guess = 0.0;
    int num_guesses = 0;

    if (value >= 1) {
        low = 1.0;
        high = value;
        
        printf("low = %lf \n", low);
        printf("high = %lf \n", high);

    } else {
        low = value;
        high = 1.0;

        printf("low = %lf \n", low);
        printf("high = %lf \n", high);
    }

    // guess = 1.5 / 2 = 0.75
    guess = (high + low) / 2;

    while (fabs(pow(guess, 2) - value) >= epsilon) {
        if (fabs(pow(guess, 2)) < value) {
            low = guess;
            // printf("[WHILE] low = %lf \n", low);
            
        } else {
            high = guess;
            // printf("[WHILE] high = %lf \n", high);
        }
        num_guesses++;
        guess = (high + low) / 2.0;
    }
    printf("num_guesses = %d\n", num_guesses);
    printf("%f is close to square root of %d", guess, value);
}

int main(void) {
    // int8_t something = 1;

    bisection(54321);
    // printf("%d", something);
    return 0;
}
