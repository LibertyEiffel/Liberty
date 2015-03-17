class BAD_ALIAS_05

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         assert(universal() = 42)
      end

   universal: INTEGER 42

end
