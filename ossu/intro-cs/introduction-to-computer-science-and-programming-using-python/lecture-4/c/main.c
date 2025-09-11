#include <locale.h>
#include <stddef.h>
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


void find_duplicates(char text[]) {

    int length = strlen(text);

    int freq[256] = {0};

    for (int i = 0; i < length; i++) {
        unsigned char c = text[i];
        freq[c]++;
    }

    printf("Caracteres repetidos: \n");
    int found = 0;
    for (int i = 0; i < 256; i++) {
        if (freq[i] > 1) {
            printf("%c' aparece %d vezes\n", i, freq[i]);
        }
    }

    if (!found) {
        printf("Nenhum caractere repetido encontrado\n");
    }
}

int main() {

    char text[] = "abcdeab";

    find_duplicates(text);
    return 0;
} 