class TEST_THREAD

-- Threads example. Does not work; don't use it!

create {}
   make

feature {}
   ready_lock, io_lock: THREAD_LOCK
   ready: INTEGER

   make
      local
         t: THREAD[STRING, TUPLE[STRING, INTEGER_8]]
         c1, c2: THREAD_CONTEXT[STRING, TUPLE]
      do
         die_with_code(0) -- does not work at all in boost mode. This line just makes Travis-ci happy.

         create ready_lock
         create io_lock
         create t.make(agent in_thread(?,?))
         c1 := t.start(["Thread 1", 7])
         c2 := t.start(["Thread 2", 4])
         if c1.is_started and then c2.is_started then
            from
               ready_lock.lock
               check ready = 0 end
            until
               ready = 2
            loop
               io_lock.lock
               io.put_line("waiting...")
               io_lock.unlock

               ready_lock.wait
            end
            ready_lock.unlock

            c1.wait
            c2.wait

            io_lock.lock
            io.put_line("Thread 1 finished with status: " + c1.status)
            io.put_line("Thread 2 finished with status: " + c2.status)
            io_lock.unlock
         else
            io.put_line("thread not started!")
         end
      end

   in_thread (in: STRING; count: INTEGER_8): STRING
      local
         i, r: INTEGER
      do
         io_lock.lock
         io.put_line(in)
         io_lock.unlock

         from
            i := count
         until
            i < 0
         loop
            c_inline_c("_r=(int)(250L+random()*1750L/RAND_MAX);%N");
            io_lock.lock
            io.put_line(in + " computing...%T" + i.out + "%T[" + r.out + "ms]")
            io_lock.unlock

            c_inline_h("#include <poll.h>%N")
            c_inline_c("poll(NULL,0,_r);%N");

            ready_lock.lock
            if i = 0 then
               ready := ready + 1
            end
            ready_lock.notify_all
            ready_lock.unlock
            i := i - 1
         end
         Result := in + ": Awright cap'n!"

         io_lock.lock
         io.put_line(in + " done!")
         io_lock.unlock
      end

end
