-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBINDING_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_external_low_level)  or else
				(a_value = bidirectional_low_level)  or else
				(a_value = sync_create_low_level)  or else
				(a_value = invert_boolean_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_external is
		do
			value := default_external_low_level
		end

	set_bidirectional is
		do
			value := bidirectional_low_level
		end

	set_sync_create is
		do
			value := sync_create_low_level
		end

	set_invert_boolean is
		do
			value := invert_boolean_low_level
		end

feature {ANY} -- Queries
	default_external: BOOLEAN is
		do
			Result := (value=default_external_low_level)
		end

	bidirectional: BOOLEAN is
		do
			Result := (value=bidirectional_low_level)
		end

	sync_create: BOOLEAN is
		do
			Result := (value=sync_create_low_level)
		end

	invert_boolean: BOOLEAN is
		do
			Result := (value=invert_boolean_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_DEFAULT"
 			}"
 		end

	bidirectional_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_BIDIRECTIONAL"
 			}"
 		end

	sync_create_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_SYNC_CREATE"
 			}"
 		end

	invert_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_INVERT_BOOLEAN"
 			}"
 		end


end -- class GBINDING_FLAGS_ENUM
