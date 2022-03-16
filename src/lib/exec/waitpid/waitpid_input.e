-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WAITPID_INPUT
   --
   -- A specific input stream that gathers child process exit status.
   -- It must be created at most once.
   --
   -- If this stream is created then exiting children will send data in this channel.
   --
   -- Each child sends exactly one empty line, plus "out-of-band" information containing the child PID and its
   -- exit status.
   --

inherit
   TERMINAL_INPUT_STREAM
      undefine
         is_equal
      redefine
         can_disconnect, valid_last_character
      end

insert
   SINGLETON

create {PROCESS_WAIT}
   make

feature {ANY}
   is_connected: BOOLEAN True
   can_disconnect: BOOLEAN False

   disconnect
      do
         check False end
      end

   can_unread_character: BOOLEAN
      do
         Result := index > 0
      end

   valid_last_character: BOOLEAN
      do
         Result := index <= upper
      end

   end_of_input: BOOLEAN False

   pid: INTEGER
      require
         has_oob_info
      do
         Result := oob_info_pid.first
      end

   status: INTEGER
      require
         has_oob_info
      do
         Result := oob_info_status.first
      end

   has_oob_info: BOOLEAN
      do
         Result := not oob_info_status.is_empty
      end

   drop_oop_info
      do
         oob_info_pid.remove_first
         oob_info_status.remove_first
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := basic_exec_waitpid_fd
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         check False end
      end

   filtered_has_stream_pointer: BOOLEAN False

   filtered_read_character
      do
         if index < upper then
            index := index + 1
         else
            read_buffer
         end
      end

   filtered_unread_character
      do
         index := index - 1
      end

   filtered_last_character: CHARACTER
      do
         Result := buffer.item(index)
      end

feature {}
   make
      do
         buffer := buffer.calloc(128)
         create oob_info_pid.make(1, 0)
         create oob_info_status.make(1, 0)
         basic_exec_waitpid_init(Current)
      end

   buffer: NATIVE_ARRAY[CHARACTER]
   index, upper: INTEGER

   oob_info_pid: RING_ARRAY[INTEGER]
   oob_info_status: RING_ARRAY[INTEGER]

   set_oob_info (a_pid, a_status: INTEGER)
      do
         debug ("waitpid")
            std_error.put_line("OOB info: pid=#(1) status=#(2)" # a_pid.out # a_status.out)
         end
         oob_info_pid.add_last(a_pid)
         oob_info_status.add_last(a_status)
      end

   read_buffer
      do
         upper := basic_exec_waitpid_read_buffer(buffer.to_external) - 1
         index := 0
      end

   basic_exec_waitpid_read_buffer (data: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_waitpid_read_buffer"
         }"
      end

   basic_exec_waitpid_fd: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_waitpid_fd()"
         }"
      end

   basic_exec_waitpid_init (obj: WAITPID_INPUT)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_waitpid_init"
         }"
      end

invariant
   upper >= -1
   index.in_range(0, upper + 1)
   oob_info_pid.count = oob_info_status.count

end -- WAITPID_INPUT
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
