-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STANDARD_STREAMS
   --
   -- Thanks to this `standard_streams' singleton object, you can redirect `std_input_stream',
   -- `std_output_stream' as well as `std_error_stream'.
   --
   -- See also the examples from our tutorial/io directory.
   --

insert
   SINGLETON
      rename io as any_io,
         std_input as any_std_input,
         std_output as any_std_output,
         std_error as any_std_error
      end

create {ANY}
   make

feature {ANY}
   std_input: INPUT_STREAM

   std_output: OUTPUT_STREAM

   std_error: OUTPUT_STREAM

feature {ANY}
   set_std_input (a_std_input: like std_input)
      require
         a_std_input.is_connected
      do
         std_input := a_std_input
      end

   restore_std_input
      do
         set_std_input(any_std_input)
      end

   set_std_output (a_std_output: like std_output)
      require
         a_std_output.is_connected
      do
         std_output := a_std_output
      end

   restore_std_output
      do
         set_std_output(any_std_output)
      end

   set_std_error (a_std_error: like std_error)
      require
         a_std_error.is_connected
      do
         std_error := a_std_error
      end

   restore_std_error
      do
         set_std_error(any_std_error)
      end

feature {}
   make
      do
         restore_std_input
         restore_std_output
         restore_std_error
      end

end -- class STANDARD_STREAMS
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
