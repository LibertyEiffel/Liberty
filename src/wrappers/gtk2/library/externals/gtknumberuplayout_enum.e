-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKNUMBERUPLAYOUT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_number_up_layout_bottom_to_top_left_to_right_low_level)  or else
				(a_value = gtk_number_up_layout_bottom_to_top_right_to_left_low_level)  or else
				(a_value = gtk_number_up_layout_left_to_right_bottom_to_top_low_level)  or else
				(a_value = gtk_number_up_layout_left_to_right_top_to_bottom_low_level)  or else
				(a_value = gtk_number_up_layout_right_to_left_bottom_to_top_low_level)  or else
				(a_value = gtk_number_up_layout_right_to_left_top_to_bottom_low_level)  or else
				(a_value = gtk_number_up_layout_top_to_bottom_left_to_right_low_level)  or else
				(a_value = gtk_number_up_layout_top_to_bottom_right_to_left_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_number_up_layout_bottom_to_top_left_to_right is
		do
			value := gtk_number_up_layout_bottom_to_top_left_to_right_low_level
		end

	set_gtk_number_up_layout_bottom_to_top_right_to_left is
		do
			value := gtk_number_up_layout_bottom_to_top_right_to_left_low_level
		end

	set_gtk_number_up_layout_left_to_right_bottom_to_top is
		do
			value := gtk_number_up_layout_left_to_right_bottom_to_top_low_level
		end

	set_gtk_number_up_layout_left_to_right_top_to_bottom is
		do
			value := gtk_number_up_layout_left_to_right_top_to_bottom_low_level
		end

	set_gtk_number_up_layout_right_to_left_bottom_to_top is
		do
			value := gtk_number_up_layout_right_to_left_bottom_to_top_low_level
		end

	set_gtk_number_up_layout_right_to_left_top_to_bottom is
		do
			value := gtk_number_up_layout_right_to_left_top_to_bottom_low_level
		end

	set_gtk_number_up_layout_top_to_bottom_left_to_right is
		do
			value := gtk_number_up_layout_top_to_bottom_left_to_right_low_level
		end

	set_gtk_number_up_layout_top_to_bottom_right_to_left is
		do
			value := gtk_number_up_layout_top_to_bottom_right_to_left_low_level
		end

feature {ANY} -- Queries
	is_gtk_number_up_layout_bottom_to_top_left_to_right: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_bottom_to_top_left_to_right_low_level)
		end

	is_gtk_number_up_layout_bottom_to_top_right_to_left: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_bottom_to_top_right_to_left_low_level)
		end

	is_gtk_number_up_layout_left_to_right_bottom_to_top: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_left_to_right_bottom_to_top_low_level)
		end

	is_gtk_number_up_layout_left_to_right_top_to_bottom: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_left_to_right_top_to_bottom_low_level)
		end

	is_gtk_number_up_layout_right_to_left_bottom_to_top: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_right_to_left_bottom_to_top_low_level)
		end

	is_gtk_number_up_layout_right_to_left_top_to_bottom: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_right_to_left_top_to_bottom_low_level)
		end

	is_gtk_number_up_layout_top_to_bottom_left_to_right: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_top_to_bottom_left_to_right_low_level)
		end

	is_gtk_number_up_layout_top_to_bottom_right_to_left: BOOLEAN is
		do
			Result := (value=gtk_number_up_layout_top_to_bottom_right_to_left_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_number_up_layout_bottom_to_top_left_to_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT"
 			}"
 		end

	gtk_number_up_layout_bottom_to_top_right_to_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT"
 			}"
 		end

	gtk_number_up_layout_left_to_right_bottom_to_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP"
 			}"
 		end

	gtk_number_up_layout_left_to_right_top_to_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM"
 			}"
 		end

	gtk_number_up_layout_right_to_left_bottom_to_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP"
 			}"
 		end

	gtk_number_up_layout_right_to_left_top_to_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM"
 			}"
 		end

	gtk_number_up_layout_top_to_bottom_left_to_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT"
 			}"
 		end

	gtk_number_up_layout_top_to_bottom_right_to_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT"
 			}"
 		end


end -- class GTKNUMBERUPLAYOUT_ENUM
