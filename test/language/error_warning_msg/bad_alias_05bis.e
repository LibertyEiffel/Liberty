class BAD_ALIAS_05BIS

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      do
         assert(universal
                () = 42)
      end

   universal: INTEGER is 42

end
