-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PROCESS
   --
   -- This class allows one to spawn an external process and make it execute some file.
   --
   -- The standard streams of the process are available: `input', `output' and `error'.
   --
   -- '''Note:''' This class is in a beta stage. POSIX and Windows versions are available but there may be
   -- resource leaks or other bugs left.
   --

inherit
   PROCESS_RUNNER
   HASHABLE

feature {ANY}
   id: INTEGER
      require
         is_connected
         not is_child
      deferred
      end

   is_child: BOOLEAN
      deferred
      end

   is_connected: BOOLEAN
      require
         not is_child
      deferred
      end

   is_finished: BOOLEAN
      require
         is_connected
         not is_child
      deferred
      end

   status: INTEGER
      require
         is_finished
         not is_child
      deferred
      end

   wait
      require
         is_connected
         not is_child
      deferred
      ensure
         is_finished
         input /= Void implies not input.is_connected
         output /= Void implies not output.is_connected
         error /= Void implies not error.is_connected
      end

   duplicate
         -- Duplicate the running process so that two processes are running simultaneously with the same code
         -- and starting from the same data (inspired from the fork(2) POSIX call)
      require
         is_ready
      deferred
      end

   input: OUTPUT_STREAM
         -- You can feed data to the process by this channel
      require
         not is_child
      deferred
      end

   output: INPUT_STREAM
         -- You can read data from the process by this channel
      require
         not is_child
      deferred
      end

   error: INPUT_STREAM
         -- You can read error data from the process by this channel
      require
         not is_child
      deferred
      end

   group: PROCESS_GROUP

   set_group (group_: like group)
      require
         group_ /= Void
      do
         group := group_
      ensure
         group = group_
      end

   is_ready: BOOLEAN
      do
         Result := (is_connected implies is_finished)
            and then (input /= Void implies not input.is_connected)
            and then (output /= Void implies not output.is_connected)
            and then (error /= Void implies not error.is_connected)
      ensure
         Result = ((is_connected implies is_finished)
                   and then (input /= Void implies not input.is_connected)
                   and then (output /= Void implies not output.is_connected)
                   and then (error /= Void implies not error.is_connected))
      end

   direct_input: BOOLEAN
         -- Is the program's input stream read directly from the
         -- standard input stream rather than from `input'?

   set_direct_input (direct_input_: like direct_input)
      do
         direct_input := direct_input_
      ensure
         direct_input = direct_input_
      end

   direct_output: BOOLEAN
         -- Is the program's output stream sent directly to the
         -- standard output stream rather than to `output'?

   set_direct_output (direct_output_: like direct_output)
      do
         direct_output := direct_output_
      ensure
         direct_output = direct_output_
      end

   direct_error: BOOLEAN
         -- Is the program's error stream sent directly to the
         -- standard error stream rather than to `error'?

   set_direct_error (direct_error_: like direct_error)
      do
         direct_error := direct_error_
      ensure
         direct_error = direct_error_
      end

   hash_code: INTEGER
      do
         Result := to_pointer.hash_code
      end

feature {}
   cleanup_streams
      do
         if input /= Void and then input.is_connected then
            input.disconnect
         end
         if output /= Void and then output.is_connected then
            output.disconnect
         end
         if error /= Void and then error.is_connected then
            error.disconnect
         end
      end

end -- class PROCESS
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
