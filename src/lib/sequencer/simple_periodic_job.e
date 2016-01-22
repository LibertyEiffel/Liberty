-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class SIMPLE_PERIODIC_JOB
   -- Pseudo periodic job. The timing is not exact : the time between
   -- two execution may be longer than the given period depending on
   -- time needed to execute ready tasks. There is no try to recover the
   -- time lost each time.

inherit
   PERIODIC_JOB

create {ANY}
   set_work

feature {ANY}
   set_work (t: like task; tr: like task_restart; prio: INTEGER; seconds: like period)
         -- t has to return True while continue
      require
         t /= Void
         prio /= Minimum_integer
         seconds > 0
      do
         task := t
         task_restart := tr
         priority := prio
         period := seconds
         next_time.update
         next_time := next_time + period
      ensure
         priority = prio
         period = seconds
      end

feature {LOOP_ITEM}
   done: BOOLEAN

   continue
      local
         cont: BOOLEAN
      do
         -- BUG : done := not task.item([]);
         cont := task.item([])
         done := not cont
      end

   restart
      do
         if task_restart /= Void then
            task_restart.call([])
         end
         done := False
      end

feature {}
   task: PREDICATE[TUPLE]

   task_restart: PROCEDURE[TUPLE]

end -- class SIMPLE_PERIODIC_JOB
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
