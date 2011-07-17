/* Hand-written C code to be used with example1.e */

#include <stdio.h>

void integer_to_c(int i){
  printf("%d\n",i);
}

void character_to_c(char c){
  printf("'%c'\n",c);
}

void boolean_to_c(int b){
  printf("%d\n",b);
}

void real_32_to_c(float r){
  printf("%f\n",r);
}

void real_64_to_c(double d){
  printf("%f\n",d);
}

void string_storage_to_c(char *s){
  printf("%s",s);
}

void any_to_c(void *a){
  if (a == NULL) {
    printf("NULL\n");
  }
  else {
    printf("not NULL\n");
  }
}

int c_int2eiffel(void){
  return -6;
}

char c_char2eiffel(void){
  return '\n';
}


void set_integer_attribute(int*attribute){
  *attribute=2;
}

int hello(void) {
  printf("Hello");
  return 1;
}
