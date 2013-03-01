-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DIRECTION_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = tab_forward_low_level)  or else
				(a_value = tab_backward_low_level)  or else
				(a_value = up_low_level)  or else
				(a_value = down_low_level)  or else
				(a_value = left_low_level)  or else
				(a_value = right_low_level) )
		end

feature -- Setters
	default_create,
	set_tab_forward is
		do
			value := tab_forward_low_level
		end

	set_tab_backward is
		do
			value := tab_backward_low_level
		end

	set_up is
		do
			value := up_low_level
		end

	set_down is
		do
			value := down_low_level
		end

	set_left is
		do
			value := left_low_level
		end

	set_right is
		do
			value := right_low_level
		end

feature -- Queries
	tab_forward: BOOLEAN is
		do
			Result := (value=tab_forward_low_level)
		end

	tab_backward: BOOLEAN is
		do
			Result := (value=tab_backward_low_level)
		end

	up: BOOLEAN is
		do
			Result := (value=up_low_level)
		end

	down: BOOLEAN is
		do
			Result := (value=down_low_level)
		end

	left: BOOLEAN is
		do
			Result := (value=left_low_level)
		end

	right: BOOLEAN is
		do
			Result := (value=right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	tab_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_TAB_FORWARD"
 			}"
 		end

	tab_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_TAB_BACKWARD"
 			}"
 		end

	up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_UP"
 			}"
 		end

	down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_DOWN"
 			}"
 		end

	left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_LEFT"
 			}"
 		end

	right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_RIGHT"
 			}"
 		end


end -- class GTK_DIRECTION_TYPE_ENUM
