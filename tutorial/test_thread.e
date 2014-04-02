class TEST_THREAD

-- Threads example.

create {}
   make

feature {}
   ready_lock, io_lock: THREAD_LOCK
   ready: INTEGER

   make is
      local
         t: THREAD[STRING, TUPLE[STRING]]
         c1, c2: THREAD_CONTEXT[STRING, TUPLE]
      do
         create ready_lock
         create io_lock
         create t.make(agent in_thread(?))
         c1 := t.start(["Thread 1"])
         c2 := t.start(["Thread 2"])
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

   in_thread (in: STRING): STRING is
      local
         i: INTEGER
      do
         io_lock.lock
         io.put_line(in)
         io_lock.unlock

         from
            i := 10
         until
            i < 0
         loop
            io_lock.lock
            io.put_line(in + " computing... " + i.out)
            io_lock.unlock

            c_inline_h("#include <poll.h>%N")
            c_inline_c("poll(NULL,0,250);%N");

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
