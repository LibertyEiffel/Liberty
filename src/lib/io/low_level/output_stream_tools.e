-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class OUTPUT_STREAM_TOOLS
   --
   -- OUTPUT_STREAM implementation. Only OUTPUT_STREAM can inherit from this class.
   --

insert
   STRING_HANDLER

feature {ANY}
   put_character (c: CHARACTER)
      require
         is_connected
         not is_filtered and then can_put_character(c)
      deferred
      end

   flush
         -- Flushes the pipe. If `is_filtered', calls the filter's
         -- `flush' instead.
      require
         is_connected
      deferred
      end

   can_put_character (c: CHARACTER): BOOLEAN
      deferred
      end

   is_filtered: BOOLEAN
      deferred
      end

   is_connected: BOOLEAN
      deferred
      end

feature {ABSTRACT_STRING}
   put_natively_stored_string (s: NATIVELY_STORED_STRING)
      require
         s /= Void
      do
         put_abstract_string(s)
      end

   put_abstract_string (s: ABSTRACT_STRING)
      require
         s /= Void
      local
         i, count: INTEGER
      do
         from
            i := 1
            count := s.count
         until
            i > count
         loop
            put_character(s.item(i))
            i := i + 1
         end
      end

feature {ANY}
   put_string (s: ABSTRACT_STRING)
         -- Output `s' to current output device.
      require
         is_connected
         not is_filtered
         s /= Void
      do
         s.print_on(as_output_stream)
      end

   put_unicode_string (unicode_string: UNICODE_STRING)
         -- Output the UTF-8 encoding of the `unicode_string'.
      require
         is_connected
         not is_filtered
         unicode_string /= Void
      do
         tmp_string.clear_count
         unicode_string.utf8_encode_in(tmp_string)
         put_string(tmp_string)
      end

   put_line (s: ABSTRACT_STRING)
         -- Output the string followed by a '%N'.
      do
         put_string(s)
         put_new_line
      end

feature {ANY} -- To write a number:
   frozen put_integer (i: INTEGER_64)
         -- Output `i' to current output device.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         i.append_in(tmp_string)
         put_string(tmp_string)
      end

   frozen put_integer_format (i: INTEGER_64; s: INTEGER)
         -- Output `i' to current output device using at most `s' character.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         i.append_in_format(tmp_string, s)
         put_string(tmp_string)
      end

   frozen put_natural_8 (n: NATURAL_8)
         -- Output `n' to current output device.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in(tmp_string)
         put_string(tmp_string)
      end

   frozen put_natural_8_format (n: NATURAL_8; s: INTEGER)
         -- Output `n' to current output device using at most `s' character.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in_format(tmp_string, s)
         put_string(tmp_string)
      end

   frozen put_natural_16 (n: NATURAL_16)
         -- Output `n' to current output device.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in(tmp_string)
         put_string(tmp_string)
      end

   frozen put_natural_16_format (n: NATURAL_16; s: INTEGER)
         -- Output `n' to current output device using at most `s' character.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in_format(tmp_string, s)
         put_string(tmp_string)
      end

   frozen put_natural_32 (n: NATURAL_32)
         -- Output `n' to current output device.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in(tmp_string)
         put_string(tmp_string)
      end

   frozen put_natural_32_format (n: NATURAL_32; s: INTEGER)
         -- Output `n' to current output device using at most `s' character.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in_format(tmp_string, s)
         put_string(tmp_string)
      end

   frozen put_natural_64 (n: NATURAL_64)
         -- Output `n' to current output device.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in(tmp_string)
         put_string(tmp_string)
      end

   frozen put_natural_64_format (n: NATURAL_64; s: INTEGER)
         -- Output `n' to current output device using at most `s' character.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         n.append_in_format(tmp_string, s)
         put_string(tmp_string)
      end

   put_real (r: REAL)
         -- Output `r' to current output device.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         r.append_in(tmp_string)
         put_string(tmp_string)
      end

   put_real_format (r: REAL; f: INTEGER)
         -- Output `r' with only `f' digit for the fractional part.
         -- Examples:
         --    put_real(3.519,2) print "3.51".
      require
         is_connected
         not is_filtered
         f >= 0
      do
         tmp_string.clear_count
         r.append_in_format(tmp_string, f)
         put_string(tmp_string)
      end

   put_real_scientific (r: REAL; f: INTEGER)
         -- Output `r' using the scientific notation with only `f' digit for the fractional part.
         -- Examples:
         --    put_real_scientific(3.519,2) print "3.16e+00".
      require
         is_connected
         not is_filtered
         f >= 0
      do
         tmp_string.clear_count
         r.append_in_scientific(tmp_string, f)
         put_string(tmp_string)
      end

   put_number (number: NUMBER)
         -- Output the `number'.
      require
         is_connected
         not is_filtered
         number /= Void
      do
         tmp_string.clear_count
         number.append_in(tmp_string)
         put_string(tmp_string)
      end

feature {ANY} -- Other features:
   put_boolean (b: BOOLEAN)
         -- Output `b' to current output device according
         -- to the Eiffel format.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         b.append_in(tmp_string)
         put_string(tmp_string)
      end

   put_pointer (p: POINTER)
         -- Output a viewable version of `p'.
      require
         is_connected
         not is_filtered
      do
         tmp_string.clear_count
         p.append_in(tmp_string)
         put_string(tmp_string)
      end

   put_new_line
         -- Output a newline character.
      require
         is_connected
         not is_filtered
      do
         put_character('%N')
      end

   put_spaces (nb: INTEGER)
         -- Output `nb' spaces character.
      require
         is_connected
         not is_filtered
         nb >= 0
      local
         count: INTEGER
      do
         from
         until
            count >= nb
         loop
            put_character(' ')
            count := count + 1
         end
      end

   append_file (file_name: STRING)
      require
         is_connected
         not is_filtered
         ;(create {FILE_TOOLS}).is_readable(file_name)
      local
         c: CHARACTER
      do
         tmp_file_read.connect_to(file_name)
         from
            tmp_file_read.read_character
         until
            tmp_file_read.end_of_input
         loop
            c := tmp_file_read.last_character
            put_character(c)
            tmp_file_read.read_character
         end
         tmp_file_read.disconnect
      end

feature {}
   as_output_stream: OUTPUT_STREAM
      deferred
      ensure
         yes_indeed_it_is_the_same_object: Result.to_pointer = to_pointer
      end

feature {}
   tmp_file_read: TEXT_FILE_READ
      once
         create Result.make
      end

   tmp_string: STRING
      once
         create Result.make(512)
      end

feature {}
   io_putc (byte: CHARACTER; stream: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_putc"
         }"
      end

   io_fwrite (buf: NATIVE_ARRAY[CHARACTER]; size: INTEGER; stream: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fwrite"
         }"
      end

   io_flush (stream: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_flush"
         }"
      end

end -- class OUTPUT_STREAM_TOOLS
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
