#include "eiffel_coroutine.h"

typedef struct _coroutine_context coroutine_context_t;

#define coroutine_initialize _coroutine_initialize()
#define coroutine_start(iterator, coroutine) _coroutine_start(iterator, coroutine)
#define coroutine_continue(c) _coroutine_continue((coroutine_context_t*)(c))
#define coroutine_yield(c) _coroutine_yield((coroutine_context_t*)(c))

void _coroutine_initialize(void);
coroutine_context_t *_coroutine_start(EIF_OBJECT iterator, EIF_OBJECT coroutine);
EIF_BOOLEAN _coroutine_continue(coroutine_context_t *context);
void _coroutine_yield(coroutine_context_t *context);
