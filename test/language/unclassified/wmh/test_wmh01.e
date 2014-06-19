class TEST_WMH01
   -- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         t: AUX_WMH01TOP; b: AUX_WMH01BOTTOM
      do
         create t
         t.execute_once
         assert(t.done1)

         create b
         b.execute_once
         assert(not b.done1)
         assert(b.done2)
      end

end -- class TEST_WMH01
