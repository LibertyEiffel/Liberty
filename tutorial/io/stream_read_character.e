class STREAM_READ_CHARACTER
   -- This example show how to use read_character.
   -- The reading pattern is different from the one used with read_line.
   -- It HAS to be different.

create {ANY}
   make

feature {}
   make
      local
         tfr: TEXT_FILE_READ
      do
         from
            create tfr.connect_to("stream_read_character.e")
            tfr.read_character
         until
            tfr.end_of_input
         loop
            std_output.put_character(tfr.last_character)
            tfr.read_character
         end
         tfr.disconnect
      end

end -- class STREAM_READ_CHARACTER
