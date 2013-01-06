/*
 * Extra externals (not generated)
 */

char *dupstr(char *s) {
     char *result = NULL;
     if (s) {
          result = se_malloc(strlen(s) + 1);
          strcpy(result, s);
     }
     return result;
}

static EIF_OBJECT liberty_rl_completer = NULL;

static char *liberty_rl_complete(char *text, int state) {
     return dupstr((char*)readline_extra_completion_more(liberty_rl_completer, text, state));
}

static char** liberty_rl_completion(char *text, int start, int end) {
     char **result = NULL;
     if (liberty_rl_completer) {
          readline_extra_completion_start(liberty_rl_completer, (EIF_POINTER)text, (EIF_INTEGER_32)start, (EIF_INTEGER_32)end);
          result = rl_completion_matches((EIF_POINTER)text, (rl_compentry_func_t*)&liberty_rl_complete);
          readline_extra_completion_done(liberty_rl_completer, (EIF_POINTER)text);
     }
     return result;
}

void extra_set_rl_attempted_completion_function(EIF_OBJECT target) {
     liberty_rl_completer = target;
     rl_attempted_completion_function = (rl_completion_func_t*)&liberty_rl_completion;
}
