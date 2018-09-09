-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PIPE_OUTPUT
   --
   -- The "output" side of a pipe. It's an INPUT_STREAM ;-)
   --

inherit
   TERMINAL_INPUT_STREAM
      redefine
         valid_last_character
      end

insert
   PIPE_FUNCTIONS

create {ANY}
   make, connect_to, named

feature {ANY}
   connect_to (a_input: like input)
      require
         a_input.is_new
      do
         input := a_input
         a_input.handshake(Current)
         data := a_input.data
         is_connected := data /= default_pointer
         valid_last_character := True
      end

   is_connected: BOOLEAN

   disconnect
      do
         basic_exec_pipe_in_disconnect(data)
         is_connected := False
      end

   input: PIPE_INPUT

   is_new: BOOLEAN
      do
         Result := data = default_pointer
      end

   can_unread_character: BOOLEAN

   end_of_input: BOOLEAN

   valid_last_character: BOOLEAN

   has_error: BOOLEAN
      require
         is_connected
      local
         s: POINTER
      do
         s := basic_exec_pipe_error(data)
         Result := s /= default_pointer
      end

   error: STRING
      require
         is_connected
         has_error
      do
         Result := once ""
         Result.from_external_copy(basic_exec_pipe_error(data))
      end

   set_read_failure_controler (a_controler: like read_failure_controler)
      require
         not is_connected
      do
         read_failure_controler := a_controler
      ensure
         read_failure_controler = a_controler
      end

feature {PIPE_INPUT, PROCESS}
   data: POINTER

feature {PIPE_INPUT}
   handshake (a_input: like input)
      require
         a_input.is_new
      do
         input := a_input
         data := basic_exec_pipe_create
         is_connected := data /= default_pointer
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := basic_exec_pipe_in_fd(data)
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         check False end
      end

   filtered_has_stream_pointer: BOOLEAN False

   filtered_read_character
      local
         ok, noread: BOOLEAN; n: INTEGER
      do
         if unread_flag then
            switch_unread
            unread_flag := False
            can_unread_character := True
         elseif read_failure_controler /= Void then
            from
            until
               ok
            loop
               n := basic_exec_pipe_read(data, False)
               debug
                  std_error.put_line(once "*** " + n.out)
               end
               if n < 0 then
                  if basic_exec_pipe_again(data) then
                     noread := read_failure_controler.item([True])
                     ok := noread
                  else
                     end_of_input := True
                     noread := True
                     ok := True
                  end
               elseif n = 0 then
                  noread := read_failure_controler.item([False])
                  ok := noread
               else
                  ok := True
               end
            end
            if not noread then
               if valid_last_character then
                  unread_char := filtered_last_character
               end
               filtered_last_character := basic_exec_pipe_read_character(data)
               valid_last_character := True
            end
         else
            if valid_last_character then
               unread_char := filtered_last_character
               can_unread_character := True
            end
            n := basic_exec_pipe_read(data, True)
            if n > 0 then
               filtered_last_character := basic_exec_pipe_read_character(data)
               valid_last_character := True
               can_unread_character := True
            elseif n = 0 then
               valid_last_character := False
            else
               end_of_input := True
               valid_last_character := False
            end
         end
      end

   filtered_unread_character
      do
         switch_unread
         unread_flag := True
         can_unread_character := False
      end

   filtered_last_character: CHARACTER

feature {}
   make
      do
      end

   named (path: STRING; a_controler: like read_failure_controler)
      require
         path /= Void
      do
         read_failure_controler := a_controler
         data := basic_exec_pipe_in_named(path.to_external)
         is_connected := data /= default_pointer
         valid_last_character := True
      end

   unread_char: CHARACTER
   unread_flag: BOOLEAN

   switch_unread
      local
         c: CHARACTER
      do
         c := filtered_last_character
         filtered_last_character := unread_char
         unread_char := c
      end

   read_failure_controler: PREDICATE[TUPLE[BOOLEAN]]

end -- PIPE_OUTPUT
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
