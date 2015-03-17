class EXAMPLE

create {ANY}
   make

feature {}
   make
      do
         io.put_string(translator.translation("Hello world!"))
         io.put_new_line
      end

   translator: TRANSLATOR
      once
         create Result.init
      end

end -- class EXAMPLE
