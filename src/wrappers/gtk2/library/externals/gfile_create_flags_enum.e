-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_CREATE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_create_none_low_level)  or else
				(a_value = g_file_create_private_low_level)  or else
				(a_value = g_file_create_replace_destination_low_level) )
		end

feature -- Setters
	default_create,
	set_g_file_create_none is
		do
			value := g_file_create_none_low_level
		end

	set_g_file_create_private is
		do
			value := g_file_create_private_low_level
		end

	set_g_file_create_replace_destination is
		do
			value := g_file_create_replace_destination_low_level
		end

feature -- Queries
	is_g_file_create_none: BOOLEAN is
		do
			Result := (value=g_file_create_none_low_level)
		end

	is_g_file_create_private: BOOLEAN is
		do
			Result := (value=g_file_create_private_low_level)
		end

	is_g_file_create_replace_destination: BOOLEAN is
		do
			Result := (value=g_file_create_replace_destination_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_create_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_CREATE_NONE"
 			}"
 		end

	g_file_create_private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_CREATE_PRIVATE"
 			}"
 		end

	g_file_create_replace_destination_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_CREATE_REPLACE_DESTINATION"
 			}"
 		end


end -- class GFILE_CREATE_FLAGS_ENUM
