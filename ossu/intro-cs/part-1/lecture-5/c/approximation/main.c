#include <stdio.h>
#include <math.h>
#include <stdlib.h>

void approximation(int value) {
    double epsilon = 0.01;
    int num_guesses = 0;
    double guess = 0.0;
    double increment = 0.00001;

    while (abs(pow(guess, 2) - value) >= epsilon && abs(pow(guess, 2) <= value)) {
        guess += increment;
        num_guesses += 1;
        // printf("guess tries %lf \n", guess);
        printf("num_guessess tries %d \n", num_guesses);

        if (abs(pow(guess, 2) - value) >= epsilon) {
            printf("Failed to square root %d \n", value);
            printf("Last guess was %lf \n", guess);
            printf("last guess squared is %d \n", value*value);

        } else {

            printf("%lf is close to square root of  %d \n", value);
        }
    }

    // printf("num_guesses = %d", num_guesses);
    // printf("%lf is close to the square root of %d", guess, value);
}

int main() {

    approximation(36);
    return 0;
}