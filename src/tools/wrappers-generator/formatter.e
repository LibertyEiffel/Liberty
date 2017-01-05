class FORMATTER
   -- A STRING_FORMATTER class using a buffer string as output.
   -- Strings and messages can be easily appended with `append' and
   -- `put_message'.
   -- The formatted content can be printed on streams with `print_on' and
   -- appended to other strings with `append_on'

inherit
   STRING_FORMATTER
      redefine default_create, out, print_on
      end

create {ANY}
   default_create

feature {ANY}
   clear, reset
         -- Clears the content of Current's buffer.
      do
         if buffer.is_empty then
            debug
               std_error.put_line(once "Unnecessary invocation of FORMATTER.reset")
               -- That's way too verbose print_run_time_stack
            end
         else
            buffer.clear_count
         end
      end

   reset_with (a_string: STRING)
         -- Overwrite the content of Current's buffer with a copy of `a_string'.
      do
         buffer.copy(a_string)
      end

   out: STRING
         -- A newly create copy of Current content
      do
         create Result.copy(buffer)
      end

   append (a_string: ABSTRACT_STRING)
         -- Append `a_string' to the content of Current
      do
         buffer.append(a_string)
      end

   append_new_line
         -- Append a new line to Current
      do
         buffer.append(once "%N")
      end

   append_on (a_string: STRING)
         -- Append the content of Current to `a_string'
      require
         a_string /= Void
      do
         a_string.append(buffer)
      end

   print_on (a_stream: OUTPUT_STREAM)
         -- Put current content on `a_stream'
      do
         a_stream.put_string(buffer)
         reset
      ensure
         is_empty
      end

   is_empty: BOOLEAN
         -- Is current empty?
      do
         Result := buffer.is_empty
      end

   count: INTEGER
         -- Content length
      do
         Result := buffer.count
      end

   default_create
      do
         create buffer.make_empty
      end

   put (c: CHARACTER)
      do
         buffer.append_character(c)
      end

feature {} -- Implementation
   put_item (item: ABSTRACT_STRING)
      do
         buffer.append(item.out)
      end

   buffer: STRING

end -- class FORMATTER
-- Copyright (C) 2008-2017: ,2009 Paolo Redaelli
-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
