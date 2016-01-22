-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOOP_ITEM
   -- One loop level with related jobs to run

insert
   ANY
   PLATFORM

create {LOOP_STACK}
   make

feature {LOOP_STACK}
   job_list: FAST_ARRAY[JOB]

feature {}
   finished_jobs: FAST_ARRAY[JOB]

   ready_jobs: FAST_ARRAY[JOB]

   events: EVENTS_SET

   make
      do
         create job_list.make(0)
         create finished_jobs.make(0)
         create ready_jobs.make(0)
         create events.make
         pause := True
      ensure
         pause
         not break
      end

feature {LOOP_STACK}
   pause: BOOLEAN

   break: BOOLEAN

   run
      require
         pause and not break
      local
         i: INTEGER; selected_priority: INTEGER
         job: JOB
      do
         from
            pause := False
            break := False
         until
            pause or else break or else job_list.is_empty
         loop
            -- prepare jobs
            from
               i := job_list.lower
               events.reset
            variant
               job_list.upper - i
            until
               i > job_list.upper
            loop
               job := job_list.item(i)
               if job.done then
                  job_list.remove(i)
                  finished_jobs.add_last(job)
               else
                  job.prepare(events)
                  i := i + 1
               end
            end
            if not job_list.is_empty then
               -- wait for something to do
               events.wait
               -- search ready jobs (with same priority as the first ready job)
               from
                  i := job_list.lower
                  selected_priority := Minimum_integer
                  ready_jobs.clear_count
               until
                  i > job_list.upper or else selected_priority /= Minimum_integer
               loop
                  job := job_list.item(i)
                  if job.is_ready(events) then
                     selected_priority := job.priority
                     ready_jobs.add_last(job)
                  end
                  i := i + 1
               end
               from
               until
                  i > job_list.upper or else job_list.item(i).priority /= selected_priority
               loop
                  job := job_list.item(i)
                  if job.is_ready(events) then
                     ready_jobs.add_last(job)
                  end
                  i := i + 1
               end
               -- run selected ready jobs
               from
                  i := ready_jobs.upper
               until
                  i < ready_jobs.lower
               loop
                  ready_jobs.item(i).continue
                  i := i - 1
               end
            end
         end
      ensure
         pause or job_list.is_empty or break
      end

   break_loop
      do
         break := True
      ensure
         break
      end

   pause_loop
      require
         not pause
      do
         pause := True
      ensure
         pause
      end

   add_job (j: JOB)
      require
         j /= Void
      local
         i: INTEGER
      do
         from
            i := job_list.lower
         until
            i > job_list.upper or else job_list.item(i).priority > j.priority
         loop
            i := i + 1
         end
         job_list.add(j, i)
      end

   restart
      require
         not pause or break
      do
         from
         until
            finished_jobs.is_empty
         loop
            finished_jobs.last.restart
            add_job(finished_jobs.last)
            finished_jobs.remove_last
         end
         pause := True
         break := False
      ensure
         pause
         not break
      end

end -- class LOOP_ITEM
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
