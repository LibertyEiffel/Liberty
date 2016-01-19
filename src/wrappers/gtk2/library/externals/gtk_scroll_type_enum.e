-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SCROLL_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_scroll_end_low_level)  or else
				(a_value = gtk_scroll_jump_low_level)  or else
				(a_value = gtk_scroll_none_low_level)  or else
				(a_value = gtk_scroll_page_backward_low_level)  or else
				(a_value = gtk_scroll_page_down_low_level)  or else
				(a_value = gtk_scroll_page_forward_low_level)  or else
				(a_value = gtk_scroll_page_left_low_level)  or else
				(a_value = gtk_scroll_page_right_low_level)  or else
				(a_value = gtk_scroll_page_up_low_level)  or else
				(a_value = gtk_scroll_start_low_level)  or else
				(a_value = gtk_scroll_step_backward_low_level)  or else
				(a_value = gtk_scroll_step_down_low_level)  or else
				(a_value = gtk_scroll_step_forward_low_level)  or else
				(a_value = gtk_scroll_step_left_low_level)  or else
				(a_value = gtk_scroll_step_right_low_level)  or else
				(a_value = gtk_scroll_step_up_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_scroll_end is
		do
			value := gtk_scroll_end_low_level
		end

	set_gtk_scroll_jump is
		do
			value := gtk_scroll_jump_low_level
		end

	set_gtk_scroll_none is
		do
			value := gtk_scroll_none_low_level
		end

	set_gtk_scroll_page_backward is
		do
			value := gtk_scroll_page_backward_low_level
		end

	set_gtk_scroll_page_down is
		do
			value := gtk_scroll_page_down_low_level
		end

	set_gtk_scroll_page_forward is
		do
			value := gtk_scroll_page_forward_low_level
		end

	set_gtk_scroll_page_left is
		do
			value := gtk_scroll_page_left_low_level
		end

	set_gtk_scroll_page_right is
		do
			value := gtk_scroll_page_right_low_level
		end

	set_gtk_scroll_page_up is
		do
			value := gtk_scroll_page_up_low_level
		end

	set_gtk_scroll_start is
		do
			value := gtk_scroll_start_low_level
		end

	set_gtk_scroll_step_backward is
		do
			value := gtk_scroll_step_backward_low_level
		end

	set_gtk_scroll_step_down is
		do
			value := gtk_scroll_step_down_low_level
		end

	set_gtk_scroll_step_forward is
		do
			value := gtk_scroll_step_forward_low_level
		end

	set_gtk_scroll_step_left is
		do
			value := gtk_scroll_step_left_low_level
		end

	set_gtk_scroll_step_right is
		do
			value := gtk_scroll_step_right_low_level
		end

	set_gtk_scroll_step_up is
		do
			value := gtk_scroll_step_up_low_level
		end

feature -- Queries
	is_gtk_scroll_end: BOOLEAN is
		do
			Result := (value=gtk_scroll_end_low_level)
		end

	is_gtk_scroll_jump: BOOLEAN is
		do
			Result := (value=gtk_scroll_jump_low_level)
		end

	is_gtk_scroll_none: BOOLEAN is
		do
			Result := (value=gtk_scroll_none_low_level)
		end

	is_gtk_scroll_page_backward: BOOLEAN is
		do
			Result := (value=gtk_scroll_page_backward_low_level)
		end

	is_gtk_scroll_page_down: BOOLEAN is
		do
			Result := (value=gtk_scroll_page_down_low_level)
		end

	is_gtk_scroll_page_forward: BOOLEAN is
		do
			Result := (value=gtk_scroll_page_forward_low_level)
		end

	is_gtk_scroll_page_left: BOOLEAN is
		do
			Result := (value=gtk_scroll_page_left_low_level)
		end

	is_gtk_scroll_page_right: BOOLEAN is
		do
			Result := (value=gtk_scroll_page_right_low_level)
		end

	is_gtk_scroll_page_up: BOOLEAN is
		do
			Result := (value=gtk_scroll_page_up_low_level)
		end

	is_gtk_scroll_start: BOOLEAN is
		do
			Result := (value=gtk_scroll_start_low_level)
		end

	is_gtk_scroll_step_backward: BOOLEAN is
		do
			Result := (value=gtk_scroll_step_backward_low_level)
		end

	is_gtk_scroll_step_down: BOOLEAN is
		do
			Result := (value=gtk_scroll_step_down_low_level)
		end

	is_gtk_scroll_step_forward: BOOLEAN is
		do
			Result := (value=gtk_scroll_step_forward_low_level)
		end

	is_gtk_scroll_step_left: BOOLEAN is
		do
			Result := (value=gtk_scroll_step_left_low_level)
		end

	is_gtk_scroll_step_right: BOOLEAN is
		do
			Result := (value=gtk_scroll_step_right_low_level)
		end

	is_gtk_scroll_step_up: BOOLEAN is
		do
			Result := (value=gtk_scroll_step_up_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_scroll_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_END"
 			}"
 		end

	gtk_scroll_jump_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_JUMP"
 			}"
 		end

	gtk_scroll_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_NONE"
 			}"
 		end

	gtk_scroll_page_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_BACKWARD"
 			}"
 		end

	gtk_scroll_page_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_DOWN"
 			}"
 		end

	gtk_scroll_page_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_FORWARD"
 			}"
 		end

	gtk_scroll_page_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_LEFT"
 			}"
 		end

	gtk_scroll_page_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_RIGHT"
 			}"
 		end

	gtk_scroll_page_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGE_UP"
 			}"
 		end

	gtk_scroll_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_START"
 			}"
 		end

	gtk_scroll_step_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_BACKWARD"
 			}"
 		end

	gtk_scroll_step_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_DOWN"
 			}"
 		end

	gtk_scroll_step_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_FORWARD"
 			}"
 		end

	gtk_scroll_step_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_LEFT"
 			}"
 		end

	gtk_scroll_step_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_RIGHT"
 			}"
 		end

	gtk_scroll_step_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEP_UP"
 			}"
 		end


end -- class GTK_SCROLL_TYPE_ENUM
