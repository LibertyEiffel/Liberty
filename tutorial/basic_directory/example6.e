class EXAMPLE6
   --
   -- This example shows how to create a new directory, how to change
   -- the current working directory.
   --

create {ANY}
   make

feature {}
   make
      local
         directory_path: STRING; basic_directory: BASIC_DIRECTORY
      do
         basic_directory.connect_to_current_working_directory
         directory_path := basic_directory.last_entry.twin
         basic_directory.disconnect
         io.put_string("Initial working directory is %"")
         io.put_string(directory_path)
         io.put_string("%".%N")
         basic_directory.compute_parent_directory_of(directory_path)
         directory_path := basic_directory.last_entry.twin
         basic_directory.change_current_working_directory(directory_path)
         if basic_directory.last_entry.is_empty then
            io.put_string("Unable to change working directory to %"")
            io.put_string(directory_path)
            io.put_string("%".%N")
            die_with_code(exit_failure_code)
         end

         basic_directory.connect_to_current_working_directory
         directory_path := basic_directory.last_entry.twin
         io.put_string("New working directory is %"")
         io.put_string(directory_path)
         io.put_string("%".%N")
         display_content_of(basic_directory)
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

end -- class EXAMPLE6
