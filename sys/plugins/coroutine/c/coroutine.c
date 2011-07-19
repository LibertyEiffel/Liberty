#include <ucontext.h>
#include <sys/mman.h>

#define COROUTINE_STACK_SIZE (16384)
#define COROUTINE_STACK_PROTECT (128)

static coroutine_context_t *running;

struct _coroutine_context {
  coroutine_context_t *caller;

  ucontext_t           routine_context;

  EIF_OBJECT           iterator;
  EIF_OBJECT           coroutine;

  EIF_BOOLEAN          running;

  char                *stack;
};

static void _coroutine_invoke(coroutine_context_t *context) {
  context->running = 1;
  coroutine_iterator_invoke(context->iterator);
  context->running = 0;
}

void _coroutine_initialize(void) {
  static coroutine_context_t main;
  main.caller = &main;
  getcontext(&(main.routine_context));
  main.iterator = NULL;
  main.coroutine = NULL;
  main.running = 1;
  running = &main;
}

coroutine_context_t *_coroutine_start(EIF_OBJECT iterator, EIF_OBJECT coroutine) {
  coroutine_context_t *context = (coroutine_context_t*)malloc(sizeof(coroutine_context_t));
  char *stack = (char*)malloc(COROUTINE_STACK_SIZE);

  getcontext(&(context->routine_context));

  /* set the coroutine context */
  context->caller = running;
  context->iterator = iterator;
  context->coroutine = coroutine;
  context->running = 0;
  context->stack = stack;

  /* prepare the coroutine stack */
  context->routine_context.uc_link = &(running->routine_context);
  context->routine_context.uc_stack.ss_sp = stack + COROUTINE_STACK_PROTECT;
  context->routine_context.uc_stack.ss_size = COROUTINE_STACK_SIZE - 2 * COROUTINE_STACK_PROTECT;
  context->routine_context.uc_stack.ss_flags = 0;

  /* protect the coroutine stack */
  mprotect(stack, COROUTINE_STACK_PROTECT, PROT_NONE);
  mprotect(stack + COROUTINE_STACK_SIZE - COROUTINE_STACK_PROTECT, COROUTINE_STACK_PROTECT, PROT_NONE);
  mprotect(stack + COROUTINE_STACK_SIZE - COROUTINE_STACK_PROTECT, COROUTINE_STACK_SIZE - 2 * COROUTINE_STACK_PROTECT, PROT_READ | PROT_WRITE);

  /* prepare the coroutine */
  makecontext(&(context->routine_context), (void (*)(void))_coroutine_invoke, 1, context);

  return context;
}

EIF_BOOLEAN _coroutine_continue(coroutine_context_t *context) {
  EIF_BOOLEAN result = 0;
  coroutine_context_t *current = running;

  swapcontext(&(running->routine_context), &(context->routine_context));
  running = current;
  result = context->running;

  if (!result) {
    free(context->stack);
    free(context);
  }
  return result;
}

void _coroutine_yield(coroutine_context_t *context) {
  /* @pre running == context */
  swapcontext(&(context->routine_context), &(context->caller->routine_context));
  running = context;
}
