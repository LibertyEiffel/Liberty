class EXAMPLE4
   -- This example shows that you can enter a new loop and when it
   -- terminates, the halted loop continues. Loops are managed on a stack.
   -- This is like opening some modal window, others elements from the
   -- interface don't work until the modal window is closed.
   -- NOTE: in real life applications, jobs will probably be complex. In
   -- this case you have to write a class for that job, inheriting from
   -- BACKGROUND_JOB or PERIODIC_JOB instead of just using SIMPLE_* versions.

create {ANY}
   make

feature {}
   ls: LOOP_STACK

   counter: INTEGER

   make
      do
         create ls.make
         ls.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent work1, Void, 1))
         ls.run
      end

   work1: BOOLEAN
      do
         io.put_integer(counter)
         io.put_new_line
         counter := counter + 1
         if counter = 5 then
            io.put_string("Starting %"modal%" code%N")
            ls.new_loop
            -- This new loop will stop when all it's jobs are done.
            -- The loop can be stopped using 'ls.break' for example
            -- if the 'Cancel' button in the modal window is pressed.

            ls.add_job(create {SIMPLE_BACKGROUND_JOB}.set_work(agent work2, Void, 1))
            io.put_string("The new loop is ready.%N")
         end

         Result := counter < 10
      end

   close: BOOLEAN

   work2: BOOLEAN
      do
         io.put_string("Modal work%N")
         if close then
            io.put_string("Stop modal%N")
            Result := False
         else
            close := True
            Result := True
         end
      end

end -- class EXAMPLE4
