-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HTTP_CLIENT_INPUT_STREAM
   --
   -- Some ideas and first draft of this class kindly provided by Serge Romanchenko [mailto:se@sir.nensi.net]
   --

inherit
   FILTER_INPUT_STREAM
      redefine
         end_of_input
      end

create {HTTP_PROTOCOL}
   connect_to

feature {ANY}
   end_of_input: BOOLEAN
      do
         Result := state = the_end
      end

feature {HTTP_PROTOCOL}
   start
      local
         key, value, low_value: STRING
      do
         read_word_using(once "/")
         if last_string.is_equal(once "HTTP") then
            read_word_using(once " ")
            if protocol = Void then
               protocol := ""
            end
            protocol.copy(once "HTTP/")
            protocol.append(last_string)
            read_word_using(once " ")
            if return_code = Void then
               return_code := ""
            end
            return_code.copy(last_string)
            skip_remainder_of_line
            state := in_headers
         else
            std_error.put_string("ERROR: Malformed HTTP header%N")
            die_with_code(1)
         end
         from
            key := once ""
            value := once ""
            low_value := once ""
            if header = Void then
               create header.make
            else
               header.clear_count
            end
         until
            state = error or state = the_end or state = in_body
         loop
            inspect
               state
            when in_headers then
               read_word_using(once ":")
               key.copy(last_string)
               read_character
               read_line
               value.copy(last_string)
               if value.count > 0 and then value.last = '%R' then
                  value.remove_last
               end
               key.to_lower

               inspect
                  key
               when "content-length" then
                  len := value.to_integer
               when "transfer-encoding" then
                  low_value.copy(value)
                  low_value.to_lower
                  if low_value.is_equal("chunked") then
                     chunked := True
                  end
               when "content-encoding" then
                  low_value.copy(value)
                  low_value.to_lower
                  if low_value.is_equal("gzip") then
                     gzipped := True
                  else
                     state := error
                  end
               else
               end
               -- in all cases, record the header
               header.put(key.twin, value.twin) --|*** memory leak

               read_character
               if end_of_input then
                  state := the_end
               elseif last_character = '%R' then
                  read_character
                  if end_of_input then
                     state := the_end
                  else
                     state := in_body
                  end
               else
                  unread_character
               end
            end
         end
      end

   header: HASHED_DICTIONARY[STRING, STRING]

   return_code: STRING

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      local
         c: CHARACTER
      do
         stream.filtered_read_character
         if not stream.end_of_input then
            c := stream.filtered_last_character
            if state = in_body then
               read_body_character(c)
            else
               filtered_last_character := c
            end
         end
      end

   filtered_unread_character
      do
         stream.filtered_unread_character
      end

   filtered_last_character: CHARACTER

feature {}
   read_body_character (c: CHARACTER)
      local
         buffer: STRING; end_of_line: BOOLEAN; cc: CHARACTER
      do
         if chunked and then len = 0 then
            buffer := once ""
            buffer.clear_count
            cc := c
            from
            until
               end_of_line
            loop
               if cc = '%R' then
                  stream.filtered_read_character
                  end_of_line := True
               elseif cc = '%N' then
                  end_of_line := True
               else
                  buffer.append_character(cc)
                  stream.filtered_read_character
                  cc := stream.filtered_last_character
               end
            end
            if buffer.is_empty then
               state := the_end
            else
               len := from_hexadecimal(buffer)
               stream.filtered_read_character
               filtered_last_character := stream.filtered_last_character
            end
            len := len - 1
         elseif len > 0 then
            filtered_last_character := c
            len := len - 1
            if len = 0 then
               state := the_end
            end
         else
            filtered_last_character := '%U'
         end
      end

   from_hexadecimal (s: STRING): INTEGER
      local
         i, n: INTEGER; c: CHARACTER
      do
         from
            i := s.lower
         until
            i > s.upper
         loop
            c := s.item(i)
            inspect
               c
            when '0' .. '9' then
               n := c.code - '0'.code
            when 'a' .. 'f' then
               n := c.code - 'a'.code + 10
            when 'A' .. 'F' then
               n := c.code - 'A'.code + 10
            else
               i := s.upper
            end
            Result := Result * 16 + n
            i := i + 1
         end
      end

   local_can_disconnect: BOOLEAN True

   state: INTEGER

   chunked, gzipped: BOOLEAN

   len: INTEGER

   protocol: STRING

   cookies: HASHED_DICTIONARY[STRING, STRING]

   new_line: STRING "%R%N"

   in_headers: INTEGER 1

   in_body: INTEGER 2

   the_end: INTEGER 254

   error: INTEGER 255

end -- class HTTP_CLIENT_INPUT_STREAM
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
