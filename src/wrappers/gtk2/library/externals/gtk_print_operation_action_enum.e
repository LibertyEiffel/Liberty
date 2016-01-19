-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_OPERATION_ACTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_operation_action_export_low_level)  or else
				(a_value = gtk_print_operation_action_preview_low_level)  or else
				(a_value = gtk_print_operation_action_print_low_level)  or else
				(a_value = gtk_print_operation_action_print_dialog_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_print_operation_action_export is
		do
			value := gtk_print_operation_action_export_low_level
		end

	set_gtk_print_operation_action_preview is
		do
			value := gtk_print_operation_action_preview_low_level
		end

	set_gtk_print_operation_action_print is
		do
			value := gtk_print_operation_action_print_low_level
		end

	set_gtk_print_operation_action_print_dialog is
		do
			value := gtk_print_operation_action_print_dialog_low_level
		end

feature -- Queries
	is_gtk_print_operation_action_export: BOOLEAN is
		do
			Result := (value=gtk_print_operation_action_export_low_level)
		end

	is_gtk_print_operation_action_preview: BOOLEAN is
		do
			Result := (value=gtk_print_operation_action_preview_low_level)
		end

	is_gtk_print_operation_action_print: BOOLEAN is
		do
			Result := (value=gtk_print_operation_action_print_low_level)
		end

	is_gtk_print_operation_action_print_dialog: BOOLEAN is
		do
			Result := (value=gtk_print_operation_action_print_dialog_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_operation_action_export_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_EXPORT"
 			}"
 		end

	gtk_print_operation_action_preview_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_PREVIEW"
 			}"
 		end

	gtk_print_operation_action_print_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_PRINT"
 			}"
 		end

	gtk_print_operation_action_print_dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG"
 			}"
 		end


end -- class GTK_PRINT_OPERATION_ACTION_ENUM
