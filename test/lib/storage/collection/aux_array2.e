class AUX_ARRAY2[G_]

inherit
   ARRAY2[G_]
   
create {ANY}
   makea2

feature {ANY}
   makea2 (line_min, line_max, column_min, column_max: INTEGER)
      do
         io.put_line("new AUX_ARRAY2")
         make(line_min, line_max, column_min, column_max)
      end
   
end --class AUX_ARRAY2
