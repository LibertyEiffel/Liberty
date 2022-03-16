-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READLINE_CONTEXT

create {READLINE_JOB}
   make

feature {ANY}
   line: TRAVERSABLE[STRING]
      do
         Result := line_
      end

   read (a_prompt: STRING): STRING
      local
         stream: READLINE_INPUT_STREAM
      do
         create stream.make_no_history

         from
            stream.set_prompt(a_prompt)
            Result := ""
            stream.read_line
         until
            stream.end_of_input
         loop
            Result.append(stream.last_string)
            Result.extend('%N')
            stream.read_line
         end
         Result.append(stream.last_string)
         std_output.put_new_line
      end

feature {}
   make (a_line: STRING)
      require
         a_line /= Void
      do
         create line_.with_capacity(2)
         a_line.split_in(line_)
      end

   line_: FAST_ARRAY[STRING]

invariant
   line /= Void

end -- class READLINE_CONTEXT
--
-- Copyright (C) 2012-2022: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
