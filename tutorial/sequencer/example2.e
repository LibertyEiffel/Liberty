class EXAMPLE2
   -- Second example that show how to do multiple cooperative jobs in
   -- parallel. The job is created with inline create and parameter
   -- given to the job.

create {ANY}
   make

feature {}
   lm: LOOP_STACK

   counter: INTEGER

   make
      do
         create lm.make
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R-"), Void, 1))
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R/"), Void, 1))
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R|"), Void, 1))
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent running("%R\"), Void, 1))
         lm.run
      end

   running (s: STRING): BOOLEAN
      do
         io.put_string(s)
         io.flush
         counter := counter + 1
         if counter \\ 100 = 0 then
            io.put_string("%Ncounter = ")
            io.put_integer(counter)
            io.put_new_line
         end

         Result := counter < 1000
      end

end -- class EXAMPLE2
