class EXAMPLE

create {ANY}
   make

feature {}
   make is
      local
         lib: LIBRARY
      do
         create lib.make(translator)
         io.put_string(translator.translation("Hello from the program"))
         io.put_new_line
         lib.print_hello
      end

   translator: PROGRAM_TRANSLATOR is
      once
         create Result.init
      end

end -- class EXAMPLE
