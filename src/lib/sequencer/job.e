-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class JOB
   --The job's life will looks like :
   --   do
   --      prepare
   --      if is_ready then
   --         continue
   --   repeat while not done
   --
   -- If the same job has to live again, restart is called.
   --
   -- Note: never change a job's priority after inserting it in loop_item.
   --       Priority should only be set at creation time.
   --

insert
   PLATFORM

feature {JOB, LOOP_ITEM}
   priority: INTEGER
         -- never change a job's priority after inserting it in loop_item.
         -- Priority should only be set at creation time.

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
         -- Use `events' to describe condition that make this job ready to `continue'.
         -- `events' describe the conditions to be satisfied before
         -- running this job for one more step.
      require
         events /= Void
         not events.queryable
         not done
      deferred
      end

   is_ready (events: EVENTS_SET): BOOLEAN
         -- Check if this job is ready to continue his work.
         -- `events' describe the events which occurred.
      require
         events /= Void
         events.queryable
         not done
      deferred
      end

   continue
         -- Continue to do the job.
         -- The work to do has to be small work and non blocking, it
         -- will continue on next call.
      require
         not done
      deferred
      end

   done: BOOLEAN
         -- `done' returns `True' when the job is finished. Then the
         -- job may be `restart'(ed) if it needs to run again.
      deferred
      end

   restart
         -- Configure the job like in its initial state.
         -- Example: when some window dialog appears a second time, all
         -- jobs from this window are restarted.
      require
         done
      deferred
      ensure
         not done
      end

   infix "<" (other: JOB): BOOLEAN
      do
         Result := priority < other.priority
      end

invariant
   priority /= Minimum_integer

end -- class JOB
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
