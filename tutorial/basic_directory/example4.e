class EXAMPLE4
   --
   -- This example shows how to traverse recursively some readable
   -- directory (starting point is computed either from current working
   -- directory or from some directory path given as an argument).
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {}
   make
      local
         some_path: STRING; basic_directory: BASIC_DIRECTORY
      do
         if argument_count > 1 then
            io.put_string("usage : example4 [<some_path>]%N")
         elseif argument_count = 1 then
            some_path := argument(1).twin
            recursive_list_of(some_path)
         else
            basic_directory.connect_to_current_working_directory
            if basic_directory.is_connected then
               some_path := basic_directory.last_entry.twin
               basic_directory.disconnect
               recursive_list_of(some_path)
            end
         end
         io.put_string("Total visited places count is ")
         io.put_integer(already_visited_places.count)
         io.put_string("%N.")
      end

   already_visited_places: ARRAY[STRING]
      once
         create Result.with_capacity(1, 32)
      end

   recursive_list_of (some_path: STRING)
      local
         file_tools: FILE_TOOLS
         basic_directory: BASIC_DIRECTORY; some_entry, another_path: STRING
      do
         if not already_visited_places.has(some_path) then
            io.put_string("Visiting %"")
            io.put_string(some_path)
            io.put_string("%"%N")
            already_visited_places.add_last(some_path)
            basic_directory.connect_to(some_path)
            if basic_directory.is_connected then
               from
                  basic_directory.read_entry
               until
                  basic_directory.end_of_input
               loop
                  some_entry := basic_directory.last_entry.twin
                  if some_entry.is_empty or else some_entry.first = '.' then
                     -- skip
                  else
                     basic_directory.compute_subdirectory_with(some_path, some_entry)
                     if not basic_directory.last_entry.is_empty and then file_tools.is_directory(basic_directory.last_entry) then
                        another_path := basic_directory.last_entry.twin
                        recursive_list_of(another_path)
                     end
                  end

                  basic_directory.read_entry
               end
               basic_directory.disconnect
            end
         end
      end

end -- class EXAMPLE4
