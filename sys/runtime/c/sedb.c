/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/
/*
  This file (SmartEiffel/sys/runtime/sedb.c) is automatically included when
  `run_control.no_check' is true (i.e. in all modes except -boost).
  This file comes after no_check.[hc] to implement the -sedb flag.
*/

#include <stdarg.h>

#define SEDB_BUFMAX 4096

/* Each breakpoint is described with one _se_breakpoint info struct: */
typedef struct _se_breakpoint se_breakpoint;
struct _se_breakpoint {
    int name_flag; char name[SEDB_BUFMAX];
    int file_flag; char file[SEDB_BUFMAX];
    int line_flag; int line_minimum; int line_maximum;
    int stack_flag; int stack_limit; int stack_automatic;
    int confirmed;
    se_breakpoint* next; /* The next breakpoint or NULL. */
};

/* The breakpoint list: */
static TLS(se_breakpoint*) breakpoint_list = NULL;

/* Save the last command for automatic repetition */
static TLS(char) sedb_last_command[SEDB_BUFMAX];

/* Save the last 'eval' expression */
static TLS(char) sedb_eval_expression[SEDB_BUFMAX];

enum sedb_status_values sedb_status = SEDB_START_STATUS;

/* For SEDB_TRACE_FILE mode. A non NULL value indicates
   that the user is doing some profiling:
*/
static TLS(FILE*) sedb_trace_file = NULL;

static TLS(int) sedb_signal_raised = 0;
static TLS(int) sedb_in_signal_handler = 0;
static TLS(int) sedb_in_read_line = 0;

/* previous dump stack frame */
static TLS(se_dump_stack*) sedb_previous_ds;

/* ---------------------------------------------------------------------- */
/* forward declarations */

static void _sedb_running_status(se_dump_stack*ds, se_position position);
static void _sedb_running_ignore_breakpoints(se_dump_stack*ds, se_position position);
static void _sedb_step_by_step(se_dump_stack*ds, se_position position);
static void _sedb_start_status(se_dump_stack*ds, se_position position);
static void _sedb_waiting_kbd(se_dump_stack*ds, se_position position);
static void _sedb_trace_file(se_dump_stack*ds, se_position position);
static void _sedb_eval(se_dump_stack*ds, char* expr, int eval_again);

/* ---------------------------------------------------------------------- */
/* SEDB messages printing */

#ifdef SEDB_NAMED_PIPES

static TLS(FILE*) sedb_input_stream;
static TLS(FILE*) sedb_output_stream;

static FILE* sedb_input(void) {
  if (sedb_input_stream == NULL) {
    sedb_duplicate();
  }
  return sedb_input_stream;
}

static FILE* sedb_output(void) {
  if (sedb_output_stream == NULL) {
    sedb_duplicate();
  }
  return sedb_output_stream;
}

static TLS(char) sedb_path_in[SEDB_BUFMAX];
static TLS(char) sedb_path_out[SEDB_BUFMAX];

static int sedb_ensure_directory(char* path) {
  struct stat s;
  int n = stat(path, &s);
  char *p, *c;
  if (n != -1 && S_ISLNK(s.st_mode)) {
    lstat(path, &s);
  }
  if (n == -1) {
    if (errno == ENOENT) {
      n = mkdir(path, 0700);
      if (n == -1) {
        if (errno == ENOENT) {
          p = c = path;
          while (*c != '\0') {
            if (*c == '/') {
              p = c;
            }
            c++;
          }
          if (p == path) {
            return 0;
          }
          *p = '\0';
          if (sedb_ensure_directory(path)) {
            *p = '/';
            if (sedb_ensure_directory(path)) {
              return 1;
            }
          }
        }
        return 0;
      }
      return 1;
    }
    return 0;
  }
  if (S_ISDIR(s.st_mode)) {
    return 1;
  }
  return 0;
}

static void sedb_make_pipes(char* path) {
  struct stat s;
  int n;
  n = snprintf(sedb_path_in, SEDB_BUFMAX, "%s/in", path);
  if (n == -1 || n >= SEDB_BUFMAX) {
    return;
  }
  n = snprintf(sedb_path_out, SEDB_BUFMAX, "%s/out", path);
  if (n == -1 || n >= SEDB_BUFMAX) {
    return;
  }

  n = stat(sedb_path_in, &s);
  if (n == -1) {
    if (errno != ENOENT) {
      return;
    }
  } else if (S_ISFIFO(s.st_mode)) {
    n = unlink(sedb_path_in);
    if (n == -1) {
      return;
    }
  } else {
    return;
  }

  n = stat(sedb_path_out, &s);
  if (n == -1) {
    if (errno != ENOENT) {
      return;
    }
  } else if (S_ISFIFO(s.st_mode)) {
    n = unlink(sedb_path_out);
    if (n == -1) {
      return;
    }
  } else {
    return;
  }

  n = mknod(sedb_path_in, 0600 | S_IFIFO, 0);
  if (n == -1) {
    return;
  }

  n = mknod(sedb_path_out, 0600 | S_IFIFO, 0);
  if (n == -1) {
    return;
  }

  sedb_input_stream = fopen(sedb_path_in, "r");
  if (sedb_input_stream != NULL) {
    fcntl(fileno(sedb_input_stream), F_SETFL, O_NONBLOCK);
  }

  sedb_output_stream = fopen(sedb_path_out, "w");
  if (sedb_output_stream != NULL) {
      fcntl(fileno(sedb_output_stream), F_SETFL, O_NONBLOCK);
  }
}

void sedb_duplicate(void) {
  char tmp[SEDB_BUFMAX];
  char path[SEDB_BUFMAX];
  char*tmpdir;
  int n;
  if (sedb_input_stream != NULL) {
    fclose(sedb_input_stream);
  }
  if (sedb_output_stream != NULL) {
    fclose(sedb_output_stream);
  }
#ifdef SEDB_NAMED_PIPES_DIRECTORY
  n = snprintf(tmp, SEDB_BUFMAX, "%s", SEDB_NAMED_PIPES_DIRECTORY);
#else
  tmpdir = getenv("TMPDIR");
  if (tmpdir == NULL) {
    n = -1;
  } else {
    n = snprintf(tmp, SEDB_BUFMAX, "%s/sedb_%s", getenv("USER"), tmpdir);
  }
#endif
  if (n == -1 || n >= SEDB_BUFMAX) {
    snprintf(tmp, SEDB_BUFMAX, "/tmp/sedb_%s", getenv("USER"));
  }
  n = snprintf(path, SEDB_BUFMAX, "%s/%d", tmp, getpid());
  if (n != -1 && n < SEDB_BUFMAX) {
    if (sedb_ensure_directory(path)) {
      sedb_make_pipes(path);
    }
  }

  /* fallbacks if error */
  if (sedb_input_stream == NULL) {
    fprintf(SE_ERR, "bad input pipe");
    sedb_input_stream = stdin;
  }
  if (sedb_output_stream == NULL) {
    fprintf(SE_ERR, "bad output pipe");
    sedb_output_stream = SE_ERR;
  }
}

static char sedb_get_char(FILE*f) {
  char c;
  int fd = fileno(f);
  int i;
  fd_set wait;
  FD_ZERO(&wait);
  for(;;) {
    i = read(fd, &c, 1);
    if (i == 1) break;
    if (i == 0) {
      fprintf(SE_ERR, "EOF on input pipe!\n");
      exit(1);
    }
    if (errno != EAGAIN) {
      perror("read");
      exit(1);
    }
    FD_SET(fd, &wait);
    select(fd+1, &wait, NULL, NULL, NULL);
  }
  return c;
}

static int sedb_vprintf(FILE*f, char* format, va_list args) {
  int result;
  char s[SEDB_BUFMAX];
  int fd = fileno(f);
  int i, r;
  fd_set wait;
  FD_ZERO(&wait);
  result = vsnprintf(s, SEDB_BUFMAX, format, args);
  for (i = 0; i < result; i++) {
    for (;;) {
      r = write(fd, s+i, 1);
      if (r != -1) break;
      if (errno != EAGAIN) {
        perror("write");
        exit(1);
      }
      FD_SET(fd, &wait);
      select(fd+1, NULL, &wait, NULL, NULL);
    }
  }
  return result;
}

static int sedb_printf(FILE*f, char* format, ...) {
  int result;
  va_list args;
  va_start(args, format);
  result = sedb_vprintf(f, format, args);
  va_end(args);
  return result;
}

#else

#ifndef SEDB_IN
#ifdef WIN32
# define SEDB_IN fopen("CONIN$", "r")
#else
# define SEDB_IN fopen("/dev/tty", "r")
#endif
#endif

static FILE* sedb_input(void) {
  static FILE* result = NULL;

  if (result == NULL) {
    /* Open the console device */
    result = SEDB_IN;
    if (result == NULL) {
      /* Not found: back to stdin */
      result = stdin;
    }
  }

  return result;
}

static FILE* sedb_output(void) {
  return SE_ERR;
}

void sedb_duplicate(void) {
  /* does nothing */
}

#define sedb_get_char(f) (getc(f))
#define sedb_vprintf vfprintf
#define sedb_printf fprintf

#undef SEDB_IN

#endif /* SEDB_NAMED_PIPES */

static int sedb_message_var(char* format, va_list args) {
  FILE*out=sedb_output();
  sedb_printf(out, "(sedb) ");
  return sedb_vprintf(out, format, args);
}

static int sedb_message(char* format, ...) {
  int result = 0;
  va_list args;
  va_start(args, format);
  result = sedb_message_var(format, args);
  va_end(args);
  return result;
}

/* ---------------------------------------------------------------------- */
/* buffers management to avoid averflows -- all buffers must have the size
   `SEDB_BUFMAX' */

/* Returns the length of the buffer if success, SEDB_BUFMAX if overflow. The
   input buffer is set with the content of the line, with at most
   SEDB_BUFMAX-1 characters (the last is reserved for '\0')

   The prompt may be NULL to display a default prompt, or a format a la printf().
*/
static int sedb_read_line_in(char* buffer, int tolower, char* prompt, ...) {
  static char norm_input[SEDB_BUFMAX]; /* normal input buffer     */
  static char sig_input[SEDB_BUFMAX];  /* in-handler input buffer */
  FILE* sedb_in = sedb_input();        /* input stream            */
  FILE* sedb_out = sedb_output();      /* output stream           */

  int   i      = 0;
  int   result = 0;
  int   again, read_again;
  int   c;
  int   save_flag = sedb_in_read_line;
  char* input = sedb_in_signal_handler /* allow reentrance (because of signal handler) */
    ? sig_input
    : norm_input;

  do {
    sedb_in_read_line = 1;
    read_again = 0;

    if (prompt == NULL) {
#ifndef SEDB_NAMED_PIPES
      sedb_printf(sedb_out, "sedb> ");
#endif
    }
    else {
      va_list args;
      va_start(args, prompt);
      sedb_message_var(prompt, args);
      va_end(args);
    }
    fflush(sedb_out);

    do {
      c = sedb_get_char(sedb_in);
      again = (c != '\n' && c != EOF && !sedb_signal_raised && !ferror(sedb_in));
      if (again) {
        if (i < SEDB_BUFMAX-1) {
          if (tolower && ('A' <= c) && (c <= 'Z')) {
            c += 32;
          }
          input[i] = c;
          input[i+1] = '\0';
          i++;
          result++;
        }
        else {
          result = SEDB_BUFMAX;
        }
      }
    } while (again);
    if (ferror(sedb_in)) {
      sedb_message("An error occurred on the input stream.\n");
      clearerr(sedb_in);
    }
    if (sedb_signal_raised) {
      read_again = 1;
      sedb_signal_raised = 0; /* THERE IS A RACE CONDITION HERE */
    }

    sedb_in_read_line = save_flag; /* AND HERE TOO... */
  } while (read_again);

  memcpy(buffer, input, SEDB_BUFMAX);
  return result;
}

/* Returns 1 if success, 0 if overflow */
static int append_in(char* buffer, char c) {
  int i = strlen(buffer);
  int result = 1;
  if (i < SEDB_BUFMAX-1) {
    buffer[i] = c;
    buffer[i+1] = '\0';
  }
  else {
    result = 0;
  }
  return result;
}

/* ---------------------------------------------------------------------- */

static int sedb_yes_or_no(char* question, int default_answer) {
  /* To ask some [yes/no] question interactively. */
  static char answer[SEDB_BUFMAX];
  int again;
  int result;
  int i;
  do {
    again = 0;
    i = sedb_read_line_in(answer, 1, "%s (yes/no)? [%s] ", question, (default_answer ? "yes" : "no"));

    if (i == 0) {
      result = default_answer;
    }
    else if ((strcmp("yes",answer)==0) || (strcmp("y",answer)==0) ||
             (strcmp("oui",answer)==0) || (strcmp("o",answer)==0)) {
      result = 1;
    }
    else if ((strcmp("no",answer)==0) || (strcmp("n",answer)==0) ||
             (strcmp("non",answer)==0)) {
      result = 0;
    }
    else {
      sedb_message("The answer '%s' is not clear.\n", answer);
      again = 1;
    }
  } while (again);
  return result;
}

static void sedb_on_line_help(char* line) {
  int all=0;
  int help=0;
  int executing=0;
  int breakpoints=0;
  int data_display=0;
  int miscellaneous=0;
  FILE* out = sedb_output();
  if (line == NULL) {
    help=1;
  }
  else {
    line++;
    if (*line == '\0') {
      help=1;
    }
    else {
      char c;
      while (*line==' ') line++;
      c=*line;
      if (c <= 'Z') c += 32;
      switch(c) {
      case 'a': all=1; break;
      case 'e': executing=1; break;
      case 'b': breakpoints=1; break;
      case 'd': data_display=1; break;
      case 'm': miscellaneous=1; break;
      default: help=1; break;
      }
    }
  }

  sedb_printf(out,
          "SmartEiffel debugger help (list of commands):\n"
          "\n"
          "HELP\n"
          " ? or h  : display this help message\n"
          " H       : display more help on the debugger usage\n"
          " q       : (or Q) quit the debugger\n");

  if (help) {
    sedb_printf(out,
            "\n"
            "           You can type a letter after ? or h:\n"
            "             a -> help on all commands\n"
            "             e -> help on EXECUTING commands\n"
            "             b -> help on BREAKPOINTS commands\n"
            "             d -> help on DATA DISPLAY commands\n"
            "             m -> help on MISCELLANEOUS commands\n"
            "\n");
  }
  else {
    sedb_printf(out, "\n");
  }

  if (all||executing) {
    sedb_printf(out,
            "EXECUTING\n"
            " s        : single step, stepping into routine calls\n"
            " n        : single step, without stepping into routine calls\n"
            " f        : continue execution until the current routine finishes\n"
            " c        : continue execution until the next breakpoint\n"
            " C        : continue execution, ignore all breakpoints\n"
            "\n");
  }

  if (all||breakpoints) {
    sedb_printf(out,
            "BREAKPOINTS\n"
            " b        : set a new breakpoint at the current execution point\n"
            " B        : display the entire breakpoint list\n"
            " -[#]     : delete a breakpoint\n"
            "\n");
  }

  if (all||data_display) {
    sedb_printf(out,
            "DATA DISPLAY\n"
            " e <exp>  : evaluate the expression <exp>\n"
            " p .<exp> : evaluate an expression according to the previous\n"
            "   --- for the two above, see More Help ('H') ---\n"
            " .        : display the current execution point\n"
            " u        : display the caller point (go up in the stack)\n"
            " d        : display the callee point (go down in the stack)\n"
            " S        : display the entire stack (all frames)\n"
            "\n");
  }

  if (all||miscellaneous) {
    sedb_printf(out,
            "MISCELLANEOUS\n"
            " G        : run the garbage collector now\n"
            " g        : show garbage collector information\n"
            " T        : switch to the \"trace.se\" file mode\n"
            " Enter    : repeat the previous debugger command\n"
            "\n");
  }
}

static void sedb_on_line_more_help(void) {
  FILE* out = sedb_output();
  if (sedb_yes_or_no("More help with the SmartEiffel debugger",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "Yes, sedb is the Liberty Eiffel Debugger. Keep in mind that you can trust sedb\n"
            "if and only if you are using a freshly compiled system. To take in account\n"
            "any modification of some Eiffel source file, you must leave sedb and\n"
            "recompile your system first.\n"
            "\n");
  }

  if (sedb_yes_or_no("More help about granularity of debugging",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "When using the traditional command line mode (i.e. no ACE files) the debugger\n"
            "examines all traced points in the Eiffel source code. Thus, all possible points\n"
            "of your Eiffel system are examined (even points of the BOOLEAN class itself!).\n"
            "This is great for learning Eiffel but it may slow down debugging especially for\n"
            "large systems. Thanks to the ACE files facility (see examples in directory\n"
            "SmartEiffel/tutorial/ace), you can decide which clusters/files are to be\n"
            "traced. (You have to use the trace clauses of the ACE file to select the\n"
            "debugging granularity.) This is good to know. Also keep in mind that you can\n"
            "still use the GENERAL.trace_switch feature to switch the granularity of the\n"
            "debugging dynamically.\n"
            "\n");
  }

  if (sedb_yes_or_no("More help about CTRL-C keyboard interruption",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "While running a program under sedb, you can hit CTRL-C at any time\n"
            "in order to view what the program is doing right now.\n"
            "\n");
  }

  if (sedb_yes_or_no("More help with breakpoints",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "A breakpoint is composed of four kinds of information/condition: (1) a routine\n"
            "name indication, (2) a file name indication, (3) a line range, and (4) a stack\n"
            "limit. Each kind of information may be separately selected or not. (You should\n"
            "select at least one information/condition.) When more than one condition is\n"
            "selected a logical \"and\" is performed to decide whether the breakpoint matches\n"
            "the current execution point or not.\n"
            "\n");

    if (sedb_yes_or_no("More help with breakpoints - name indication",1)) {
      /*      ------------------------------------------------------------------------------- */
      sedb_printf(out,
              "The name information of the debugging stack contains information about the\n"
              "name of the routine called as well as the base class where this routine is\n"
              "defined. The name indication of the breakpoint can be any substring to be\n"
              "searched within the name information of the stack. For example, if the name\n"
              "indication is \"item\", the execution would stop in feature item of STRING\n"
              "but also in feature item of ARRAY, in feature item of DICTIONARY, etc.\n"
              "If the name indication is \"item STRING\", execution would stop only in\n"
              "routine item defined in class STRING. Also note that the name indication\n"
              "can be any substring. For example, if the name indication is \"is_\", the\n"
              "execution would stop in is_empty, is_integer, is_real, etc. As another\n"
              "example, if the name indication is \"STRI\", the execution would stop at\n"
              "any place in classes STRING, ARRAY[STRING], DICTIONARY[STRING,FOO], etc.\n"
              "Finally, also note that the \"invariant\" string is used when the execution\n"
              "is in the class invariant of some class, hence allowing you to spot all\n"
              "class invariant execution.\n"
              "\n");
    }

    if (sedb_yes_or_no("More help with breakpoints - file indication",1)) {
      /*      ------------------------------------------------------------------------------- */
      sedb_printf(out,
              "If you want to stop each time the execution reaches the string.e file class,\n"
              "it can be achieved easily by setting the file indication to \"string.e\".\n"
              "Because the file name indication is applied on the whole path of the file,\n"
              "the file indication allows you to filter more than a simple file name. For\n"
              "example, if the file indication is \"lib/kernel\", the execution would stop each\n"
              "time execution reaches some code in the kernel library of SmartEiffel.\n"
              "\n");
    }

    if (sedb_yes_or_no("More help with breakpoints - line range",1)) {
      /*      ------------------------------------------------------------------------------- */
      sedb_printf(out,
              "The line range information allows you to select the line range to be\n"
              "considered.  For example, to stop each time execution reaches line 12 or 13\n"
              "in some file, just enter [12,13] as a line range.\n"
              "\n");
    }

    if (sedb_yes_or_no("More help with breakpoints - stack limit",1)) {
      /*      ------------------------------------------------------------------------------- */
      sedb_printf(out,
              "The stack limit condition allows you to watch the stack size during\n"
              "execution. (This is useful to debug bad recursive calls.) For example, a stack\n"
              "limit of 10 would stop the execution as soon as the stack size reaches this\n"
              "10 limit. The automatic incrementation option causes the stack-limit to be\n"
              "incremented each time the corresponding breakpoint matches. For example, a\n"
              "breakpoint composed only of a single stack limit condition is a perfect\n"
              "watch dog of stack memory consumption.\n"
              "\n");
    }

    if (sedb_yes_or_no("More help about GENERAL.sedb_breakpoint",1)) {
      /*      ------------------------------------------------------------------------------- */
      sedb_printf(out,
              "The feature `sedb_breakpoint' defined in class GENERAL can be used to set a\n"
              "breakpoint directly in your Eiffel source file. Keep in mind that you have\n"
              "to recompile your system each time some Eiffel source file is modified. Thus\n"
              "each time you add a \"sedb_breakpoint\" call to some Eiffel source file\n"
              "you must recompile your code first. Also note that a \"sedb_breakpoint\" is\n"
              "always enabled even when the corresponding source file is not traced (see ACE\n"
              "file mode).\n"
              "\n");
    }
  }

  if (sedb_yes_or_no("More help with data displaying",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "The command 'e', followed by an expression, evaluates the expression and\n"
            "displays it.\n"
            "NOTE THAT currently only object attributes and once function results can be\n"
            "displayed (general Eiffel expression are not supported). A special extension\n"
            "is allowed for NATIVE_ARRAY: its \"attributes\" are numbers, starting from 0.\n"
            "You can also display the local variables (and feature parameters) of the\n"
            "current stack frame.\n"
            "Examples: if s is a STRING:\n"
            "  e s                -> \"hello%%N\"\n"
            "  e s.count          -> 6\n"
            "  e s.storage.5      -> '%%N'\n"
            "\n"
            "Furthermore, the command 'p', followed by a partial expression (beginning\n"
            "with a dot) is concatenated to the last 'e' or 'p' command. It is useful for\n"
            "data mining. Examples:\n"
            "  e s                -> \"hello\"\n"
            "  p .count           -> 6\n"
            "  p ..storage.0      -> 'h'\n"
            "  p ..1              -> 'e'\n"
            "\n"
            "Note the role of \"..\" that \"goes up\" one eval cell before concatenating.\n"
            "\n"
            "To be continued...\n");
    if (sedb_yes_or_no("More help with data displaying - continued",1)) {
      /*      ------------------------------------------------------------------------------- */
      sedb_printf(out,
              "The commands 'u' and 'd' (resp. \"up\" and \"down\") help wandering along the\n"
              "whole call stack. The command '.' also displays the current stack frame.\n"
              "\n"
              "Note that 'e' and 'p' always refer to the current frame. In that case,\n"
              "  e Current\n"
              "\n"
              "will have a different meaning depending on 'u' and 'd'.\n"
              "The 'S' command may display either a compact stack trace, or an expanded one.\n"
              "The default option is the compact display; in that case, the current stack\n"
              "frame is marked by a star. The expanded stack display shows the stack as\n"
              "displayed when an exception is raised.\n"
              "\n"
              "Note that if there is a rescue stack, those frames *cannot* be reached\n"
              "by 'u' and 'd'.\n"
              "\n");
    }
  }

  if (sedb_yes_or_no("More help with garbage collector information",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "The 'G' command of sedb allows you to run the garbage collector at any time\n"
            "while debugging. You can get more information about the number of objects\n"
            "used for each Eiffel reference type. This is achieved in traditional command\n"
            "line mode with the -gc_info flag. In ACE file mode, you have to switch on the\n"
            "\"gc_info\" option in the \"generate\" section to achieve the same behavior.\n"
            "\n");
  }

  if (sedb_yes_or_no("More help with \"trace.se\" file mode",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "The 'T' command of sedb allows you to switch to the \"trace.se\" file mode.\n"
            "The goal of this mode is to collect profiling information into the \"trace.se\"\n"
            "file. The profiling information indicates which line, which column, in which\n"
            "Eiffel source file execution goes. In traditional command line mode, because\n"
            "all classes are traced, the \"trace.se\" file is usually a huge file even for a\n"
            "small program. Thanks to the ACE file facility, you can decide to trace or not\n"
            "to trace each class separately (see \"More help about granularity of debugging\").\n"
            "Feature GENERAL.trace_switch allows trace generation to be turned on/off\n"
            "dynamically. At run time, if the argument of feature trace_switch is true, trace\n"
            "printing is switched on. (Conversely, false means switch off trace printing.)\n"
            "When the -sedb option is not specified, calls to trace_switch are ignored by\n"
            "compile_to_c (no C code is produced).\n"
            "\n");
  }

  if (sedb_yes_or_no("More help about sedb itself",1)) {
    /*      ------------------------------------------------------------------------------- */
    sedb_printf(out,
            "This debugger is written in C (sorry :-). The complete source code of this\n"
            "debugger is in the file ${SmartEiffel}/sys/runtime/c/sedb.c\". Please, feel\n"
            "free to debug or to complete this debugger. Any problem should be reported in\n"
            "the SmartZilla bugs base at \"http://SmartZilla.loria.fr\".\n"
            "Also, do not forget to visit our WEB pages at \"http://SmartEiffel.loria.fr\".\n"
            "\n");
  }
}

static void sedb_show_point(se_dump_stack*ds, int l, int c, int f) {
  /* Try to printf information about the Current point. */
  FILE* out = sedb_output();
  char* path; FILE *file; int line = 1; char cc; int after;

  sedb_printf(out,"---- Stack-frame: %d ---- inside ",se_stack_size(ds));
  fflush(out);
  if (!se_print_one_frame_in(out,ds,NULL,0)) {
    fflush(out);
    return ;
  }
  fflush(out);
  path = p[f];
  if (path == NULL) {
    sedb_printf(out,"line %d column %d of some unknown file.\n",l,c);
    return ;
  }
  file = fopen(path,"r");
  if (file == NULL) {
    sedb_printf(out,"Unable to access source file \"%s\".\n",path);
    sedb_printf(out,"\t(Are you sure you're debugging a freshly compiled program?)\n");
    sedb_printf(out,"\t(Debugging should be done in the compilation directory.)\n");
    sedb_printf(out,"line %d column %d of \"%s\".\n",l,c,path);
    return ;
  }
  sedb_printf(out,"------------------------------------------------------------------------\n");
  while (line < (l - 5)) {
    cc = getc(file);
    if (cc == '\n') {
      line++;
    }
  }
  sedb_printf(out," %d\t",line);
  while (line < l) { /* To show lines before the point. */
    cc = getc(file);
    if (cc == '\n') {
      line++;
      if (line != l) sedb_printf(out,"\n %d\t",line);
    }
    else {
      if (cc == '\t')
        sedb_printf(out,"   ");
      else
        sedb_printf(out,"%c",cc);
    }
  }
  sedb_printf(out,"\n>%d++\t",line);
  while (line == l) { /* To show the point. */
    cc = getc(file);
    if (cc == '\n') {
      line++;
      sedb_printf(out,"\n %d\t",line);
    }
    else {
      if (cc == '\t')
        sedb_printf(out,"   ");
      else
        sedb_printf(out,"%c",cc);
    }
  }
  after = l + 3;
  while (line < after) {
    /* To show some lines after the point. */
    int tmp = getc(file);
    if (tmp == EOF) break;
    cc = tmp;
    if (cc == '\n') {
      line++;
      if (line != after) {
        sedb_printf(out,"\n %d\t",line);
      }
    }
    else {
      if (cc == '\t')
        sedb_printf(out,"   ");
      else
        sedb_printf(out,"%c",cc);
    }
  }
  sedb_printf(out,"\n");
  fclose(file);
  return ;
}

static void sedb_show_point_frame(se_dump_stack*ds) {
  se_position position = ds->p;
  int li = se_position2line(position);
  int co = se_position2column(position);
  int fi = se_position2path_id(position);

  sedb_show_point(ds,li,co,fi);
}

/* A returns 0 if this is really a stupid breakpoint (nothing displayed),
   1 otherwise. */
static int sedb_view_breakpoint(se_breakpoint* bp) {
  int result = 0;
  FILE* out = sedb_output();

  if (bp->name_flag) {
    result = 1;
    sedb_printf(out,"\t\tname indication = \"%s\".\n",bp->name);
  }
  if (bp->file_flag) {
    result = 1;
    sedb_printf(out,"\t\tfile indication = \"%s\".\n",bp->file);
  }
  if (bp->line_flag) {
    result = 1;
    sedb_printf(out,"\t\tline range [%d,%d].\n",bp->line_minimum,bp->line_maximum);
  }
  if (bp->stack_flag) {
    result = 1;
    sedb_printf(out,"\t\tstack limit = %d  automatic: %s\n",
            bp->stack_limit,
            (bp->stack_automatic?"yes":"no"));
  }
  return result;
}

/* Get an integer value. The `default_value' is considered only when greater
   than 0. */
static int sedb_get_int(char* value_name, int default_value) {
  static char answer[SEDB_BUFMAX];
  int i, j; char c; int result;
  int again;
  do {
    again = 0;
    result = 0;

    if (default_value > 0) {
      i = sedb_read_line_in(answer, 0, "%s = [%d]", value_name, default_value);
    }
    else {
      i = sedb_read_line_in(answer, 0, "%s = ", value_name);
    }

    if (i == 0) {
      result = default_value;
    }
    else {
      for (j = 0; j < i; j++) {
        c = answer[j];
        if (('0' <= c) && (c <= '9')) {
          result = (result * 10) + (c - '0');
        }
        else {
          sedb_message("Bad integer natural value: \"%s\".\n",answer);
          again = 1;
        }
      }
    }
  } while (again);
  return result;
}

/* Get a string value. */
void sedb_get_string(char* name, char* buffer) {
  int i;
  int again;
  do {
    again = 0;
    i = sedb_read_line_in(buffer, 0, "%s: ", name);

    if (i == 0) {
      sedb_message("The empty string is not allowed.\n");
      again = 1;
    }
    else {
      sedb_message("%s = \"%s\"",name,buffer);
      again = (!sedb_yes_or_no(" confirm",1));
    }
  } while (again);
}

static se_breakpoint* sedb_get_new_breakpoint(void) {
  static se_breakpoint* bp = NULL;

  se_breakpoint* result;
  char* question; int default_answer = 1;
  int again;

  if (bp == NULL || bp->confirmed) {
    /* Create a new breakpoint */
    bp = (se_breakpoint*)se_malloc(sizeof(se_breakpoint));
  }

  question = "name indication";
  if (sedb_yes_or_no(question,default_answer)) {
    bp->name_flag = 1;
    sedb_get_string(question,bp->name);
    default_answer = 0;
  }
  else {
    bp->name_flag = 0;
  }

  question = "file indication";
  if (sedb_yes_or_no(question,default_answer)) {
    bp->file_flag = 1;
    sedb_get_string(question,bp->file);
    default_answer = 0;
  }
  else {
    bp->file_flag = 0;
  }

  if (sedb_yes_or_no("line range",default_answer)) {
    do {
      again=0;
      bp->line_flag = 1;
      bp->line_minimum = sedb_get_int("line minimum",0);
      bp->line_maximum = sedb_get_int("line maximum",bp->line_minimum);
      if (bp->line_maximum < bp->line_minimum) {
        sedb_message("Bad line range [%d,%d].(Try again.)\n",
                     bp->line_minimum,bp->line_maximum);
        again = 1;
      }
    } while (again);
    default_answer = 0;
  }
  else {
    bp->line_flag = 0;
  }

  question = "stack limit";
  if (sedb_yes_or_no(question,default_answer)) {
    bp->stack_flag = 1;
    bp->stack_limit = sedb_get_int(question,10);
    bp->stack_automatic = sedb_yes_or_no("automatic incrementation of the limit",1);
    default_answer = 0;
  }
  else {
    bp->stack_flag = 0;
  }

  bp->next = NULL;
  sedb_message("Here is the breakpoint you have just defined:\n");
  if (!sedb_view_breakpoint(bp)) {
    sedb_message("\tNot a breakpoint (no condition selected).\n");
    result = NULL;
  }
  else if (sedb_yes_or_no("Confirm this breakpoint",1)) {
    result = bp;
  }
  else {
    result = NULL;
  }

  /* Confirm the breakpoint: */
  bp->confirmed = (result != NULL);

  return result;
}

static int sedb_string_match(char* indication, char* frame) {
  int i1 = 0; int i2 = 0; int result = 0;  char c1, c2;
  int again = 1;
  while (again) {
    c1 = indication[i1];
    c2 = frame[i2];
    if (c1 == '\0') {
      result = 1;
      again = 0;
    }
    else if (c2 == '\0') {
      result = 0;
      again = 0;
    }
    else if (c1 != c2) {
      i2 = i2 - i1 + 1;
      i1 = 0;
    }
    else {
      i1++; i2++;
    }
  }
  return result;
}

static int sedb_breakpoint_match(se_dump_stack*ds, int l, int f,
                                 int breakpointNumber, se_breakpoint* bp) {
  /* Does this `bp' match the current point. */
  int StackSize;
  int stack_automatic = 0;

  if (bp->stack_flag) {
    StackSize = se_stack_size(ds);
    if (StackSize > 0 && StackSize < bp->stack_limit) return 0;
    fprintf(stderr, "StackSize=%d\n", StackSize);
    stack_automatic = bp->stack_automatic;
  }
  if (bp->line_flag) {
    if (l < bp->line_minimum) return 0;
    if (l > bp->line_maximum) return 0;
  }
  if (bp->name_flag) {
    se_frame_descriptor* fd = ds->fd;
    if (fd == NULL) return 0;
    if (fd->name == NULL) return 0;
    if (!sedb_string_match(bp->name,fd->name)) return 0;
  }
  if (bp->file_flag) {
    if (p[f] == NULL) return 0;
    if (!sedb_string_match(bp->file,p[f])) return 0;
  }
  sedb_message("Breakpoint #%d reached.\n",breakpointNumber);
  sedb_view_breakpoint(bp);
  if (stack_automatic) {
    bp->stack_limit = StackSize+1;
  }
  return 1;
}

static void sedb_launch_garbage_collector(void) {
#ifdef SE_GC_LIB
  int bytes, used;
  bytes = gc_memory_used();
  sedb_message("GC is running...\n");
  gc_start();
  used = gc_memory_used();
  bytes -= used;
  sedb_message("GC done (%d byte%s freed, %d byte%s used).\n",
               bytes, (bytes > 1 ? "s" : ""),
               used, (used > 1 ? "s" : ""));
#else
  sedb_message("This system is not equipped with the SmartEiffel garbage collector.\n");
#endif
}

static void sedb_show_gc_info(void) {
#ifdef SE_GC_LIB
  int bytes;
  bytes = gc_memory_used();
  sedb_message("Using %d byte%s (GC is %s).\n",
               bytes, (bytes > 1 ? "s" : ""),
               gc_is_off ? "off" : "on");
#else
  sedb_message("This system is not equipped with the SmartEiffel garbage collector.\n");
#endif
}

static void sedb_force_exit(int exit_arg) {
  /*
    Note: the only one place where exit() is called.
  */
  sedb_status = SEDB_EXIT_MODE; /* Because of a possible atexit() call, we
                                   must set this flag here. */
  exit(exit_arg);
}

/* ---------------------------------------------------------------------- */
/* sedb interface */

/* Returning from that command makes the program continue. */
void sedb(se_dump_stack*ds, se_position position, char info_code) {
  /*
    Meaning for "info_code":
       'N' at Instruction level (the n command)
       'S' at expression level (the s command)
       'X' just before the eXit of the enclosing function
       'K' from the sedb_break C function
  */
  ds->p = position; /* Update the stack information. */
  if (se_general_trace_switch) { /* The GENERAL.trace_switch is set: */
    switch(sedb_status) {
    case SEDB_RUNNING_STATUS:
      _sedb_running_status(ds,position);
      break;
    case SEDB_RUNNING_IGNORE_BREAKPOINTS:
      _sedb_running_ignore_breakpoints(ds,position);
      break;
    case SEDB_STEP_BY_STEP:
      _sedb_running_status(ds,position);
      _sedb_step_by_step(ds,position);
      break;
    case SEDB_FINISH_CMD:
      _sedb_running_status(ds,position);
      if ((ds == sedb_previous_ds) && (info_code == 'X')) {
        sedb_show_point(ds, se_position2line(position), se_position2column(position), se_position2path_id(position));
        strcpy(sedb_last_command,"f");
        sedb_status = SEDB_WAITING_KBD;
        _sedb_waiting_kbd(ds, position);
      }
      break;
    case SEDB_NEXT_CMD:
      _sedb_running_status(ds,position);
      if ((ds == sedb_previous_ds) && ((info_code == 'N') || (info_code == 'X'))) {
        sedb_show_point(ds,se_position2line(position) ,se_position2column(position), se_position2path_id(position));
        strcpy(sedb_last_command,"n");
        sedb_status = SEDB_WAITING_KBD;
        _sedb_waiting_kbd(ds, position);
      }
      break;
    case SEDB_START_STATUS:
      _sedb_start_status(ds,position);
      break;
    case SEDB_WAITING_KBD:
      _sedb_waiting_kbd(ds,position);
      break;
    case SEDB_TRACE_FILE:
      _sedb_trace_file(ds,position);
      break;
    case SEDB_EXIT_MODE:
      break;
    }
  }
}

void sedb_signal_handler(int sig) {
  FILE* out = sedb_output();
  sedb_in_signal_handler = 1;
  handle(SE_HANDLE_SEDB_BREAK, NULL);
  if (sedb_yes_or_no("Abort execution (\"no\" returns to sedb)",0)) {
    if (sedb_trace_file != NULL) {
      fclose(sedb_trace_file);
    }
    sedb_force_exit(EXIT_SUCCESS);
  }
  else {
    sedb_signal_raised = 1;
    sedb_status = SEDB_WAITING_KBD;
    if (sedb_in_read_line) {
      sedb_message("Please press <Enter> to return to sedb.\n"); /* will return to sedb_read_line_in() */
    }
    else {
      sedb_message("Back to sedb.\n");
    }
    fflush(out);
  }
  handle(SE_HANDLE_SEDB_CONTINUE, NULL);
  sedb_in_signal_handler = 0;
}

void sedb_break(se_dump_stack*ds,se_position position) {
  sedb_status = SEDB_WAITING_KBD;
  strcpy(sedb_last_command,".");
  if (ds != NULL) {
    if (position != 0) {
      sedb(ds,position, 'K');
    }
    else {
      sedb(ds,ds->p, 'K');
    }
  }
}

void sedb_breakpoint(se_dump_stack*ds,se_position position) {
  if (sedb_status != SEDB_RUNNING_IGNORE_BREAKPOINTS) {
    if (position != 0 ) {
      int li = se_position2line(position);
      int co = se_position2column(position);
      int fi = se_position2path_id(position);

      sedb_message("sedb_breakpoint in "
                   "file \"%s\" (line %d column %d).\n",p[fi],li,co);
    }
    sedb_break(ds,position);
  }
}

/* ---------------------------------------------------------------------- */
/* internal sedb handling */

static void _sedb_running_status(se_dump_stack*ds, se_position position) {
  if (breakpoint_list != NULL) {
    se_breakpoint* bpl = breakpoint_list;
    int nb = 1;
    int found = 0;
    while (bpl != NULL && !found) {
      int li = se_position2line(position);
      int co = se_position2column(position);
      int fi = se_position2path_id(position);
      if (sedb_breakpoint_match(ds,li,fi,nb,bpl)) {
        sedb_show_point(ds,li,co,fi);
        sedb_status = SEDB_WAITING_KBD;
        _sedb_waiting_kbd(ds, position);
        found = 1;
      }
      else {
        nb ++;
        bpl = bpl->next;
      }
    }
  }
}

static void _sedb_running_ignore_breakpoints(se_dump_stack*ds, se_position position) {
  /* do nothing */
}

static void _sedb_step_by_step(se_dump_stack*ds, se_position position) {
  int li = se_position2line(position);
  int co = se_position2column(position);
  int fi = se_position2path_id(position);
  sedb_show_point(ds,li,co,fi);
  strcpy(sedb_last_command,"s");
  sedb_status = SEDB_WAITING_KBD;
  _sedb_waiting_kbd(ds, position);
}

static void _sedb_start_status(se_dump_stack*ds, se_position position) {
  sedb_status = SEDB_WAITING_KBD;
  strcpy(sedb_last_command,"?");
  sedb_on_line_help(NULL);
  _sedb_waiting_kbd(ds,position);
}

static void _sedb_waiting_kbd(se_dump_stack*ds, se_position position) {
  FILE* out = sedb_output();

  static char line_buffer[SEDB_BUFMAX];

  int read_again, parse_again, first, eval_again;
  int nb;
  char* line;

  int li = se_position2line(position);
  int co = se_position2column(position);
  int fi = se_position2path_id(position);

  se_dump_stack* plus_minus = ds;
  se_breakpoint* bpl;
  se_breakpoint* bp;

  handle(SE_HANDLE_SEDB_BREAK, NULL);

  do {
    int i;
    int cc = '\0';

    line = line_buffer;
    parse_again = 1;
    read_again = 0;
    sedb_signal_raised = 0;

    sedb_read_line_in(line, 0, NULL);

    first = 1;

    do {
      if (first) {
        first = 0;
      }
      else {
#ifndef SEDB_NAMED_PIPES
        sedb_printf(out,"sedb> %s\n",line);
#else
        sedb_printf(out,"%s\n",line);
#endif
      }

      parse_again = 0;
      eval_again = 0;

      cc = line[0];
      switch(cc) {

        /* -------------------- Empty command line: repeat command */
      case '\0':
        line = line_buffer;
        strcpy(line,sedb_last_command);
        parse_again = 1;
        break;

        /* -------------------- Trim the leading spaces */
      case ' ':
      case '\t':
        line++;
        parse_again = 1;
        break;

        /* -------------------- Help */
      case '?':
      case 'h':
        strcpy(sedb_last_command,line);
        sedb_on_line_help(line);
        read_again = 1;
        break;

        /* -------------------- More help */
      case 'H':
        strcpy(sedb_last_command,line);
        sedb_on_line_more_help();
        strcpy(sedb_last_command,"?");
        read_again = 1;
        break;

        /* -------------------- View the stack trace */
      case 'S':
        strcpy(sedb_last_command,line);
        se_print_run_time_stack_in(out, ds, plus_minus,
                                   sedb_yes_or_no("Compact view of the stack", 1));
        fflush(out);
        read_again = 1;
        break;

        /* -------------------- Up in the stack trace (i.e., go to the caller) */
      case 'u':
        strcpy(sedb_last_command,line);
        if (plus_minus->caller == NULL) {
          sedb_show_point_frame(plus_minus);
          sedb_message("Top of the stack reached.\n");
        }
        else {
          plus_minus = plus_minus->caller;
          sedb_show_point_frame(plus_minus);
        }
        read_again = 1;
        break;

        /* -------------------- Down in the stack trace (i.e., go to the callee) */
      case 'd':
        strcpy(sedb_last_command,line);
        if (plus_minus == ds) {
          sedb_show_point_frame(plus_minus);
          sedb_message("This is the current point (bottom of the stack).\n");
        }
        else {
          se_dump_stack* plus = ds;
          while (plus->caller != plus_minus) {
            plus = plus->caller;
          }
          plus_minus = plus;
          sedb_show_point_frame(plus_minus);
        }
        read_again = 1;
        break;

        /* -------------------- Step-in */
      case 's':
        strcpy(sedb_last_command,line);
        sedb_status = SEDB_STEP_BY_STEP;
        break;

        /* -------------------- Step-over */
      case 'n':
        strcpy(sedb_last_command,line);
        sedb_previous_ds = ds;
        sedb_status = SEDB_NEXT_CMD;
        break;

        /* -------------------- Finish the current feature */
      case 'f':
        strcpy(sedb_last_command,line);
        sedb_previous_ds = ds;
        sedb_status = SEDB_FINISH_CMD;
        break;

        /* -------------------- Quit now */
      case 'Q':
        sedb_force_exit(EXIT_SUCCESS);
        break;

        /* -------------------- Quit with confirmation */
      case 'q':
        if (sedb_yes_or_no("Really quit",0)) {
          sedb_message("Bye.\n");
          sedb_force_exit(EXIT_SUCCESS);
        }
        else {
          read_again = 1;
        }
        break;

        /* -------------------- Show the current point */
      case '.':
        strcpy(sedb_last_command,line);
        /*sedb_show_point(ds,li,co,fi);*/
        sedb_show_point_frame(plus_minus);
        if (plus_minus->caller == NULL) {
          sedb_message("Top of the stack reached.\n");
        }
        else if (plus_minus == ds) {
          sedb_message("This is the current point (bottom of the stack).\n");
        }
        read_again = 1;
        break;

        /* -------------------- Start the GC */
      case 'G':
        strcpy(sedb_last_command,line);
        sedb_launch_garbage_collector();
        read_again = 1;
        break;

        /* -------------------- Show GC info */
      case 'g':
        strcpy(sedb_last_command,line);
        sedb_show_gc_info();
        read_again = 1;
        break;

        /* -------------------- Continue to the next breakpoint */
      case 'c':
        /* If "cd .." is used then replace with up ;-) */
        if ((line[1] == 'd') && (line[3] == '.')) {
          sedb_message("Use up, 'c' means continue.\n");
          line[0] = 'u'; line[1] = 0;
          parse_again = 1;
        } else {
          strcpy(sedb_last_command,line);
          sedb_message("Running...\n");
          sedb_status = SEDB_RUNNING_STATUS;
        }
        break;

        /* -------------------- Continue, ignore breakpoints */
      case 'C':
        strcpy(sedb_last_command,line);
        sedb_message("Running...\n");
        sedb_status = SEDB_RUNNING_IGNORE_BREAKPOINTS;
        break;

        /* -------------------- Set a breakpoint here */
      case 'b':
        bpl = breakpoint_list;
        bp  = sedb_get_new_breakpoint();
        if (bp != NULL) {
          strcpy(sedb_last_command,"B");
          bp->next = NULL;
          if (bpl == NULL) {
            breakpoint_list = bp;
          }
          else {
            while (bpl->next != NULL) {
              bpl = bpl->next;
            }
            bpl->next = bp;
          }
        }
        read_again = 1;
        break;

        /* -------------------- Display the breakpoints list */
      case 'B':
        strcpy(sedb_last_command,line);
        bpl = breakpoint_list;
        nb = 1;
        if (bpl == NULL) {
          sedb_message("No breakpoints defined.\n");
        }
        else {
          sedb_message("Breakpoints:\n");
          while (bpl != NULL) {
            sedb_printf(out,"\t#%d:\n",nb);
            sedb_view_breakpoint(bpl);
            bpl = bpl-> next;
            nb ++;
          }
        }
        read_again = 1;
        break;

        /* -------------------- Delete one or more breakpoints */
      case '-':
        strcpy(sedb_last_command,line);
        bpl = breakpoint_list;
        if (bpl == NULL) {
          sedb_message("No breakpoint to delete.\n");
        }
        else {
          nb = 0;
          for (i = 1; line[i] == ' ' ; i++){};
          while (nb >= 0 && line[i] != '\0') {
            cc = line[i++];
            if (('0' <= cc) && (cc <= '9'))
              nb = (nb * 10) + (cc - '0');
            else {
              nb = -1;
            }
          }
          if (nb == 1) {
            breakpoint_list = breakpoint_list->next;
            strcpy(sedb_last_command,"B");
          }
          else if (nb > 1) {
            i = 2;
            while ((bpl->next != NULL) && (i < nb)) {
              bpl = bpl->next;
              i++;
            }
            if (i != nb) {
              sedb_message("No breakpoint #%d to delete.\n",nb);
            }
            else {
              bpl->next = bpl->next->next;
              strcpy(sedb_last_command,"B");
            }
          }
          else {
            int del = 0;
            while (!del && breakpoint_list != NULL) {
              sedb_view_breakpoint(breakpoint_list);
              if (sedb_yes_or_no("delete this one",0)) {
                breakpoint_list = breakpoint_list->next;
              }
              else {
                del = 1;
              }
            }
            if ((bpl = breakpoint_list) != NULL) {
              while (bpl->next != NULL) {
                sedb_view_breakpoint(bpl->next);
                if (sedb_yes_or_no("delete this one",0))
                  bpl->next = bpl->next->next;
                else {
                  bpl = bpl->next;
                }
              }
            }
          }
        }
        strcpy(sedb_last_command,"B");
        read_again = 1;
        break;

        /* -------------------- Switch to the trace mode */
      case 'T':
        strcpy(sedb_last_command,line);
        sedb_message("Switching to trace mode may create a huge \"trace.se\" file.\n");
        if (breakpoint_list != NULL) {
          sedb_message("Switching to trace mode also disables breakpoints.\n");
        }
        if (sedb_yes_or_no("Write the execution trace in \"trace.se\" file",0)) {
          sedb_status = SEDB_TRACE_FILE;
          if (sedb_trace_file == NULL) {
            sedb_trace_file = fopen("trace.se","w");
          }
        }
        break;

        /* -------------------- Evaluate an expression */
      case 'p':
        eval_again = 1;
      case 'e':
        line++;
        while (*line == ' ') line++;
        _sedb_eval(plus_minus, line, eval_again);
        read_again = 1;
        break;

        /* -------------------- Unknown command... */
      default:
        sedb_message("\"%s\": unknown command. Type ? for help.\n",line);
        parse_again = 0;
        read_again = 1;
      }
    } while (parse_again);
  } while (read_again);

  handle(SE_HANDLE_SEDB_CONTINUE, NULL);
}

static void _sedb_trace_file(se_dump_stack*ds, se_position position) {
  int li = se_position2line(position);
  int co = se_position2column(position);
  int fi = se_position2path_id(position);

  sedb_printf(sedb_trace_file,"line %d column %d in %s\n",li,co,p[fi]);
  fflush(sedb_trace_file);
}

/* ---------------------------------------------------------------------- */
/* expression evaluation */

static void* sedb_find_name(se_dump_stack* ds, char* name, int* type, int* expanded) {

  se_frame_descriptor* fd = ds->fd;
  int i = 0;
  int local_count = 0;
  char* local_format;
  int id, found;
  void** var;
  void* result;
  char localname[SEDB_BUFMAX];

  *expanded =  0;
  *type     = -1;

  if (fd != NULL && ds->p != 0) {
    local_format = fd->local_format;
    if (!strcmp("Current",name)) {
      if (fd->use_current) {
        i = 2;
        id = 0;
        while (local_format[i] != '%') {
          id = (id * 10) + (local_format[i] - '0');
          i++;
        }
        *type = id;
        result = ds->current;
      }
    }
    else {
      found=0;
      if (fd->use_current) {
        /* skip Current */
        i = 2;
        id = 0;
        while (local_format[i] != '%') {
          id = (id * 10) + (local_format[i] - '0');
          i++;
        }
        i++;
        /* se_introspecT[id] cannot be NULL because Current's type is always known */
        result = se_introspecT[id](ds->current, name, type, expanded);
        if (*type == -1) {
          result = NULL;
        }
        else {
          found = 1;
        }
      }
      while (!found && local_count < fd->local_count) {
        *localname = '\0';
        while (local_format[i] != '%') {
          append_in(localname, local_format[i]);
          i++;
        }
        i++;
        *expanded = (local_format[i++] == 'E');
        id = 0;
        while (local_format[i] != '%') {
          id = (id * 10) + (local_format[i] - '0');
          i++;
        }
        i++;
        if (!strcmp(name,localname)) {
          if (ds->locals != NULL) {
            result = var = (ds->locals)[local_count];
          }
          *type = id;
          found = 1;
        }
        local_count++;
      }
      if (!found) {
        *type = -1;
      }
      else if (!*expanded && se_introspecT[id] == NULL) {
        /* find the correct id (the found id is a class not at run time; find the correct heir id) */
        if (result == NULL) {
          sedb_message("There is a bug in SmartEiffel (sorry): no result available in that frame\n");
          found = 0;
          *type = -1;
        }
        else if (*(T0**)result != NULL) {
          *type = (*(T0**)result)->id;
        }
      }
    }
  }

  return result;
}

static void _sedb_eval(se_dump_stack*ds, char* expr, int eval_again) {
  FILE* out = sedb_output();

  static char evalexp[SEDB_BUFMAX];

  void *obj, *prev_obj;
  int id, prev_id, exp, prev_exp, end;
  char *attrib, *next, *previous, *keep;

  end = strlen(expr) - 1;
  while ((end >= 0) && (expr[end] == ' ')) end--;
  expr[end+1] = '\0';

  if (!eval_again && expr[0] == '.') {
    /* 'e' command beginning with a dot is treated as a 'p' */
    eval_again = 1;
  }

  if (eval_again) {
    /* evaluation continuation */
    if (expr[0] == '\0') {
      strncpy(evalexp, sedb_eval_expression, SEDB_BUFMAX);
    }
    else {
      int len = strlen(sedb_eval_expression);
      if (expr[0] != '.') {
        sedb_message("Adding missing leading dot.\n");
      }
      else {
        while ((expr[0] == '.')&&(expr[1] == '.')) { /* go "up" */
          if (len == 0) {
            sedb_message("Too many 'up'. Extra ones ignored.\n");
            while (expr[0] == '.') expr++;
            break;
          }
          while ((len>0) && (sedb_eval_expression[--len] != '.'));
          sedb_eval_expression[len] = '\0';
          expr += 2;
        }
        if (expr[0] == '.') expr++;
      }
      if ((expr[0] != '\0') && (len > 0)){
        sedb_eval_expression[len++] = '.';
        sedb_eval_expression[len] = '\0';
      }
      if (len + strlen(expr) + 1 > SEDB_BUFMAX) {
        sedb_message("The line is too long; it will be truncated.\n");
        expr[SEDB_BUFMAX - len - 1] = '\0';
      }
      sprintf(evalexp, "%s%s", sedb_eval_expression, expr);
    }
    sedb_message("e %s\n", evalexp);
  }
  else {
    /* new evaluation */
    if (expr[0] == '.') {
      sedb_message("Ignoring leading dot%s.\n", expr[1] == '.' ? "s" : "");
      while (expr[0] == '.') expr++;
      next = strchr(evalexp, '.');
    }
    strncpy(evalexp, expr, SEDB_BUFMAX);
  }
  /* save the resulting eval expression */
  if (evalexp[0] != '\0') {
    strncpy(sedb_eval_expression, evalexp, SEDB_BUFMAX);
  }

  previous = NULL;
  prev_id  = -1;
  prev_exp = 0;
  prev_obj = NULL;

  attrib = evalexp;
  next = strchr(evalexp, '.');
  if (next == NULL) {
    obj = sedb_find_name(ds, evalexp, &id, &exp);
    keep = evalexp;
  }
  else {
    *next='\0';
    next++;
    obj = sedb_find_name(ds, evalexp, &id, &exp);
    previous = evalexp;
    for (attrib = next; obj != NULL && id != -1 && attrib != NULL; attrib=next) {
      keep     = previous;
      previous = attrib;
      prev_id  = id;
      prev_exp = exp;
      prev_obj = obj;

      next = strchr(next, '.');
      if (next != NULL) {
        *next = '\0';
        next++;
      }

      if (*(T0**)obj == NULL) {
        sedb_message("%s.%s is Void.\n", keep, attrib);
        obj = NULL;
      } else if (se_introspecT[id] == NULL) {
        sedb_message("No known introspection function for id %d (%s.%s)\n", id, keep, attrib);
        obj = NULL;
        id = -1;
      } else {
        obj = se_introspecT[id](obj, attrib, &id, &exp);
        if (!exp && se_introspecT[id] == NULL) {
          /* find the correct id (the found id is a class not at run time; find the correct heir id) */
          if (obj == NULL) {
            sedb_message("There is a bug in SmartEiffel (sorry): no object available in %s.%s\n", keep, attrib);
            id = -1;
          }
          else if (*(T0**)obj != NULL) {
            id = (*(T0**)obj)->id;
          } else {
            id = -1;
          }
        }
      }
    }
  }

  if (id == -1) {
    if (previous == NULL) {
      sedb_message("Unknown attribute or local %s\n", keep);
      obj = sedb_find_name(ds, "Current", &id, &exp);
      if (id == -1 || obj == NULL) {
        sedb_message("Current is not accessible.\n");
      }
      else {
        char* attr = se_atT[id];
        if (attr == NULL) {
          sedb_message("Current has no live attributes.\n");
        }
        else {
          sedb_message("The live attributes of Current are: %s\n", attr);
        }
      }
    }
    else {
      char* attr = se_atT[prev_id];
      sedb_message("Unknown attribute %s of %s\n", previous, keep);
      if (attr == NULL) {
        sedb_message("%s has no live attributes.\n", keep);
      }
      else {
        sedb_message("The live attributes of %s are: %s\n", keep, attr);
      }
    }
    next = NULL;
    obj = NULL;
  }
  else {
    if (obj == NULL) {
      sedb_message("That value is not yet computed.");
    }
    else if (exp) {
      if (se_prinT[id] == NULL) {
        sedb_message("There is a bug in SmartEiffel (sorry): no print function available for expanded <%d>@%p\n",
                     id, obj);
      }
      else {
        se_prinT[id](out, obj);
      }
    }
    else if (*((void**)obj) == NULL) {
      sedb_printf(out, "Void");
    }
    else if (se_prinT[(*((T0**)obj))->id] == NULL) {
      sedb_message("There is a bug in SmartEiffel (sorry): no print function available for <%d>@%p\n",
                   (*((T0**)obj))->id, (*((T0**)obj)));
    }
    else {
      se_prinT[(*((T0**)obj))->id](out, obj);
    }
    sedb_printf(out, "\n");
  }
}
