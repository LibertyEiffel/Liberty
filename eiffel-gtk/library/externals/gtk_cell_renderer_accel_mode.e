indexing
	description: "Enum GtkCellRendererAccelMode"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gtk_cell_renderer_accel_mode.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GTK_CELL_RENDERER_ACCEL_MODE
       -- Enum GtkCellRendererAccelMode

insert ENUM

creation set_gtk

feature -- Setters

    set_gtk is 
       do
          value := gtk_cell_renderer_accel_mode_gtk 
       ensure is_gtk 
       end

    set_other is 
       do
          value := gtk_cell_renderer_accel_mode_other 
       ensure is_other 
       end

feature -- Queries

    is_gtk: BOOLEAN is do Result:=(value=gtk_cell_renderer_accel_mode_gtk) end

    is_other: BOOLEAN is do Result:=(value=gtk_cell_renderer_accel_mode_other) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gtk_cell_renderer_accel_mode_gtk) or else
                    (a_value=gtk_cell_renderer_accel_mode_other) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gtk_cell_renderer_accel_mode_gtk: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CELL_RENDERER_ACCEL_MODE_GTK"
         end

    gtk_cell_renderer_accel_mode_other: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CELL_RENDERER_ACCEL_MODE_OTHER"
         end

end -- class GTK_CELL_RENDERER_ACCEL_MODE
