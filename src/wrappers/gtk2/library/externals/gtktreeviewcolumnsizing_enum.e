-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKTREEVIEWCOLUMNSIZING_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_tree_view_column_autosize_low_level)  or else
				(a_value = gtk_tree_view_column_fixed_low_level)  or else
				(a_value = gtk_tree_view_column_grow_only_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_tree_view_column_autosize is
		do
			value := gtk_tree_view_column_autosize_low_level
		end

	set_gtk_tree_view_column_fixed is
		do
			value := gtk_tree_view_column_fixed_low_level
		end

	set_gtk_tree_view_column_grow_only is
		do
			value := gtk_tree_view_column_grow_only_low_level
		end

feature {ANY} -- Queries
	is_gtk_tree_view_column_autosize: BOOLEAN is
		do
			Result := (value=gtk_tree_view_column_autosize_low_level)
		end

	is_gtk_tree_view_column_fixed: BOOLEAN is
		do
			Result := (value=gtk_tree_view_column_fixed_low_level)
		end

	is_gtk_tree_view_column_grow_only: BOOLEAN is
		do
			Result := (value=gtk_tree_view_column_grow_only_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_tree_view_column_autosize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_COLUMN_AUTOSIZE"
 			}"
 		end

	gtk_tree_view_column_fixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_COLUMN_FIXED"
 			}"
 		end

	gtk_tree_view_column_grow_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_COLUMN_GROW_ONLY"
 			}"
 		end


end -- class GTKTREEVIEWCOLUMNSIZING_ENUM
