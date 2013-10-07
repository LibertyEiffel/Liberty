class EXAMPLE2
   -- Second exemple that show how to do multiple cooperative jobs in
   -- parallel. The job is created with inline create and paramter is
   -- given to the job.

create {ANY}
   make

feature {}
   lm: LOOP_STACK

   counter: INTEGER

   make is
      do
         create lm.make
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R-"), Void, 1))
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R/"), Void, 1))
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R|"), Void, 1))
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R\"), Void, 1))
         lm.run
      end

   running (s: STRING): BOOLEAN is
      do
         io.put_string(s)
         io.flush
         counter := counter + 1
         if counter \\ 100000 = 0 then
            io.put_string("%Ncounter = ")
            io.put_integer(counter)
            io.put_new_line
         end

         Result := True
      end

end -- class EXAMPLE2
