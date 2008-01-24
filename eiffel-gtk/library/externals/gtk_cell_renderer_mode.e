indexing
	description: "Enum GtkCellRendererMode"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gtk_cell_renderer_mode.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GTK_CELL_RENDERER_MODE
       -- Enum GtkCellRendererMode

insert ENUM

creation set_inert

feature -- Setters

    set_inert is 
       do
          value := gtk_cell_renderer_mode_inert 
       ensure is_inert 
       end

    set_activatable is 
       do
          value := gtk_cell_renderer_mode_activatable 
       ensure is_activatable 
       end

    set_editable is 
       do
          value := gtk_cell_renderer_mode_editable 
       ensure is_editable 
       end

feature -- Queries

    is_inert: BOOLEAN is do Result:=(value=gtk_cell_renderer_mode_inert) end

    is_activatable: BOOLEAN is do Result:=(value=gtk_cell_renderer_mode_activatable) end

    is_editable: BOOLEAN is do Result:=(value=gtk_cell_renderer_mode_editable) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gtk_cell_renderer_mode_inert) or else
                    (a_value=gtk_cell_renderer_mode_activatable) or else
                    (a_value=gtk_cell_renderer_mode_editable) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gtk_cell_renderer_mode_inert: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CELL_RENDERER_MODE_INERT"
         end

    gtk_cell_renderer_mode_activatable: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CELL_RENDERER_MODE_ACTIVATABLE"
         end

    gtk_cell_renderer_mode_editable: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CELL_RENDERER_MODE_EDITABLE"
         end

end -- class GTK_CELL_RENDERER_MODE
