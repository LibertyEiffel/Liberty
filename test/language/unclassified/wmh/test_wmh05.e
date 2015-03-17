class TEST_WMH05
   -- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>

create {}
   make

feature {}
   make
      do
         call_once_only
      end

   count: INTEGER

   call_once_only
      require
         count = 0
      do
         count := count + 1
      end

end -- class TEST_WMH05
