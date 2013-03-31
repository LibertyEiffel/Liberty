class TEST_WMH02
-- From a bug report of "Wai Ming, HO" <waimingh@irisa.fr>
creation make
feature
   make is
      local
    t : AUX_WMH01TOP
    b : AUX_WMH01BOTTOM
      do
    !!t;
    t.execute_once
    !!b;
    b.execute_once
      end
end

