-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_CHOOSER_ACTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_file_chooser_action_create_folder_low_level)  or else
				(a_value = gtk_file_chooser_action_open_low_level)  or else
				(a_value = gtk_file_chooser_action_save_low_level)  or else
				(a_value = gtk_file_chooser_action_select_folder_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_file_chooser_action_create_folder is
		do
			value := gtk_file_chooser_action_create_folder_low_level
		end

	set_gtk_file_chooser_action_open is
		do
			value := gtk_file_chooser_action_open_low_level
		end

	set_gtk_file_chooser_action_save is
		do
			value := gtk_file_chooser_action_save_low_level
		end

	set_gtk_file_chooser_action_select_folder is
		do
			value := gtk_file_chooser_action_select_folder_low_level
		end

feature -- Queries
	is_gtk_file_chooser_action_create_folder: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_action_create_folder_low_level)
		end

	is_gtk_file_chooser_action_open: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_action_open_low_level)
		end

	is_gtk_file_chooser_action_save: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_action_save_low_level)
		end

	is_gtk_file_chooser_action_select_folder: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_action_select_folder_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_file_chooser_action_create_folder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER"
 			}"
 		end

	gtk_file_chooser_action_open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_OPEN"
 			}"
 		end

	gtk_file_chooser_action_save_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_SAVE"
 			}"
 		end

	gtk_file_chooser_action_select_folder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER"
 			}"
 		end


end -- class GTK_FILE_CHOOSER_ACTION_ENUM
