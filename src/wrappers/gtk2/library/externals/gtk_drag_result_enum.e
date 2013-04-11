-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DRAG_RESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = success_low_level)  or else
				(a_value = no_target_low_level)  or else
				(a_value = user_cancelled_low_level)  or else
				(a_value = timeout_expired_low_level)  or else
				(a_value = grab_broken_low_level)  or else
				(a_value = error_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_success is
		do
			value := success_low_level
		end

	set_no_target is
		do
			value := no_target_low_level
		end

	set_user_cancelled is
		do
			value := user_cancelled_low_level
		end

	set_timeout_expired is
		do
			value := timeout_expired_low_level
		end

	set_grab_broken is
		do
			value := grab_broken_low_level
		end

	set_error is
		do
			value := error_low_level
		end

feature {ANY} -- Queries
	success: BOOLEAN is
		do
			Result := (value=success_low_level)
		end

	no_target: BOOLEAN is
		do
			Result := (value=no_target_low_level)
		end

	user_cancelled: BOOLEAN is
		do
			Result := (value=user_cancelled_low_level)
		end

	timeout_expired: BOOLEAN is
		do
			Result := (value=timeout_expired_low_level)
		end

	grab_broken: BOOLEAN is
		do
			Result := (value=grab_broken_low_level)
		end

	error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	success_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_SUCCESS"
 			}"
 		end

	no_target_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_NO_TARGET"
 			}"
 		end

	user_cancelled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_USER_CANCELLED"
 			}"
 		end

	timeout_expired_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_TIMEOUT_EXPIRED"
 			}"
 		end

	grab_broken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_GRAB_BROKEN"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DRAG_RESULT_ERROR"
 			}"
 		end


end -- class GTK_DRAG_RESULT_ENUM
