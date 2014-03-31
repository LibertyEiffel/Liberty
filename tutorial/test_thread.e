class TEST_THREAD

-- Threads example.

create {}
   make

feature {}
   ready_lock, io_lock: THREAD_LOCK
   ready: BOOLEAN

   make is
      local
         t: THREAD[STRING, TUPLE[STRING]]
         c: THREAD_CONTEXT[STRING, TUPLE]
      do
         create ready_lock
         create io_lock
         create t.make(agent in_thread(?))
         c := t.start(["yeah!"])
         if c.is_started then
            from
               ready_lock.lock
            until
               ready
            loop
               io_lock.lock
               io.put_line("waiting...")
               io_lock.unlock

               ready_lock.wait
            end
            ready_lock.unlock

            c.wait

            io_lock.lock
            io.put_string("Thread finished with status: ")
            io.put_line(c.status)
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
            io.put_line("thread computing... " + i.out)
            io_lock.unlock

            c_inline_h("#include <poll.h>%N")
            c_inline_c("poll(NULL,0,250);%N");

            ready_lock.lock
            ready := i = 0
            ready_lock.notify_all
            ready_lock.unlock
            i := i - 1
         end
         Result := "Awright cap'n!"

         io_lock.lock
         io.put_line("thread done!")
         io_lock.unlock
      end

end
