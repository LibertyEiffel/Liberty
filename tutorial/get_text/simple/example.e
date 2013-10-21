class EXAMPLE

create {ANY}
   make

feature {}
   make is
      do
         io.put_string(translator.translation("Hello world!"))
         io.put_new_line
      end

   translator: TRANSLATOR is
      once
         create Result.init
      end

end -- class EXAMPLE
