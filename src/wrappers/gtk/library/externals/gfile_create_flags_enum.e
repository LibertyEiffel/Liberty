-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_CREATE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = private_low_level)  or else
				(a_value = replace_destination_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_private is
		do
			value := private_low_level
		end

	set_replace_destination is
		do
			value := replace_destination_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_private: BOOLEAN is
		do
			Result := (value=private_low_level)
		end

	is_replace_destination: BOOLEAN is
		do
			Result := (value=replace_destination_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_CREATE_NONE"
 			}"
 		end

	private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_CREATE_PRIVATE"
 			}"
 		end

	replace_destination_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_CREATE_REPLACE_DESTINATION"
 			}"
 		end


end -- class GFILE_CREATE_FLAGS_ENUM
