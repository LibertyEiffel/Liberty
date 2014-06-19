class TEST_STRING_PRINTER01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         p: STRING_PRINTER
         s: STRING; sos: STRING_OUTPUT_STREAM
      do
         s := ""
         create sos.connect_to(s)
         create p.make(sos)
         p.put_message("@(1) @(2)%N", << "hello", "world" >>)
         assert(s.is_equal(once "hello world%N"))
      end

end
