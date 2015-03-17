class TEST_UW02
   -- From a bug report of Ulrich Windl

create {}
   make

feature {ANY}
   make
      local
         s: STRING
      do
         s := dummy_once
      end

   dummy_once: STRING
      do
         Result := "Is this stupid ;-)"
      end

end -- class TEST_UW02
