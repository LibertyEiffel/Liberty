-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILEATTRIBUTEINFOFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_attribute_info_copy_when_moved_low_level)  or else
				(a_value = g_file_attribute_info_copy_with_file_low_level)  or else
				(a_value = g_file_attribute_info_none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_file_attribute_info_copy_when_moved is
		do
			value := g_file_attribute_info_copy_when_moved_low_level
		end

	set_g_file_attribute_info_copy_with_file is
		do
			value := g_file_attribute_info_copy_with_file_low_level
		end

	set_g_file_attribute_info_none is
		do
			value := g_file_attribute_info_none_low_level
		end

feature {ANY} -- Queries
	is_g_file_attribute_info_copy_when_moved: BOOLEAN is
		do
			Result := (value=g_file_attribute_info_copy_when_moved_low_level)
		end

	is_g_file_attribute_info_copy_with_file: BOOLEAN is
		do
			Result := (value=g_file_attribute_info_copy_with_file_low_level)
		end

	is_g_file_attribute_info_none: BOOLEAN is
		do
			Result := (value=g_file_attribute_info_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_attribute_info_copy_when_moved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_INFO_COPY_WHEN_MOVED"
 			}"
 		end

	g_file_attribute_info_copy_with_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_INFO_COPY_WITH_FILE"
 			}"
 		end

	g_file_attribute_info_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_INFO_NONE"
 			}"
 		end


end -- class GFILEATTRIBUTEINFOFLAGS_ENUM
