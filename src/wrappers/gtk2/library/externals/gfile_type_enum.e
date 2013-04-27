-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_type_directory_low_level)  or else
				(a_value = g_file_type_mountable_low_level)  or else
				(a_value = g_file_type_regular_low_level)  or else
				(a_value = g_file_type_shortcut_low_level)  or else
				(a_value = g_file_type_special_low_level)  or else
				(a_value = g_file_type_symbolic_link_low_level)  or else
				(a_value = g_file_type_unknown_low_level) )
		end

feature -- Setters
	default_create,
	set_g_file_type_directory is
		do
			value := g_file_type_directory_low_level
		end

	set_g_file_type_mountable is
		do
			value := g_file_type_mountable_low_level
		end

	set_g_file_type_regular is
		do
			value := g_file_type_regular_low_level
		end

	set_g_file_type_shortcut is
		do
			value := g_file_type_shortcut_low_level
		end

	set_g_file_type_special is
		do
			value := g_file_type_special_low_level
		end

	set_g_file_type_symbolic_link is
		do
			value := g_file_type_symbolic_link_low_level
		end

	set_g_file_type_unknown is
		do
			value := g_file_type_unknown_low_level
		end

feature -- Queries
	is_g_file_type_directory: BOOLEAN is
		do
			Result := (value=g_file_type_directory_low_level)
		end

	is_g_file_type_mountable: BOOLEAN is
		do
			Result := (value=g_file_type_mountable_low_level)
		end

	is_g_file_type_regular: BOOLEAN is
		do
			Result := (value=g_file_type_regular_low_level)
		end

	is_g_file_type_shortcut: BOOLEAN is
		do
			Result := (value=g_file_type_shortcut_low_level)
		end

	is_g_file_type_special: BOOLEAN is
		do
			Result := (value=g_file_type_special_low_level)
		end

	is_g_file_type_symbolic_link: BOOLEAN is
		do
			Result := (value=g_file_type_symbolic_link_low_level)
		end

	is_g_file_type_unknown: BOOLEAN is
		do
			Result := (value=g_file_type_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_type_directory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_DIRECTORY"
 			}"
 		end

	g_file_type_mountable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_MOUNTABLE"
 			}"
 		end

	g_file_type_regular_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_REGULAR"
 			}"
 		end

	g_file_type_shortcut_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_SHORTCUT"
 			}"
 		end

	g_file_type_special_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_SPECIAL"
 			}"
 		end

	g_file_type_symbolic_link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_SYMBOLIC_LINK"
 			}"
 		end

	g_file_type_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_UNKNOWN"
 			}"
 		end


end -- class GFILE_TYPE_ENUM
