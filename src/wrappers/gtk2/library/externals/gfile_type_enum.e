-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown_low_level)  or else
				(a_value = regular_low_level)  or else
				(a_value = directory_low_level)  or else
				(a_value = symbolic_link_low_level)  or else
				(a_value = special_low_level)  or else
				(a_value = shortcut_low_level)  or else
				(a_value = mountable_low_level) )
		end

feature -- Setters
	default_create,
	set_unknown is
		do
			value := unknown_low_level
		end

	set_regular is
		do
			value := regular_low_level
		end

	set_directory is
		do
			value := directory_low_level
		end

	set_symbolic_link is
		do
			value := symbolic_link_low_level
		end

	set_special is
		do
			value := special_low_level
		end

	set_shortcut is
		do
			value := shortcut_low_level
		end

	set_mountable is
		do
			value := mountable_low_level
		end

feature -- Queries
	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	regular: BOOLEAN is
		do
			Result := (value=regular_low_level)
		end

	directory: BOOLEAN is
		do
			Result := (value=directory_low_level)
		end

	symbolic_link: BOOLEAN is
		do
			Result := (value=symbolic_link_low_level)
		end

	special: BOOLEAN is
		do
			Result := (value=special_low_level)
		end

	shortcut: BOOLEAN is
		do
			Result := (value=shortcut_low_level)
		end

	mountable: BOOLEAN is
		do
			Result := (value=mountable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_UNKNOWN"
 			}"
 		end

	regular_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_REGULAR"
 			}"
 		end

	directory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_DIRECTORY"
 			}"
 		end

	symbolic_link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_SYMBOLIC_LINK"
 			}"
 		end

	special_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_SPECIAL"
 			}"
 		end

	shortcut_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_SHORTCUT"
 			}"
 		end

	mountable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_TYPE_MOUNTABLE"
 			}"
 		end


end -- class GFILE_TYPE_ENUM
