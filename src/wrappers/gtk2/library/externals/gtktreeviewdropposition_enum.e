-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKTREEVIEWDROPPOSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_tree_view_drop_after_low_level)  or else
				(a_value = gtk_tree_view_drop_before_low_level)  or else
				(a_value = gtk_tree_view_drop_into_or_after_low_level)  or else
				(a_value = gtk_tree_view_drop_into_or_before_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_tree_view_drop_after is
		do
			value := gtk_tree_view_drop_after_low_level
		end

	set_gtk_tree_view_drop_before is
		do
			value := gtk_tree_view_drop_before_low_level
		end

	set_gtk_tree_view_drop_into_or_after is
		do
			value := gtk_tree_view_drop_into_or_after_low_level
		end

	set_gtk_tree_view_drop_into_or_before is
		do
			value := gtk_tree_view_drop_into_or_before_low_level
		end

feature {ANY} -- Queries
	is_gtk_tree_view_drop_after: BOOLEAN is
		do
			Result := (value=gtk_tree_view_drop_after_low_level)
		end

	is_gtk_tree_view_drop_before: BOOLEAN is
		do
			Result := (value=gtk_tree_view_drop_before_low_level)
		end

	is_gtk_tree_view_drop_into_or_after: BOOLEAN is
		do
			Result := (value=gtk_tree_view_drop_into_or_after_low_level)
		end

	is_gtk_tree_view_drop_into_or_before: BOOLEAN is
		do
			Result := (value=gtk_tree_view_drop_into_or_before_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_tree_view_drop_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_AFTER"
 			}"
 		end

	gtk_tree_view_drop_before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_BEFORE"
 			}"
 		end

	gtk_tree_view_drop_into_or_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_INTO_OR_AFTER"
 			}"
 		end

	gtk_tree_view_drop_into_or_before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_INTO_OR_BEFORE"
 			}"
 		end


end -- class GTKTREEVIEWDROPPOSITION_ENUM
