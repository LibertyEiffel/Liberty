-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PROCESS_SCHEDULER

inherit
   PROCESS_RUNNER

create {ANY}
   make

feature {ANY}
   execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN)
      local
         p: PROCESS; launch_info: PROCESS_LAUNCH_INFO
      do
         p := new_process
         launch_info := processes.reference_at(p)
         if launch_info = Void then
            create launch_info.execute(program, arguments, keep_environment)
            processes.add(launch_info, p)
         else
            launch_info.execute(program, arguments, keep_environment)
         end
         process_count := process_count + 1
         p.execute(program, arguments, keep_environment)
         post_launch(p, launch_info)
      end

   execute_command_line (command_line: STRING; keep_environment: BOOLEAN)
      local
         p: PROCESS; launch_info: PROCESS_LAUNCH_INFO
      do
         p := new_process
         launch_info := processes.reference_at(p)
         if launch_info = Void then
            create launch_info.execute_command_line(command_line, keep_environment)
            processes.add(launch_info, p)
         else
            launch_info.execute_command_line(command_line, keep_environment)
         end
         process_count := process_count + 1
         p.execute_command_line(command_line, keep_environment)
         post_launch(p, launch_info)
      end

   is_ready: BOOLEAN
      do
         Result := maximum_process_count >= 1
      ensure
         Result = (maximum_process_count >= 1)
      end

   set_parallel_process_count (parallel_process_count_: like parallel_process_count)
      require
         parallel_process_count_ >= 1
      do
         parallel_process_count := parallel_process_count_.min(group.capacity)
         wait_until(process_count)
      ensure
         parallel_process_count.in_range(0, parallel_process_count_)
      end

   wait
      do
         wait_until(0)
      ensure
         process_count = 0
      end

   maximum_process_count: INTEGER
      do
         Result := parallel_process_count
         if is_serial then
            Result := Result.min(1)
         end
      ensure
         is_serial implies Result = parallel_process_count.min(1)
         (not is_serial) implies Result = parallel_process_count
      end

   parallel_process_count: INTEGER
         -- How many processes can run concurrently in a parallel session.

   process_count: INTEGER
         -- How many processes are currently running.

   is_serial: BOOLEAN
         -- Are processes currently launched sequentially rather than concurrently.

   set_parallel
      do
         if is_serial then
            wait
         end
         is_serial := False
      end

   set_serial
      do
         wait_until(1)
         is_serial := True
      end

feature {ANY}
   register_on_launched (on_launched_: like on_launched)
      do
         on_launched := on_launched_
      ensure
         on_launched = on_launched_
      end

   register_on_failed (on_failed_: like on_failed)
      do
         on_failed := on_failed_
      ensure
         on_failed = on_failed_
      end

   register_on_finished (on_finished_: like on_finished)
      do
         on_finished := on_finished_
      ensure
         on_finished = on_finished_
      end

feature {}
   on_launched: PROCEDURE[TUPLE[STRING, STRING, TRAVERSABLE[STRING], BOOLEAN]]

   on_failed: like on_launched

   on_finished: PROCEDURE[TUPLE[INTEGER, STRING, STRING, TRAVERSABLE[STRING], BOOLEAN]]

   post_launch (process: PROCESS; launch_info: PROCESS_LAUNCH_INFO)
      local
         callback: like on_launched
      do
         if process.is_connected then
            callback := on_launched
         else
            callback := on_failed
         end
         if callback /= Void then
            callback.call([launch_info.command_line,
                           launch_info.program,
                           launch_info.arguments,
                           launch_info.keep_environment])
         end
      end

   wait_until (process_count_: like process_count)
      require
         process_count_ >= 0
      local
         p: PROCESS; i: INTEGER
      do
         from
            i := process_count - process_count_
         until
            i <= 0
         loop
            p := wait_process
            i := i - 1
         end
      ensure
         process_count <= process_count_
      end

feature{}
   processes: HASHED_DICTIONARY[PROCESS_LAUNCH_INFO, PROCESS]

   factory: PROCESS_FACTORY

   group: PROCESS_GROUP
      do
         Result := factory.group
      end

   new_process: PROCESS
      do
         if process_count < maximum_process_count then
            Result := factory.create_process
         else
            Result := wait_process
         end
      end

   wait_process: PROCESS
      local
         launch_info: PROCESS_LAUNCH_INFO
      do
         Result := group.wait
         if on_finished /= Void then
            launch_info := processes.at(Result)
            on_finished.call([Result.status,
                              launch_info.command_line,
                              launch_info.program,
                              launch_info.arguments,
                              launch_info.keep_environment])
         end
         process_count := process_count - 1
      ensure
         Result /= Void
      end

   make
      do
         create processes.make
         factory.set_direct_input(True)
         factory.set_direct_output(True)
         factory.set_direct_error(True)
         parallel_process_count := group.capacity.min(1)
      end

invariant
   process_count.in_range(0, maximum_process_count)

end -- class PROCESS_SCHEDULER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
