-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKPOSITIONTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_pos_bottom_low_level)  or else
				(a_value = gtk_pos_left_low_level)  or else
				(a_value = gtk_pos_right_low_level)  or else
				(a_value = gtk_pos_top_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_pos_bottom is
		do
			value := gtk_pos_bottom_low_level
		end

	set_gtk_pos_left is
		do
			value := gtk_pos_left_low_level
		end

	set_gtk_pos_right is
		do
			value := gtk_pos_right_low_level
		end

	set_gtk_pos_top is
		do
			value := gtk_pos_top_low_level
		end

feature {ANY} -- Queries
	is_gtk_pos_bottom: BOOLEAN is
		do
			Result := (value=gtk_pos_bottom_low_level)
		end

	is_gtk_pos_left: BOOLEAN is
		do
			Result := (value=gtk_pos_left_low_level)
		end

	is_gtk_pos_right: BOOLEAN is
		do
			Result := (value=gtk_pos_right_low_level)
		end

	is_gtk_pos_top: BOOLEAN is
		do
			Result := (value=gtk_pos_top_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_pos_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POS_BOTTOM"
 			}"
 		end

	gtk_pos_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POS_LEFT"
 			}"
 		end

	gtk_pos_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POS_RIGHT"
 			}"
 		end

	gtk_pos_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POS_TOP"
 			}"
 		end


end -- class GTKPOSITIONTYPE_ENUM
