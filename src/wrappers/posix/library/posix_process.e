deferred class POSIX_PROCESS
   -- A process as described in the POSIX standard.
   -- Commands and queries of this class are loosely modelled after the
   -- multiprocessing API of Python
   -- (http://docs.python.org/library/multiprocessing.html).

insert
   ERRNO
   MULTIPROCESSING
      rename 
         wait as posix_wait
      end
   EXCEPTIONS

feature {ANY}
   child_process_id: like process_id

   is_child: BOOLEAN
      do
         Result := child_process_id /= 0
      end

   is_parent: BOOLEAN
      do
         Result := child_process_id = -1
      end

   is_started: BOOLEAN
      do
         Result := child_process_id /= 0
      end

   not_started: BOOLEAN
      do
         Result := child_process_id = 0
      end

   start
         -- Create the new process and make it run
      require
         not_started
      local
         err: like errno
      do
         child_process_id := fork
         err := errno
         if child_process_id = 0 then
            -- executed by the child process
            run
            die_with_code(exit_success_code)
         elseif child_process_id = -1 then
            -- something went wrong
            
            -- This if clause should be an inspect but eagain and enomem are
            -- not recognized as constants
            if err=eagain then
               raise_exception(No_more_memory)
            elseif err=enomem then
               raise_exception(No_more_memory)
            end
         else
            -- executed by the father process
            debug
               std_error.put_line("I'm the parent process " + process_id.out)
            end
         end
      end

   run
         -- The command that will be executed in the child process
      deferred
      end

  wait
      -- Wait until Current has terminated
      --
      -- TODO: add support for options of Posix's waitpid
   local pid_t: like process_id
   do
      pid_t := waitpid(child_process_id,$status,0)
   end

   terminate
         -- Send SIGTERM signal to the child process.
      require is_parent
      do
         if is_parent then
           not_yet_implemented 
         end
      end

feature {ANY} -- Status queries

   is_running: BOOLEAN
      do
         not_yet_implemented
      end

   status: INTEGER
      -- 
 
end -- class POSIX_PROCESS
