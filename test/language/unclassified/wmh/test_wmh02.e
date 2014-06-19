class TEST_WMH02
   -- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>

create {}
   make

feature {}
   make
      local
         t: AUX_WMH01TOP; b: AUX_WMH01BOTTOM
      do
         create t
         t.execute_once
         create b
         b.execute_once
      end

end -- class TEST_WMH02
