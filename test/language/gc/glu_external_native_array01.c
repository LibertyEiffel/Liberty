
#include <stdlib.h>

#define C_ARRAY_OFFSET 100
#define C_ARRAY_SIZE  1000


char* get_c_array(void){
  char* tmp = calloc(C_ARRAY_SIZE, 1);
  tmp += C_ARRAY_OFFSET;
  /*printf(" TMP1 %p \n", tmp);*/
  return tmp;
}

int untouched_c_array(char* ca){
  char* tmp = (ca - C_ARRAY_OFFSET);
  /*printf(" ca %p \n", ca);*/
  for (; ca >= tmp; ca--)
    if (*ca != '\0') return 0;
  return 1;
}
