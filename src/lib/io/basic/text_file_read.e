-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TEXT_FILE_READ
   --
   -- Basic input facilities to read a named file on the disc.
   --
   -- Note: most features are common with STD_INPUT so you can test your program on the
   -- screen first and then, just changing of instance (STD_INPUT/TEXT_FILE_READ), doing the
   -- same in a file.
   --
   -- Input stream usage is available in tutorial/io and Liberty Eiffel FAQ.
   --

inherit
   FILE_STREAM
      redefine out_in_tagged_out_memory
      end
   TERMINAL_INPUT_STREAM
      redefine filtered_read_line_in, filtered_read_available_in, out_in_tagged_out_memory
      end

insert
   STRING_HANDLER
      redefine out_in_tagged_out_memory
      end

create {ANY}
   make, connect_to

feature {ANY}
   connect_to (new_path: ABSTRACT_STRING)
         --  Open text file for reading. The stream is positioned at the
         --  beginning of the file.
      local
         p: POINTER
      do
         p := new_path.to_external
         input_stream := text_file_read_open(p)
         if input_stream.is_not_null then
            end_of_input := False
            set_path(new_path)
            if capacity = 0 then
               buffer := buffer.calloc(4096)
               capacity := 4096
            end
            end_reached := False
            buffer_position := 0
            buffer_size := 0
            filtered_last_character := '%U'
         end
      ensure then
         is_connected implies not end_of_input
      end

   disconnect
      do
         io_fclose(input_stream)
         path := Void
         filter := Void
      end

   can_unread_character: BOOLEAN
      do
         Result := buffer_position > 0
      end

   end_of_input: BOOLEAN

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{TEXT_FILE_READ ")
         tagged_out_memory.append(path)
         tagged_out_memory.extend('}')
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         filtered_last_character := buffer.item(buffer_position)
         buffer_position := buffer_position + 1
         end_of_input := end_reached
         check
            valid_last_character
         end
      end

   filtered_unread_character
      do
         end_of_input := False
         buffer_position := buffer_position - 1
         if valid_last_character then
            filtered_last_character := buffer.item(buffer_position - 1)
         end
      end

   filtered_last_character: CHARACTER

   filtered_read_line_in (str: STRING)
      local
         i: INTEGER; stop: BOOLEAN; old_count, new_count: INTEGER; initial_count: INTEGER
      do
         from
            initial_count := str.count
         until
            stop
         loop
            -- search %N in buffer
            from
               i := buffer_position
            until
               i >= buffer_size or else buffer.item(i) = '%N'
            loop
               i := i + 1
            end
            -- block copy (but slice_copy copies char by char...)
            if i > buffer_position then
               old_count := str.count
               new_count := old_count + i - buffer_position
               if str.capacity < new_count then
                  str.resize((old_count * 2).max(new_count))
               end
               str.storage.slice_copy(old_count, buffer, buffer_position, i - 1)
               str.set_count(new_count)
            end
            -- next buffer if needed
            if i < buffer_size and then buffer.item(i) = '%N' then
               stop := True
               buffer_position := i + 1
               if str.count > initial_count and then str.last = '%R' then
                  str.remove_last
                  -- UNIX uses the Linefeed character (ASCII character 10) to
                  -- denote the end of a line. DOS uses the Carriage Return
                  -- followed by the Linefeed character (ASCII character 13
                  -- & ASCII character 10) to denote a new line.
               end
            else
               if not end_reached then
                  fill_buffer
               end
               stop := end_reached
            end
         end
         end_of_input := end_reached
      end

   filtered_read_available_in (str: STRING; limit: INTEGER)
         -- Limit reading to what the buffer contains. If the buffer is already exhausted, just fill it once.
      local
         old_count, new_count, i: INTEGER
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         old_count := str.count
         i := limit.min(buffer_size - buffer_position)
         new_count := old_count + i
         if str.capacity < new_count then
            str.resize((old_count * 2).max(new_count))
         end
         str.storage.slice_copy(old_count, buffer, buffer_position, buffer_position + i - 1)
         str.set_count(new_count)
         buffer_position := buffer_position + i
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := sequencer_descriptor(input_stream)
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         Result := input_stream
      end

   filtered_has_stream_pointer: BOOLEAN True

feature {FILE_TOOLS}
   same_as (other: like Current): BOOLEAN
      require
         is_connected
         other.is_connected
      local
         b1, b2: NATIVE_ARRAY[CHARACTER]; i: INTEGER
      do
         from
            fill_buffer
            b1 := buffer
            other.fill_buffer
            b2 := other.buffer
            Result := True
         until
            not Result or else end_reached or else other.end_reached
         loop
            if buffer_size = other.buffer_size then
               if b1.item(0) /= b2.item(0) then
                  Result := False
               else
                  -- make first character different for loop end
                  b1.put('%R', 0)
                  b2.put('%N', 0)
                  from
                     i := buffer_size - 1
                  variant
                     i
                  until
                     b1.item(i) /= b2.item(i)
                  loop
                     i := i - 1
                  end
                  Result := i = 0
               end
               if Result then
                  fill_buffer
                  other.fill_buffer
               end
            else
               from
                  read_character
                  other.read_character
               until
                  not Result or else end_of_input or else other.end_of_input
               loop
                  Result := last_character = other.last_character
                  read_character
                  other.read_character
               end
            end
         end
         Result := Result and then end_reached and then other.end_reached
         disconnect
         other.disconnect
      ensure
         not is_connected
         not other.is_connected
      end

feature {INPUT_STREAM}
   input_stream: POINTER

feature {TEXT_FILE_READ}
   buffer: NATIVE_ARRAY[CHARACTER]

   end_reached: BOOLEAN

   buffer_position, buffer_size: INTEGER

   capacity: INTEGER

   fill_buffer
      local
         last: CHARACTER; more: BOOLEAN
      do
         more := buffer_size > 0
         if more then
            last := buffer.item(buffer_size - 1)
         end
         buffer_size := io_fread(buffer, capacity, input_stream)
         buffer_position := 0
         if buffer_size = 0 then
            end_reached := True
            if more then
               -- needed for unread_character service
               buffer.put(last, 0)
               buffer_size := 1
               buffer_position := 1
            else
               buffer_size := 0
            end
         elseif buffer_size < 0 then
            -- ???
         end
      end

feature {}
   make
         -- The new created object is not connected. (See also `connect_to'.)
      do
      ensure
         not is_connected
      end

   text_file_read_open (path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "text_file_read_open"
         }"
      end

   io_fclose (stream: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fclose"
         }"
      end

end -- class TEXT_FILE_READ
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
