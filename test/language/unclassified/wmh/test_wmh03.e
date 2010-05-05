class TEST_WMH03
-- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>
creation make
feature
   make is
      local
	 t : AUX_WMH03TOP
	 b : AUX_WMH03BOTTOM
      do
	 !!t;
	 t.execute
	 !!b;
	 b.execute
      end
end

