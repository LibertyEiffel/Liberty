class TEST_WMH06
-- From: Wai-Ming Ho <waimingh@irisa.fr>
insert MEMORY 

creation make

feature

   make is
      local
	 i : INTEGER
	 memory : ARRAY [ AUX_WMH06 ]
	 item : AUX_WMH06
      do
	 !!memory.make(1, max)
	 from i := 0
	 until i >= max_loop
	 loop
	    !!item.make
	    memory.put(item, (i \\ max) + 1)
	    i := i + 1;
	    if (i \\ max) = 0 then
	       full_collect
	    end;
	 end;
      end;
   
feature {}

   max : INTEGER is 40
   
   max_loop : INTEGER is 4000
   
end
