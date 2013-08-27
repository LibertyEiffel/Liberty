class TEST_LAZY_STRING

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         model: STRING
      do
         model := "My PID is " + pid.out + "."
         assert(model.is_equal("My PID is " | &pid | "."))
         assert(model.is_equal("My PID is #(1)." # &pid))
      end

   pid: INTEGER_32 is 42

end
