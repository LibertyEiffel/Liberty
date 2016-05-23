class EXAMPLE1
   -- Simple example that show how to do multiple cooperative jobs in parallel.

create {ANY}
   make

feature {}
   lm: LOOP_STACK

   counter: INTEGER

   continue: BOOLEAN

   make
      local
         job1, job2: SIMPLE_BACKGROUND_JOB
      do
         create lm.make
         create job1.set_work(agent work1, Void, 1)
         create job2.set_work(agent work2, Void, 1)
         lm.add_job(job1)
         lm.add_job(job2)
         continue := True
         lm.run
      end

   work1: BOOLEAN
      do
         io.put_integer(counter)
         io.put_new_line
         counter := counter + 1
         if counter > 5 then
            continue := False
         end

         Result := continue
      end

   work2: BOOLEAN
      do
         io.put_string("Hello !%N")
         Result := continue
      end

end -- class EXAMPLE1
