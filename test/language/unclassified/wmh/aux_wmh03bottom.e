class AUX_WMH03BOTTOM
inherit
   AUX_WMH03TOP
      redefine
    execute
      end
feature
   done2: BOOLEAN;
   execute is
      once
    Precursor
    done2 := True;
      end
end
