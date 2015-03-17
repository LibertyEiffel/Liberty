class BAD_AGENT01

-- test inline agents with correct behaviour concerning local
-- variables of the containing feature

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         i: INTEGER
      do
         i := 42
         (agent do i := 3; assert(i = 3); end).call([])
         assert(i = 42)
      end

end
