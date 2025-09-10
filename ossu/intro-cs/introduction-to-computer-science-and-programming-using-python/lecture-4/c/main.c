#include <stdio.h>
#include <string.h>

int is_even(int range[], int length) {
    int count = 0;
    for (int i = 0; i < length; i++) {
        if (range[i] % 2 == 0) {
            count++;
        }
    }
    return count;
};

int find_duplicates(char text[]) {
    int length = strlen(text);
    int count = 0;

    for (int i = 0; i < length; i++) {
        for (int j = i + 1; j < length; j++) {
            if (text[i] == text[j]) {
                count++;
                break;
            }
        }
    }

    return count;
}

int main() {

    char text[] = "abcdeab";

    printf("%d\n", find_duplicates(text));
} 