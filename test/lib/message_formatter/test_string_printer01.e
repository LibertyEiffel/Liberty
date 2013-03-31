class TEST_STRING_PRINTER01

create {}
   make

feature {}
   make is
      local
         p: STRING_PRINTER
      do
         create p.make(std_output)
         p.put_message("@(1) @(2)%N", << "hello", "world" >>)
      end

end
