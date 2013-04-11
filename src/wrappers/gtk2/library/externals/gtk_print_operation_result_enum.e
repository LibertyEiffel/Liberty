-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_OPERATION_RESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = error_low_level)  or else
				(a_value = apply_low_level)  or else
				(a_value = cancel_low_level)  or else
				(a_value = in_progress_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_error is
		do
			value := error_low_level
		end

	set_apply is
		do
			value := apply_low_level
		end

	set_cancel is
		do
			value := cancel_low_level
		end

	set_in_progress is
		do
			value := in_progress_low_level
		end

feature {ANY} -- Queries
	error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	apply: BOOLEAN is
		do
			Result := (value=apply_low_level)
		end

	cancel: BOOLEAN is
		do
			Result := (value=cancel_low_level)
		end

	in_progress: BOOLEAN is
		do
			Result := (value=in_progress_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_ERROR"
 			}"
 		end

	apply_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_APPLY"
 			}"
 		end

	cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_CANCEL"
 			}"
 		end

	in_progress_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_IN_PROGRESS"
 			}"
 		end


end -- class GTK_PRINT_OPERATION_RESULT_ENUM
