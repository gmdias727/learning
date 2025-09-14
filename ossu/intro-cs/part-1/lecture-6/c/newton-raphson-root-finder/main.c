#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>

void NewtonRaphsonRootFinder(int32_t value) {
    double epsilon = 0.0001; // <- how accurate it needs to be?
    double guess = value/2.0;
    int num_guesses = 0;

    while (fabs(guess*guess - value) >= epsilon) {
        num_guesses += 1;
        guess = guess - ((fabs(pow(guess, 2) - value))/ (2*guess));
    }

    printf("num_guesses = %d \n", num_guesses);
    printf("Square root of %d is about %f \n", value, guess);

}

int main(void) {
    NewtonRaphsonRootFinder(24);
    NewtonRaphsonRootFinder(36);
    NewtonRaphsonRootFinder(72);
    NewtonRaphsonRootFinder(900);
    NewtonRaphsonRootFinder(1000);
    NewtonRaphsonRootFinder(1000000);
    NewtonRaphsonRootFinder(5000000);
    NewtonRaphsonRootFinder(10000000);
    NewtonRaphsonRootFinder(99999999);
    return 0;
}
