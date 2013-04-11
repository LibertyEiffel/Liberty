-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GRESOURCE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = compressed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_compressed is
		do
			value := compressed_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	compressed: BOOLEAN is
		do
			Result := (value=compressed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOURCE_FLAGS_NONE"
 			}"
 		end

	compressed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOURCE_FLAGS_COMPRESSED"
 			}"
 		end


end -- class GRESOURCE_FLAGS_ENUM
