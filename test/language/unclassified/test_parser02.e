class TEST_PARSER02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         tmp: STRING
      do
         tmp := (--
                 agent make).out

            label_assert("reached execution state " + tmp, True)
      end
end
