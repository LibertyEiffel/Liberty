-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class USER_INTERFACE

insert
   NCURSES_HANDLER

feature {ANY}
   run_curses (app: UI_APPLICATION)
         -- Create a new Curses user interface and run an internal stack
      local
         stack: LOOP_STACK
      do
         create stack.make
         start_curses(app, stack)
      end

   start_curses (app: UI_APPLICATION; stack: LOOP_STACK)
         -- Create a new Curses user interface, add it to the provided stack, *and* run the stack.
         -- (The loop stack is controlled by the ncurses framework)
      local
         nt: NCURSES_TOOLS
         job: CURSES_JOB
      do
         nt.ncurses.set_loop_stack(stack)
         create job.connect(app)
         job.start
      end

   run_readline (app: UI_APPLICATION)
         -- Create a new GNU Readline user interface and run an internal stack
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack_readline(app, stack)
         stack.run
      end

   stack_readline (app: UI_APPLICATION; stack: LOOP_STACK)
         -- Create a new GNU Readline user interface and add it to the provided stack
      local
         job: READLINE_JOB
      do
         create job.connect(app, agent stack.add_job)
         stack.add_job(job)
      end

   run_web (app: UI_APPLICATION)
         -- Create a new Web user interface (actually a web server) and run an internal stack
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack_web(app, stack)
         stack.run
      end

   stack_web (app: UI_APPLICATION; stack: LOOP_STACK)
         -- Create a new Web user interface (actually a web server) and add it to the provided stack
      local
         job: WEB_JOB
      do
         create job.connect(app, agent stack.add_job)
         stack.add_job(job)
      end

end -- class USER_INTERFACE
--
-- Copyright (C) 2012-2018: Cyril ADRIAN <cyril.adrian@gmail.com>.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
