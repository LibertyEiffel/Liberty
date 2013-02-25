-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_CHOOSER_CONFIRMATION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = confirm_low_level)  or else
				(a_value = accept_filename_low_level)  or else
				(a_value = select_again_low_level) )
		end

feature -- Setters
	default_create,
	set_confirm is
		do
			value := confirm_low_level
		end

	set_accept_filename is
		do
			value := accept_filename_low_level
		end

	set_select_again is
		do
			value := select_again_low_level
		end

feature -- Queries
	confirm: BOOLEAN is
		do
			Result := (value=confirm_low_level)
		end

	accept_filename: BOOLEAN is
		do
			Result := (value=accept_filename_low_level)
		end

	select_again: BOOLEAN is
		do
			Result := (value=select_again_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	confirm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM"
 			}"
 		end

	accept_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME"
 			}"
 		end

	select_again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN"
 			}"
 		end


end -- class GTK_FILE_CHOOSER_CONFIRMATION_ENUM
