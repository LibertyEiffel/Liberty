class AUX_WMH03BOTTOM

inherit
   AUX_WMH03TOP
      redefine execute
      end

feature {ANY}
   done2: BOOLEAN

   execute
      once
         Precursor
         done2 := True
      end

end -- class AUX_WMH03BOTTOM
