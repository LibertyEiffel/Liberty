-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SPIN_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = step_forward_low_level)  or else
				(a_value = step_backward_low_level)  or else
				(a_value = page_forward_low_level)  or else
				(a_value = page_backward_low_level)  or else
				(a_value = home_low_level)  or else
				(a_value = end_external_low_level)  or else
				(a_value = user_defined_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_step_forward is
		do
			value := step_forward_low_level
		end

	set_step_backward is
		do
			value := step_backward_low_level
		end

	set_page_forward is
		do
			value := page_forward_low_level
		end

	set_page_backward is
		do
			value := page_backward_low_level
		end

	set_home is
		do
			value := home_low_level
		end

	set_end_external is
		do
			value := end_external_low_level
		end

	set_user_defined is
		do
			value := user_defined_low_level
		end

feature {ANY} -- Queries
	step_forward: BOOLEAN is
		do
			Result := (value=step_forward_low_level)
		end

	step_backward: BOOLEAN is
		do
			Result := (value=step_backward_low_level)
		end

	page_forward: BOOLEAN is
		do
			Result := (value=page_forward_low_level)
		end

	page_backward: BOOLEAN is
		do
			Result := (value=page_backward_low_level)
		end

	home: BOOLEAN is
		do
			Result := (value=home_low_level)
		end

	end_external: BOOLEAN is
		do
			Result := (value=end_external_low_level)
		end

	user_defined: BOOLEAN is
		do
			Result := (value=user_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	step_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_STEP_FORWARD"
 			}"
 		end

	step_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_STEP_BACKWARD"
 			}"
 		end

	page_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_PAGE_FORWARD"
 			}"
 		end

	page_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_PAGE_BACKWARD"
 			}"
 		end

	home_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_HOME"
 			}"
 		end

	end_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_END"
 			}"
 		end

	user_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_USER_DEFINED"
 			}"
 		end


end -- class GTK_SPIN_TYPE_ENUM
