#include <stdio.h>
#include <string.h>
#include "slicing.h"

char A = 'A';
char B = 'B';
char O = 'O';
char Negative = '-';
char Positive = '+';

char* bloodType(char type, char signal) {
    static char buf[3];

    switch (type) {
        case 'A':
            buf[0] = type;
            switch (signal) {
                case '+':
                    buf[1] = signal;
                    buf[2] = '\0';
                    return buf;
                // case '-': return "A-";
            }
        case 'B':
            switch (signal) {
                case '+': return "B+";
                case '-': return "B-";
            }
        case 'O':
            switch (signal) {
                case '+': return "O+";
                case '-': return "O-";
            }
        case 'AB':
            switch (signal) {
                case '+': return "AB+";
                case '-': return "AB-";
            }
        default:
            return "Unknown";
    }
}

// Without strings header
int count_chars(const char *str) {
    int count = 0;
    while( str[count] != '\0' ) {
        count++;
    }
    return count;
}

int guess_number(int a) {
    int secret = 42;
    if ( a < secret ) return printf("number to low");
    if ( a > secret ) return printf("number to high");
    if ( a == secret ) return printf("correct guess");

}

int main() {
    char* some_string = "Hello World";
    size_t size_of = strlen(some_string);

    printf("%s\n", bloodType(A, Positive));
    printf("%d\n", count_chars(bloodType(A, Positive)));

    printf("size_of length is: %zu\n", size_of);
    slicing_test();
    guess_number(42);

    return 0;
}