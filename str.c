#include "utils.h" // "str.h" -> stdio.h, stdlib.h, string.h, stdbool.h

//? Constructor function.
string* str(char* text)
{
    string* result = (string*)malloc(sizeof(string));
    if (!result) { //! Check for failed memory allocation.
        perror("Unable to allocate memory for string struct.\n");
        exit(EXIT_FAILURE);
    }
    size_t len = strlen(text);
    result->data = (char*)malloc(len + 1);
    if (!result->data) { //! Also check the data!
        perror("Unable to allocate memory for string data\n");
        exit(EXIT_FAILURE);
    }
    strcpy(result->data, text);
    result->length = len;
    return result;
}

//? Destructor function
size_t strFree(string* str)
{
    if (str) {
        free(str->data);
        free(str);
        return 0;
    }
    return 1;
}

void strAppend(string* original, char* suffix)
{
    size_t newLen = original->length + strlen(suffix); 
    char* newData = (char*)realloc(original->data, newLen+1);
    if (!newData) {
        perror("Unable to reallocate memory for new string.\n");
        exit(EXIT_FAILURE);
    }
    strcat(newData, suffix);
    original->data = newData;
    original->length = newLen;
}

void strAppendChar(string* original, char c)
{
    size_t newLen = original->length + 1;
    char* newData = (char*)realloc(original->data, newLen+1);
    if (!newData) {
        perror("Failed to reallocate memory for new string.\n");
        exit(EXIT_FAILURE);
    }
    newData[newLen-1] = c;
    newData[newLen] = '\0';
    original->data = newData;
    original->length = newLen;
}

void strClear(string* original)
{
    original->data[0] = '\0';
    char* newData = (char*)realloc(original->data, 1);
    if (!newData) {
        perror("Unable to reallocate memory for cleared string.\n");
        exit(EXIT_FAILURE);
    }
    original->data = newData;
    original->length = 0;
}

string* strCopy(string* original)
{
    string* result = str(original->data);
    return result;
}

stringArray* strArr(string* original, char* delim)
{
    stringArray* result = (stringArray*)malloc(sizeof(stringArray));
    if (!result) {
        perror("Unable to allocate memory for string array.\n");
        exit(EXIT_FAILURE);
    }
    size_t len = strCountStr(original, delim)+1;
    result->entries = (string**)malloc(sizeof(string*) * (len+1));
    char* token = strtok(original->data, delim);
    size_t current = 0;
    while (token != NULL) {
        string* temp = str(token);
        result->entries[current] = temp; 
        current++;
        token = strtok(NULL, delim);
    }
    result->entries[current] = NULL;
    result->length = len;
    return result;
}

size_t strArrFree(stringArray* arr)
{
    if (arr) {
        if (arr->entries) {
            for (size_t i = 0; i < arr->length; i++) {
                if (arr->entries[i]) {
                    free(arr->entries[i]->data);
                    arr->entries[i]->data = NULL;
                }
                free(arr->entries[i]);
                arr->entries[i] = NULL;
            }
            free(arr->entries);
            arr->entries = NULL;
        }
        free(arr);
        arr = NULL;
        return 0;
    }
    return 1;
}

void strArrAppend(stringArray* original, string* item)
{
    size_t newLen = original->length + 1;
    original->entries = (string**)realloc(original->entries, sizeof(string**) * (newLen+1));
    if (!original->entries) {
        perror("Unable to reallocate memory for new string array.\n");
        exit(EXIT_FAILURE);
    }
    original->entries[newLen-1] = item;
    original->entries[newLen] = NULL;
    original->length = newLen;
}

void strArrDisplay(stringArray* arr)
{
    for (size_t i = 0; i < arr->length; i++) {
        if (arr->entries[i]) {
            puts(arr->entries[i]->data);
        }
    }
}

string* strArrJoin(stringArray* arr, char* delim)
{
    string* result = str("");
    for (size_t i = 0; i < arr->length; i++) {
        strAppend(result, arr->entries[i]->data);
        if (i < arr->length-1) strAppend(result, delim);
    }
    return result;
}

//todo: Make extra utilities