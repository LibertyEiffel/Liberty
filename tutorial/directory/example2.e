class EXAMPLE2
   --
   -- This example shows how to manipulate files and directories without
   -- ever relying to any explicit pathname manipulation (that is, we may
   -- need to buffer some pathname, but never to scan it, cut it, build
   -- it and so on)
   --

create {ANY}
   make

feature {ANY}
   make
      local
         wd: DIRECTORY
      do
         create wd.scan_current_working_directory
         recursive_list(wd)
      end

feature {}
   recursive_list (a_dir: DIRECTORY)
         -- Lists the contents of the directory, and tries to list the
         -- subdirectories
      local
         i: INTEGER; a: FAST_ARRAY[FILE]; filename: ABSTRACT_STRING; inner_dir: DIRECTORY
      do
         io.put_string(a_dir.path)
         io.put_new_line
         create a.with_capacity(a_dir.count)
         -- keep the FILE objects
         from
            i := a_dir.lower
         until
            i > a_dir.upper
         loop
            filename := a_dir.item(i)
            if filename /= Void and then filename.count > 0 and then filename.item(1) /= '.' then
               a.add_last(a_dir.file_at(i))
            end

            i := i + 1
         end

         from
            i := a.lower
         until
            i > a.upper
         loop
            if a.item(i).is_directory then
               check
                  inner_dir ?:= a.item(i)
               end
               inner_dir ::= a.item(i)
               recursive_list(inner_dir)
            end
            i := i + 1
         end
      end

end -- class EXAMPLE2
