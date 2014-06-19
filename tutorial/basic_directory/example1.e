class EXAMPLE1
   --
   -- This example shows how to list the contents of the current working
   -- directory using class BASIC_DIRECTORY.
   --

create {ANY}
   make

feature {}
   make
      local
         basic_directory: BASIC_DIRECTORY
      do
         basic_directory.connect_to_current_working_directory
         if basic_directory.is_connected then
            io.put_string("The current working directory is %"")
            io.put_string(basic_directory.last_entry)
            io.put_string("%".%N")
            display_content_of(basic_directory)
         else
            io.put_string("Unable to open current working directory.%N")
         end
      end

   display_content_of (basic_directory: BASIC_DIRECTORY)
      require
         basic_directory.is_connected
      do
         from
            basic_directory.read_entry
         until
            basic_directory.end_of_input
         loop
            io.put_character('%T')
            io.put_string(basic_directory.last_entry)
            io.put_character('%N')
            basic_directory.read_entry
         end
         basic_directory.disconnect
      ensure
         not basic_directory.is_connected
      end

end -- class EXAMPLE1
