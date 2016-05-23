class AUX_ARRAY3[G_]

inherit
   ARRAY3[G_]
   
create {ANY}
   makea3

feature {ANY}
   makea3 (line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER)
      do
         io.put_line("new AUX_ARRAY3")
         make(line_min, line_max, column_min, column_max, depth_min, depth_max)
      end
   
end --class AUX_ARRAY3
