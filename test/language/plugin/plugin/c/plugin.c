void void_no_args()
{
  printf("Hello, void argumentless world!\n");
}

int int_no_args()
{
  printf("Hello, int argumentless world!\n");

  return 1;
}

void void_with_args(int a)
{
  printf("Hello, void %i world with arguments!\n", a);
}

int int_with_args(int a)
{
  printf("Hello, int world with arguments!\n");

  return 1 + a;
}
