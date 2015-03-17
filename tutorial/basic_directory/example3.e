class EXAMPLE3
   --
   -- This example shows how to compute parent directories path starting
   -- from some given path as an argument or from the current working
   -- directory.
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {}
   basic_directory: BASIC_DIRECTORY

   make
      local
         some_path: STRING
      do
         if argument_count > 1 then
            io.put_string("usage : example3 [<some_path>]%N")
         elseif argument_count = 1 then
            some_path := argument(1).twin
            go_up_from(some_path)
         else
            basic_directory.connect_to_current_working_directory
            if basic_directory.is_connected then
               some_path := basic_directory.last_entry.twin
               basic_directory.disconnect
               go_up_from(some_path)
            end
         end
      end

   go_up_from (some_path: STRING)
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            io.put_string("%"")
            io.put_string(some_path)
            io.put_string("%"%N")
            basic_directory.compute_parent_directory_of(some_path)
            if basic_directory.last_entry.is_empty then
               stop := True
            else
               some_path.copy(basic_directory.last_entry)
            end
         end
      end

end -- class EXAMPLE3
