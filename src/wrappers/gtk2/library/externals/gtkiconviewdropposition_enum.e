-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKICONVIEWDROPPOSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_icon_view_drop_above_low_level)  or else
				(a_value = gtk_icon_view_drop_below_low_level)  or else
				(a_value = gtk_icon_view_drop_into_low_level)  or else
				(a_value = gtk_icon_view_drop_left_low_level)  or else
				(a_value = gtk_icon_view_drop_right_low_level)  or else
				(a_value = gtk_icon_view_no_drop_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_icon_view_drop_above is
		do
			value := gtk_icon_view_drop_above_low_level
		end

	set_gtk_icon_view_drop_below is
		do
			value := gtk_icon_view_drop_below_low_level
		end

	set_gtk_icon_view_drop_into is
		do
			value := gtk_icon_view_drop_into_low_level
		end

	set_gtk_icon_view_drop_left is
		do
			value := gtk_icon_view_drop_left_low_level
		end

	set_gtk_icon_view_drop_right is
		do
			value := gtk_icon_view_drop_right_low_level
		end

	set_gtk_icon_view_no_drop is
		do
			value := gtk_icon_view_no_drop_low_level
		end

feature {ANY} -- Queries
	is_gtk_icon_view_drop_above: BOOLEAN is
		do
			Result := (value=gtk_icon_view_drop_above_low_level)
		end

	is_gtk_icon_view_drop_below: BOOLEAN is
		do
			Result := (value=gtk_icon_view_drop_below_low_level)
		end

	is_gtk_icon_view_drop_into: BOOLEAN is
		do
			Result := (value=gtk_icon_view_drop_into_low_level)
		end

	is_gtk_icon_view_drop_left: BOOLEAN is
		do
			Result := (value=gtk_icon_view_drop_left_low_level)
		end

	is_gtk_icon_view_drop_right: BOOLEAN is
		do
			Result := (value=gtk_icon_view_drop_right_low_level)
		end

	is_gtk_icon_view_no_drop: BOOLEAN is
		do
			Result := (value=gtk_icon_view_no_drop_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_icon_view_drop_above_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_ABOVE"
 			}"
 		end

	gtk_icon_view_drop_below_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_BELOW"
 			}"
 		end

	gtk_icon_view_drop_into_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_INTO"
 			}"
 		end

	gtk_icon_view_drop_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_LEFT"
 			}"
 		end

	gtk_icon_view_drop_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_RIGHT"
 			}"
 		end

	gtk_icon_view_no_drop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_NO_DROP"
 			}"
 		end


end -- class GTKICONVIEWDROPPOSITION_ENUM
