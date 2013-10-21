class EXAMPLE3
   -- This example show how to use periodic jobs.
   -- The user will see rolling stick, it's position will change 10
   -- times per second. Evry 3 seconds the program print the progress report.

create {ANY}
   make

feature {}
   lm: LOOP_STACK

   counter2: INTEGER

   counter: INTEGER

   old_counter: INTEGER

   time: MICROSECOND_TIME

   make is
      do
         time.update
         create lm.make
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent do_count, Void, 1))
         lm.add_job(create {SIMPLE_PERIODIC_JOB}.set_work(agent running, Void, 1, 0.1))
         lm.add_job(create {SIMPLE_PERIODIC_JOB}.set_work(agent progress_print, Void, 0, 3))
         lm.run
      end

   do_count: BOOLEAN is
      do
         counter := counter + 1
         Result := True
      end

   running: BOOLEAN is
      local
         s: STRING
      do
         inspect
            counter2 \\ 4
         when 0 then
            s := "%R-"
         when 1 then
            s := "%R/"
         when 2 then
            s := "%R|"
         when 3 then
            s := "%R\"
         end
         io.put_string(s)
         io.flush
         counter2 := counter2 + 1
         Result := True
      end

   progress_print: BOOLEAN is
      local
         now: MICROSECOND_TIME
      do
         io.put_string("%Rcounter = ")
         io.put_integer(counter)
         io.put_string(", work done = ")
         io.put_integer(counter - old_counter)
         io.put_string(", elapsed time : ")
         now.update
         io.put_real(time.elapsed_seconds(now))
         time := now
         io.put_new_line
         old_counter := counter
         Result := True
      end

end -- class EXAMPLE3
