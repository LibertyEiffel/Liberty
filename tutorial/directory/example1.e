class EXAMPLE1
   --
   -- This example shows how to list the contents of a directory
   -- using class DIRECTORY.
   -- When no argument is given in the command line, the current working
   -- directory is listed.
   --
   --       compile -o run_it example1
   --       run_it some_directory_path
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {}
   make
      local
         directory: DIRECTORY; some_path: STRING
      do
         if argument_count > 1 then
            io.put_string("usage : example1 [<some_path>]%N")
         elseif argument_count = 1 then
            some_path := argument(1)
            create directory.scan(some_path)

            if directory.exists then
               list_directory(directory)
            else
               io.put_string("Unable to open directory %"")
               io.put_string(some_path)
               io.put_string("%".%N")
            end
         else
            io.put_string("Scanning current working directory.%N")
            create directory.scan_current_working_directory
            list_directory(directory)
         end
      end

   list_directory (directory: DIRECTORY)
      local
         i: INTEGER
      do
         io.put_string("Printing content of %"")
         io.put_string(directory.path)
         io.put_string("%".%N")
         io.put_integer(directory.count)
         io.put_string(" item(s) found:%N")
         from
            i := directory.lower
         until
            i > directory.count
         loop
            io.put_character('%T')
            if directory.file_at(i).is_directory then
               io.put_string(once "directory ")
            else
               io.put_string(once "file      ")
            end

            io.put_string(directory.item(i))
            io.put_character('%N')
            i := i + 1
         end
      end

end -- class EXAMPLE1
