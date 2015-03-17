class AUX_WMH01BOTTOM

inherit
   AUX_WMH01TOP
      redefine execute_once
      end

feature {ANY}
   done2: BOOLEAN

   execute_once
      once
         Precursor
         done2 := True
      end

end -- class AUX_WMH01BOTTOM
