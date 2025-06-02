/*
 * -- ------------------------------------------------------------------------------------------------------------
 *  -- Copyright notice below. Please read.
 *  --
 *  -- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
 *  -- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
 *  --
 *  -- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN, Pierre-Nicolas CLAUSS
 *  --
 *  -- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 *  -- documentation files (the "Software"), to deal in the Software without restriction, including without
 *  -- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 *  -- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
 *  -- conditions:
 *  --
 *  -- The above copyright notice and this permission notice shall be included in all copies or substantial
 *  -- portions of the Software.
 *  --
 *  -- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
 *  -- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
 *  -- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 *  -- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 *  -- OR OTHER DEALINGS IN THE SOFTWARE.
 *  --
 *  -- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
 *  -- ------------------------------------------------------------------------------------------------------------
 *  */


extern void* se_malloc(size_t);

static int break_count = 0;

static void ncurses_handler(se_handler_action_t action, void*data) {
   switch(action) {
   case SE_HANDLE_RUNTIME_ERROR:
   case SE_HANDLE_NO_MORE_MEMORY:
      endwin();
      break;
   case SE_HANDLE_SEDB_BREAK:
   case SE_HANDLE_ENTER_PRINT_STACK:
      if (break_count++ == 0) {
         endwin();
      }
      break;
   case SE_HANDLE_SEDB_CONTINUE:
   case SE_HANDLE_EXIT_PRINT_STACK:
      if (--break_count == 0) {
         refresh();
      }
      break;
   default:
      /* nothing */
      break;
   }
}

void init_screen(void) {
   initscr();
   register_handler(ncurses_handler);
}

/* The functions below are mostly used as wrapper for handling ncurses *getyx macros and char* reading */


int wgetwidth(void* win) {
   int x, y;
   getmaxyx((WINDOW*)win, y, x);
   return x;
}


int wgetheight(void* win) {
   int x, y;
   getmaxyx((WINDOW*)win, y, x);
   return y;
}


int wgetleft(void* win) {
   int x, y;
   getparyx((WINDOW*)win, y, x);
   if (x == -1) {
      getbegyx((WINDOW*)win, y, x);
   }
   return x;
}


int wgettop(void* win) {
   int x, y;
   getparyx((WINDOW*)win, y, x);
   if (y == -1) {
      getbegyx((WINDOW*)win, y, x);
   }
   return y;
}


char* mvwreadstring(void* win, int size, int x, int y) {
   char* line = (char*)se_malloc(size * sizeof(char));
   if (mvwgetnstr((WINDOW*)win, y, x, line, size) == ERR) {
      return NULL;
   }
   return line;
}


int wgetcursorx(void* win) {
   int x, y;
   getyx((WINDOW*)win, y, x);
   return x;
}


int wgetcursory(void* win) {
   int x, y;
   getyx((WINDOW*)win, y, x);
   return y;
}


char* mvwgetstring(void* win, int size, int x, int y) {
   char* line = (char*)se_malloc(size * sizeof(char));
   if (mvwinnstr((WINDOW*)win, y, x, line, size) == ERR) {
      return NULL;
   }
   return line;
}

void touchwin_(void* win) {
   touchwin((WINDOW*)win);
}
