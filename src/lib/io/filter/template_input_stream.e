-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TEMPLATE_INPUT_STREAM
   --
   -- An input stream that understands templates
   --
   -- Tag syntax:
   --
   -- `#(some_key)' will replace the tag by the resolver the `item(some_key)'.
   --
   -- `#(*loop_key)'...`#(loop_key*)' will loop on the template portion enclosed between those tags, while
   -- the resolver `while(loop_key)' returns True.
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
         Result := not end_of_input
      end

   end_of_input: BOOLEAN
      do
         Result := buffer_index > buffer.upper and then raw_eof and then loop_names.is_empty
      end

   can_unread_character: BOOLEAN
      do
         Result := buffer_index >= buffer.lower
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         buffer_index := buffer_index + 1
         if buffer_index > buffer.upper then
            from
               read_more
            until
               end_of_input or else buffer.valid_index(buffer_index)
            loop
               read_more
            end
         end
      end

   filtered_unread_character
      do
         buffer_index := buffer_index - 1
      end

   filtered_last_character: CHARACTER
      do
         Result := buffer.item(buffer_index)
      end

feature {}
   local_can_disconnect: BOOLEAN True

   read_more
      local
         state: INTEGER; c: CHARACTER; key: STRING; value: ABSTRACT_STRING
      do
         from
            if raw_eof then
               state := -1
            else
               raw_next
            end
         until
            state < 0 or else stream.end_of_input
         loop
            c := raw_character
            inspect
               state
            when 0 then
               if c = '#' then
                  state := 1
               else
                  extend(c)
                  state := -1
               end
            when 1 then
               inspect
                  c
               when '(' then
                  key := once ""
                  key.clear_count
                  state := 2
               when '#' then
                  extend('#')
                  state := 0
               else
                  extend('#')
                  extend(c)
                  state := -1
               end
            when 2 then
               inspect
                  c
               when '*' then
                  state := 3
               when ')' then
                  append(once "#()")
               else
                  key.extend(c)
                  state := 4
               end
            when 3 then
               inspect
                  c
               when '*' then
                  append(once "#(*")
                  append(key)
                  extend('*')
                  state := -1
               when ')' then
                  start_loop(key)
                  state := -1
               else
                  key.extend(c)
               end
            when 4 then
               inspect
                  c
               when '*' then
                  state := 5
               when ')' then
                  value := resolver.item(key)
                  if value /= Void then
                     append(value)
                  end
                  state := -1
               else
                  key.extend(c)
               end
            when 5 then
               inspect
                  c
               when ')' then
                  end_loop(key)
                  state := -1
               else
                  state := -1
               end
            end
            if state >= 0 then
               if raw_eof then
                  state := -1
               else
                  raw_next
               end
            end
         end
      end

feature {}
   extend (c: CHARACTER)
      do
         if not discard then
            buffer.extend(c)
         end
      end

   append (s: ABSTRACT_STRING)
      do
         if not discard then
            buffer.append(s)
         end
      end

   start_loop (loop_name: STRING)
      do
         loop_names.push(loop_name.intern)
         loop_index.push(raw_index)
         loop_discard.push(discard or else not resolver.while(loop_name))
      end

   end_loop (loop_name: STRING)
      do
         if loop_names.is_empty or else loop_names.top /= loop_name.intern then
            append(once "#(")
            append(loop_name)
            append(once "*)")
         elseif discard or else not resolver.while(loop_name) then
            loop_names.pop
            loop_index.pop
            loop_discard.pop
         else
            raw_goto(loop_index.top)
         end
      end

   discard: BOOLEAN
      do
         if not loop_discard.is_empty then
            Result := loop_discard.top
         end
      end

   raw_next
      do
         raw_index := raw_index + 1
         if raw_index > raw.upper then
            stream.filtered_read_character
            if not stream.end_of_input then
               raw.extend(stream.filtered_last_character)
            end
         end
      end

   raw_goto (index: INTEGER)
      require
         raw.valid_index(index)
      do
         raw_index := index
      end

   raw_character: CHARACTER
      require
         raw.valid_index(raw_index)
      do
         Result := raw.item(raw_index)
      end

   raw_eof: BOOLEAN
      do
         Result := raw_index > raw.upper and then stream.end_of_input
      end

feature {ANY}
   connect_to (a_stream: like stream; a_resolver: like resolver)
      require
         a_stream /= Void
         a_resolver /= Void
      do
         a_stream.set_filter(Current)
         stream := a_stream
         resolver := a_resolver

         buffer := ""
         raw := ""

         create loop_names.make
         create loop_index.make
         create loop_discard.make
      ensure
         stream = a_stream
         resolver = a_resolver
      end

feature {}
   resolver: TEMPLATE_RESOLVER

   raw: STRING
         -- The characters read from the underlying stream, before template resolving
   raw_index: INTEGER
         -- Index into the `raw' buffer

   buffer: STRING
         -- The characters after template resolving
   buffer_index: INTEGER
         -- Index into the `buffer'

   loop_names: STACK[FIXED_STRING]
         -- Names of the running loops
   loop_index: STACK[INTEGER]
         -- Indexes of the running loops into the `raw' buffer
   loop_discard: STACK[BOOLEAN]
         -- Discard values of the currently running loops

invariant
   stream /= Void
   resolver /= Void

   loop_names.count = loop_index.count
   loop_names.count = loop_discard.count

end -- class TEMPLATE_INPUT_STREAM
--
-- Copyright (c) 2009-2015 by all the people cited in the AUTHORS file.
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
