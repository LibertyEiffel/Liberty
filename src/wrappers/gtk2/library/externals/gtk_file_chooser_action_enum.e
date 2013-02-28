-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_CHOOSER_ACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = open_low_level)  or else
				(a_value = save_low_level)  or else
				(a_value = select_folder_low_level)  or else
				(a_value = create_folder_low_level) )
		end

feature -- Setters
	default_create,
	set_open is
		do
			value := open_low_level
		end

	set_save is
		do
			value := save_low_level
		end

	set_select_folder is
		do
			value := select_folder_low_level
		end

	set_create_folder is
		do
			value := create_folder_low_level
		end

feature -- Queries
	open: BOOLEAN is
		do
			Result := (value=open_low_level)
		end

	save: BOOLEAN is
		do
			Result := (value=save_low_level)
		end

	select_folder: BOOLEAN is
		do
			Result := (value=select_folder_low_level)
		end

	create_folder: BOOLEAN is
		do
			Result := (value=create_folder_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_OPEN"
 			}"
 		end

	save_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_SAVE"
 			}"
 		end

	select_folder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER"
 			}"
 		end

	create_folder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER"
 			}"
 		end


end -- class GTK_FILE_CHOOSER_ACTION_ENUM
