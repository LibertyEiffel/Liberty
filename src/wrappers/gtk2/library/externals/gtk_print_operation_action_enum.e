-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_OPERATION_ACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = print_dialog_low_level)  or else
				(a_value = print_low_level)  or else
				(a_value = preview_low_level)  or else
				(a_value = export_external_low_level) )
		end

feature -- Setters
	default_create,
	set_print_dialog is
		do
			value := print_dialog_low_level
		end

	set_print is
		do
			value := print_low_level
		end

	set_preview is
		do
			value := preview_low_level
		end

	set_export_external is
		do
			value := export_external_low_level
		end

feature -- Queries
	print_dialog: BOOLEAN is
		do
			Result := (value=print_dialog_low_level)
		end

	print: BOOLEAN is
		do
			Result := (value=print_low_level)
		end

	preview: BOOLEAN is
		do
			Result := (value=preview_low_level)
		end

	export_external: BOOLEAN is
		do
			Result := (value=export_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	print_dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG"
 			}"
 		end

	print_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_PRINT"
 			}"
 		end

	preview_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_PREVIEW"
 			}"
 		end

	export_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_OPERATION_ACTION_EXPORT"
 			}"
 		end


end -- class GTK_PRINT_OPERATION_ACTION_ENUM
