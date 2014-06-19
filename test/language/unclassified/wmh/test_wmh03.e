class TEST_WMH03
   -- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>

create {}
   make

feature {}
   make
      local
         t: AUX_WMH03TOP; b: AUX_WMH03BOTTOM
      do
         create t
         t.execute
         create b
         b.execute
      end

end -- class TEST_WMH03
