class AUX_WMH01BOTTOM
inherit
   AUX_WMH01TOP
      redefine
	 execute_once
      end
feature
   done2: BOOLEAN;
   execute_once is
      once
	 Precursor
	 done2 := True;
      end
end
