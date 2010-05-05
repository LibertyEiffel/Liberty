class TEST_WMH05
-- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>
creation make
feature

   make is
      do
	 call_once_only;
	 check
	 end
      end;
   
   count: INTEGER;
   
   call_once_only is
      require
	 count = 0
      do
	 count := count + 1
      end 
   
end
