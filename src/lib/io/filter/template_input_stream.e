-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TEMPLATE_INPUT_STREAM
   --
   -- An input stream that understands templates
   --

inherit
   FILTER_INPUT_STREAM
      rename
         connect_to as reconnect_to
      redefine
         can_read_character, can_unread_character, end_of_input
      end

create {ANY}
   connect_to

feature {ANY}
   can_read_character: BOOLEAN
      do
         inspect
            state
         when 0, -2, -4 then
            Result := stream.can_read_character
         when -1, -3 then
            Result := resolved_string.valid_index(resolved_index)
         end
      end

   end_of_input: BOOLEAN
      do
         inspect
            state
         when 0, -2, -4 then
            Result := stream.end_of_input
         when -1, -3 then
            Result := not resolved_string.valid_index(resolved_index) and then stream.end_of_input
         end
      end

   can_unread_character: BOOLEAN
      do
         inspect
            state
         when 0 then
            Result := stream_read_count > 0 and then Precursor
         when -1, -2, -3 then
            Result := resolved_index > resolved_string.lower
         when -4 then
            check not Result end
         end
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         inspect
            state
         when 0, -2, -4 then
            state := 0
            stream.filtered_read_character
            stream_read_count := stream_read_count + 1
            if stream.valid_last_character then
               if stream.filtered_last_character = '#' then
                  resolve_hash
               end
            end
         when -1 then
            resolved_index := resolved_index + 1
            if not resolved_string.valid_index(resolved_index) then
               state := -2
               stream_read_count := 0
               filtered_read_character
            end
         when -3 then
            resolved_index := resolved_index + 1
            if not resolved_string.valid_index(resolved_index) then
               state := -2
            end
         end
      end

   filtered_unread_character
      do
         inspect
            state
         when 0 then
            stream.filtered_unread_character
            stream_read_count := stream_read_count - 1
            if stream_read_count = 0 then
               state := -4 -- we are just beyond a template string
            end
         when -1, -3 then
            resolved_index := resolved_index - 1
         when -2 then
            resolved_index := resolved_string.upper
            state := -3
         when -4 then
            check False end
         end
      end

   filtered_last_character: CHARACTER
      do
         inspect
            state
         when 0, -2, -4 then
            Result := stream.filtered_last_character
         when -1, -3 then
            Result := resolved_string.item(resolved_index)
         end
      end

feature {}
   resolve_hash
      require
         state = 0
         stream.filtered_last_character = '#'
      local
         string: ABSTRACT_STRING
      do
         from
            state := 1
         until
            state <= 0
         loop
            inspect
               state
            when 1 then
               stream.filtered_read_character
               if stream.valid_last_character then
                  if stream.filtered_last_character = '(' then
                     if resolve_key = Void then
                        resolve_key := ""
                     else
                        resolve_key.clear_count
                     end
                     state := 2
                  else
                     state := 0
                  end
               else
                  state := 0
               end
            when 2 then
               stream.filtered_read_character
               if stream.valid_last_character then
                  if stream.filtered_last_character = ')' then
                     string := resolver.item([resolve_key])
                     if string = Void or else string.is_empty then
                        state := -4
                        filtered_read_character
                     else
                        if resolved_string = Void then
                           resolved_string := ""
                        else
                           resolved_string.clear_count
                        end
                        resolved_string.make_from_string(string)
                        resolved_index := resolved_string.lower
                        state := -1
                     end
                  else
                     resolve_key.extend(stream.filtered_last_character)
                  end
               else
                  state := 0
               end
            end
         end
      ensure
         stream.valid_last_character implies (state < 0 and then stream.filtered_last_character = ')')
      end

   local_can_disconnect: BOOLEAN True

feature {ANY}
   connect_to (a_stream: like stream; a_resolver: like resolver)
      require
         a_stream /= Void
         a_resolver /= Void
      do
         stream := a_stream
         resolver := a_resolver
         state := 0
      ensure
         stream = a_stream
         resolver = a_resolver
      end

feature {}
   state: INTEGER
         -- Reading status
         --    0: normal
         --    1: just read "#"
         --    2: just read "#(", reading a template identifier, waiting for ")"
         --   -1: reading a resolved template string (from `resolved_string')
         --   -2: just finished reading a resolved template string, read next character in stream (because of
         --       unread, we need to come back to the last character of the resolved template string instead
         --       of unreading in the stream)
         --   -3: reading a resolved template string (from `resolved_string'); but coming back from -2 i.e.
         --       don't re-read a character from string at the end of the resolved template string
         --   -4: just resolved to an empty template string, cannot unread

   resolver: FUNCTION[TUPLE[STRING], ABSTRACT_STRING]
         -- Called for each template resolution

   resolve_key: STRING
         -- A per-instance memory zone to keep the latest resolve key

   resolved_string: STRING
         -- A per-instance memory zone to keep the latest template resolved string

   resolved_index: INTEGER
         -- An index into `resolved_string' (see also the invariant)

   stream_read_count: INTEGER
         -- The maximum number of times we may unread characters from the stream; reset at each template
         -- reading because of coherency (alleviating this barrier would make the object quite memory-hungry)

invariant
   stream /= Void
   resolver /= Void
   (state = -1 or state = -3) implies resolved_string.valid_index(resolved_index)

end -- class TEMPLATE_INPUT_STREAM
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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
