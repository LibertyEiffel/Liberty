class BAD_AGENT01

-- test inline agents with correct behaviour concerning local
-- variables of the containing feature

-- the offending case is when the containing feature has a local and
-- the contained one tries to use it: there should be an error
-- message, not a crash

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         i: INTEGER
      do
         i := 42
         (agent is do i := 3; assert(i = 3); end).call([])
         assert(i = 42)
      end

end
