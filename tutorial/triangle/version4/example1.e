class EXAMPLE1
   -- Using files is really easy too.

create {ANY}
   main

feature {ANY}
   main
      local
         p1: POINT; file_name: STRING; file: TEXT_FILE_WRITE
      do
         create p1.make(1.0, 2.0)
         p1.translate(1.0, 2.0)
         p1.display_on(io)
         file_name := "my_file.txt"
         create file.connect_to(file_name)
         p1.display_on(file)
         file.disconnect
         io.put_string("And the same output in %"" + file_name + "%" on the disk.%N")
      end

end -- class EXAMPLE1
