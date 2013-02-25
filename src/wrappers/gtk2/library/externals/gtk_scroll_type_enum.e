-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SCROLL_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = jump_low_level)  or else
				(a_value = step_backward_low_level)  or else
				(a_value = step_forward_low_level)  or else
				(a_value = page_backward_low_level)  or else
				(a_value = page_forward_low_level)  or else
				(a_value = step_up_low_level)  or else
				(a_value = step_down_low_level)  or else
				(a_value = page_up_low_level)  or else
				(a_value = page_down_low_level)  or else
				(a_value = step_left_low_level)  or else
				(a_value = step_right_low_level)  or else
				(a_value = page_left_low_level)  or else
				(a_value = page_right_low_level)  or else
				(a_value = start_low_level)  or else
				(a_value = end_external_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_jump is
		do
			value := jump_low_level
		end

	set_step_backward is
		do
			value := step_backward_low_level
		end

	set_step_forward is
		do
			value := step_forward_low_level
		end

	set_page_backward is
		do
			value := page_backward_low_level
		end

	set_page_forward is
		do
			value := page_forward_low_level
		end

	set_step_up is
		do
			value := step_up_low_level
		end

	set_step_down is
		do
			value := step_down_low_level
		end

	set_page_up is
		do
			value := page_up_low_level
		end

	set_page_down is
		do
			value := page_down_low_level
		end

	set_step_left is
		do
			value := step_left_low_level
		end

	set_step_right is
		do
			value := step_right_low_level
		end

	set_page_left is
		do
			value := page_left_low_level
		end

	set_page_right is
		do
			value := page_right_low_level
		end

	set_start is
		do
			value := start_low_level
		end

	set_end_external is
		do
			value := end_external_low_level
		end

feature -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	jump: BOOLEAN is
		do
			Result := (value=jump_low_level)
		end

	step_backward: BOOLEAN is
		do
			Result := (value=step_backward_low_level)
		end

	step_forward: BOOLEAN is
		do
			Result := (value=step_forward_low_level)
		end

	page_backward: BOOLEAN is
		do
			Result := (value=page_backward_low_level)
		end

	page_forward: BOOLEAN is
		do
			Result := (value=page_forward_low_level)
		end

	step_up: BOOLEAN is
		do
			Result := (value=step_up_low_level)
		end

	step_down: BOOLEAN is
		do
			Result := (value=step_down_low_level)
		end

	page_up: BOOLEAN is
		do
			Result := (value=page_up_low_level)
		end

	page_down: BOOLEAN is
		do
			Result := (value=page_down_low_level)
		end

	step_left: BOOLEAN is
		do
			Result := (value=step_left_low_level)
		end

	step_right: BOOLEAN is
		do
			Result := (value=step_right_low_level)
		end

	page_left: BOOLEAN is
		do
			Result := (value=page_left_low_level)
		end

	page_right: BOOLEAN is
		do
			Result := (value=page_right_low_level)
		end

	start: BOOLEAN is
		do
			Result := (value=start_low_level)
		end

	end_external: BOOLEAN is
		do
			Result := (value=end_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_NONE"
 			}"
 		end

	jump_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_JUMP"
 			}"
 		end

	step_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_BACKWARD"
 			}"
 		end

	step_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_FORWARD"
 			}"
 		end

	page_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_BACKWARD"
 			}"
 		end

	page_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_FORWARD"
 			}"
 		end

	step_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_UP"
 			}"
 		end

	step_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_DOWN"
 			}"
 		end

	page_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_UP"
 			}"
 		end

	page_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_DOWN"
 			}"
 		end

	step_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_LEFT"
 			}"
 		end

	step_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_RIGHT"
 			}"
 		end

	page_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_LEFT"
 			}"
 		end

	page_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_RIGHT"
 			}"
 		end

	start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_START"
 			}"
 		end

	end_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_END"
 			}"
 		end


end -- class GTK_SCROLL_TYPE_ENUM
