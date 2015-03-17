class EXAMPLE2
   --
   -- This example shows how to list the contents of a directory
   -- using low level class BASIC_DIRECTORY.
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {}
   make
      do
         if argument_count /= 1 then
            io.put_string("usage : example2 <directory_name>%N")
         else
            list_directory(argument(1))
         end
      end

   list_directory (path: STRING)
      local
         basic_directory: BASIC_DIRECTORY
      do
         io.put_string("Trying to list %"")
         io.put_string(path)
         io.put_string("%".%N")
         basic_directory.connect_to(path)
         if basic_directory.is_connected then
            display_content_of(basic_directory)
         else
            io.put_string("Unable to open directory %"")
            io.put_string(path)
            io.put_string("%".%N")
            -- Attempt to connect to the parent directory of `path' :
            basic_directory.connect_with(path)
            if basic_directory.is_connected then
               io.put_string("Trying to list %"")
               io.put_string(basic_directory.last_entry)
               io.put_string("%".%N")
               display_content_of(basic_directory)
            end
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

end -- class EXAMPLE2
