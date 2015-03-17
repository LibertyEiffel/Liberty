class EXAMPLE5
   --
   -- This example shows how to create a new directory, how to add files
   -- in this new created directory and finally how to remove it.
   --

create {ANY}
   make

feature {}
   make
      local
         directory_path, file_path: STRING; basic_directory: BASIC_DIRECTORY; text_file_write: TEXT_FILE_WRITE
      do
         basic_directory.connect_to_current_working_directory
         directory_path := basic_directory.last_entry.twin
         basic_directory.disconnect
         basic_directory.compute_subdirectory_with(directory_path, "foo")
         directory_path := basic_directory.last_entry.twin
         io.put_string("Trying to create a new directory (%"")
         io.put_string(directory_path)
         io.put_string("%").%N")
         basic_directory.connect_to(directory_path)
         if basic_directory.is_connected then
            io.put_string("This directory already exists (sorry).%N")
            basic_directory.disconnect
            die_with_code(exit_failure_code)
         end

         if not basic_directory.create_new_directory(directory_path) then
            io.put_string("Unable to create this directory.%N")
            die_with_code(exit_failure_code)
         end

         basic_directory.compute_file_path_with(directory_path, "bar")
         file_path := basic_directory.last_entry.twin
         io.put_string("Try to create a new file (%"")
         io.put_string(file_path)
         io.put_string("%").%N")
         create text_file_write.connect_to(file_path)
         if text_file_write.is_connected then
            text_file_write.disconnect
            io.put_string("File created.%N")
         else
            io.put_string("Unable to create this file.%N")
            die_with_code(exit_failure_code)
         end

         list_directory(directory_path)
         io.put_string("Removing file %"")
         io.put_string(file_path)
         io.put_string("%".%N")
         (create {FILE_TOOLS}).delete(file_path)
         if basic_directory.remove_directory(directory_path) then
            io.put_string("Directory %"")
            io.put_string(directory_path)
            io.put_string("%" is removed.%N")
         else
            io.put_string("Unable to remove directory %"")
            io.put_string(directory_path)
            io.put_string("%".%N")
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
            die_with_code(exit_failure_code)
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

end -- class EXAMPLE5
