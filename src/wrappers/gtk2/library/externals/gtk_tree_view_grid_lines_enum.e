-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TREE_VIEW_GRID_LINES_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_tree_view_grid_lines_both_low_level)  or else
				(a_value = gtk_tree_view_grid_lines_horizontal_low_level)  or else
				(a_value = gtk_tree_view_grid_lines_none_low_level)  or else
				(a_value = gtk_tree_view_grid_lines_vertical_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_tree_view_grid_lines_both is
		do
			value := gtk_tree_view_grid_lines_both_low_level
		end

	set_gtk_tree_view_grid_lines_horizontal is
		do
			value := gtk_tree_view_grid_lines_horizontal_low_level
		end

	set_gtk_tree_view_grid_lines_none is
		do
			value := gtk_tree_view_grid_lines_none_low_level
		end

	set_gtk_tree_view_grid_lines_vertical is
		do
			value := gtk_tree_view_grid_lines_vertical_low_level
		end

feature -- Queries
	is_gtk_tree_view_grid_lines_both: BOOLEAN is
		do
			Result := (value=gtk_tree_view_grid_lines_both_low_level)
		end

	is_gtk_tree_view_grid_lines_horizontal: BOOLEAN is
		do
			Result := (value=gtk_tree_view_grid_lines_horizontal_low_level)
		end

	is_gtk_tree_view_grid_lines_none: BOOLEAN is
		do
			Result := (value=gtk_tree_view_grid_lines_none_low_level)
		end

	is_gtk_tree_view_grid_lines_vertical: BOOLEAN is
		do
			Result := (value=gtk_tree_view_grid_lines_vertical_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_tree_view_grid_lines_both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_BOTH"
 			}"
 		end

	gtk_tree_view_grid_lines_horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_HORIZONTAL"
 			}"
 		end

	gtk_tree_view_grid_lines_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_NONE"
 			}"
 		end

	gtk_tree_view_grid_lines_vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_VERTICAL"
 			}"
 		end


end -- class GTK_TREE_VIEW_GRID_LINES_ENUM
