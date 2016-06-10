class STREAM_READ_LINE
   -- This example shows how to use read_line.
   -- The reading pattern is different from the one used with read_character.
   -- It HAS to be different.

create {ANY}
   make

feature {}
   make
      local
         tfr: TEXT_FILE_READ
      do
         from
            create tfr.connect_to("stream_read_line.e")
         until
            tfr.end_of_input
         loop
            tfr.read_line
            if tfr.end_of_input then
               -- The last line of the file does not end with a newline
               -- character. Remove this test if you don't care.
               std_output.put_string(tfr.last_string)
            else
               std_output.put_line(tfr.last_string)
            end
         end
         tfr.disconnect
      end
      -- NOTE: last_string always returns the same STRING object, it's up
      -- to you to make a copy if you need to keep the string value.

end -- class STREAM_READ_LINE
