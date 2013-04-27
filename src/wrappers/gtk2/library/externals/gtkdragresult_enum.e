-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKDRAGRESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_drag_result_error_low_level)  or else
				(a_value = gtk_drag_result_grab_broken_low_level)  or else
				(a_value = gtk_drag_result_no_target_low_level)  or else
				(a_value = gtk_drag_result_success_low_level)  or else
				(a_value = gtk_drag_result_timeout_expired_low_level)  or else
				(a_value = gtk_drag_result_user_cancelled_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_drag_result_error is
		do
			value := gtk_drag_result_error_low_level
		end

	set_gtk_drag_result_grab_broken is
		do
			value := gtk_drag_result_grab_broken_low_level
		end

	set_gtk_drag_result_no_target is
		do
			value := gtk_drag_result_no_target_low_level
		end

	set_gtk_drag_result_success is
		do
			value := gtk_drag_result_success_low_level
		end

	set_gtk_drag_result_timeout_expired is
		do
			value := gtk_drag_result_timeout_expired_low_level
		end

	set_gtk_drag_result_user_cancelled is
		do
			value := gtk_drag_result_user_cancelled_low_level
		end

feature {ANY} -- Queries
	is_gtk_drag_result_error: BOOLEAN is
		do
			Result := (value=gtk_drag_result_error_low_level)
		end

	is_gtk_drag_result_grab_broken: BOOLEAN is
		do
			Result := (value=gtk_drag_result_grab_broken_low_level)
		end

	is_gtk_drag_result_no_target: BOOLEAN is
		do
			Result := (value=gtk_drag_result_no_target_low_level)
		end

	is_gtk_drag_result_success: BOOLEAN is
		do
			Result := (value=gtk_drag_result_success_low_level)
		end

	is_gtk_drag_result_timeout_expired: BOOLEAN is
		do
			Result := (value=gtk_drag_result_timeout_expired_low_level)
		end

	is_gtk_drag_result_user_cancelled: BOOLEAN is
		do
			Result := (value=gtk_drag_result_user_cancelled_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_drag_result_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_ERROR"
 			}"
 		end

	gtk_drag_result_grab_broken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_GRAB_BROKEN"
 			}"
 		end

	gtk_drag_result_no_target_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_NO_TARGET"
 			}"
 		end

	gtk_drag_result_success_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_SUCCESS"
 			}"
 		end

	gtk_drag_result_timeout_expired_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_TIMEOUT_EXPIRED"
 			}"
 		end

	gtk_drag_result_user_cancelled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_USER_CANCELLED"
 			}"
 		end


end -- class GTKDRAGRESULT_ENUM
