#include <stdio.h>
#include <string.h>

void string_to_list(char* text) {
    int length = strlen(text);
    char cap[32];

    // printf("before %s \n", text);
    printf("[");
    for (int i = 0; i < length; i++) {
        cap[i] = text[i];
        if (i == length - 1) {
            printf("'%c'", cap[i]);
        } else {
            printf("'%c', ", cap[i]);
        }
        
    }
    printf("]\n");
    // printf("after %s \n", text);

}

int main(void) {
    string_to_list("Vera");
    return 0;
}
