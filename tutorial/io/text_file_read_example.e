class TEXT_FILE_READ_EXAMPLE
   --
   -- This example reads a text file character by character and puts each character on the screen.
   --
   -- If you compile and run this class in the current working directory, you'll see this file !
   --
   -- In order to read a file, read a character and then use
   -- last_character ONLY if if end_of_input has not been reached
   -- while reading the character.
   --
   -- More informations in the FAQ.

create {ANY}
   make

feature {}
   make
      local
         text_file_read: TEXT_FILE_READ; path: STRING
      do
         path := "text_file_read_example.e"
         create text_file_read.connect_to(path)
         if text_file_read.is_connected then
            from
               text_file_read.read_character
            until
               text_file_read.end_of_input
            loop
               io.put_character(text_file_read.last_character)
               text_file_read.read_character
            end
            text_file_read.disconnect
         else
            io.put_string("Cannot read file %"" + path + "%" in the current working directory.%N")
         end
      end

end -- class TEXT_FILE_READ_EXAMPLE
