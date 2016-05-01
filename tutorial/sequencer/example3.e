class EXAMPLE3
   -- This example show how to use periodic jobs.
   -- The user will see rolling stick, it's position will change 10
   -- times per second. Every 3 seconds the program print the progress report.

create {ANY}
   make

feature {}
   lm: LOOP_STACK

   counter2: INTEGER

   counter: INTEGER

   old_counter: INTEGER

   time: MICROSECOND_TIME

   make
      do
         time.update
         create lm.make
         lm.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent do_count, Void, 1))
         lm.add_job(create {SIMPLE_PERIODIC_JOB}.set_work(agent running, Void, 1, 0.5))
         lm.add_job(create {SIMPLE_PERIODIC_JOB}.set_work(agent progress_print, Void, 0, 3))
         lm.run
      end

   done: BOOLEAN

   do_count: BOOLEAN
      do
         counter := counter + 1
         Result := not done
      end

   running: BOOLEAN
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
         Result := not done
      end

   progress_print: BOOLEAN
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
         done := counter > 10000
         Result := not done
      end

end -- class EXAMPLE3
