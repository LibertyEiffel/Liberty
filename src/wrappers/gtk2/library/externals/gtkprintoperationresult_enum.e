-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKPRINTOPERATIONRESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_operation_result_apply_low_level)  or else
				(a_value = gtk_print_operation_result_cancel_low_level)  or else
				(a_value = gtk_print_operation_result_error_low_level)  or else
				(a_value = gtk_print_operation_result_in_progress_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_print_operation_result_apply is
		do
			value := gtk_print_operation_result_apply_low_level
		end

	set_gtk_print_operation_result_cancel is
		do
			value := gtk_print_operation_result_cancel_low_level
		end

	set_gtk_print_operation_result_error is
		do
			value := gtk_print_operation_result_error_low_level
		end

	set_gtk_print_operation_result_in_progress is
		do
			value := gtk_print_operation_result_in_progress_low_level
		end

feature {ANY} -- Queries
	is_gtk_print_operation_result_apply: BOOLEAN is
		do
			Result := (value=gtk_print_operation_result_apply_low_level)
		end

	is_gtk_print_operation_result_cancel: BOOLEAN is
		do
			Result := (value=gtk_print_operation_result_cancel_low_level)
		end

	is_gtk_print_operation_result_error: BOOLEAN is
		do
			Result := (value=gtk_print_operation_result_error_low_level)
		end

	is_gtk_print_operation_result_in_progress: BOOLEAN is
		do
			Result := (value=gtk_print_operation_result_in_progress_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_operation_result_apply_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_APPLY"
 			}"
 		end

	gtk_print_operation_result_cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_CANCEL"
 			}"
 		end

	gtk_print_operation_result_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_ERROR"
 			}"
 		end

	gtk_print_operation_result_in_progress_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_RESULT_IN_PROGRESS"
 			}"
 		end


end -- class GTKPRINTOPERATIONRESULT_ENUM
