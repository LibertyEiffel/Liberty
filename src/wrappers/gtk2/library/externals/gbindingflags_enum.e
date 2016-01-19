-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBINDINGFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_binding_bidirectional_low_level)  or else
				(a_value = g_binding_default_low_level)  or else
				(a_value = g_binding_invert_boolean_low_level)  or else
				(a_value = g_binding_sync_create_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_binding_bidirectional is
		do
			value := g_binding_bidirectional_low_level
		end

	set_g_binding_default is
		do
			value := g_binding_default_low_level
		end

	set_g_binding_invert_boolean is
		do
			value := g_binding_invert_boolean_low_level
		end

	set_g_binding_sync_create is
		do
			value := g_binding_sync_create_low_level
		end

feature {ANY} -- Queries
	is_g_binding_bidirectional: BOOLEAN is
		do
			Result := (value=g_binding_bidirectional_low_level)
		end

	is_g_binding_default: BOOLEAN is
		do
			Result := (value=g_binding_default_low_level)
		end

	is_g_binding_invert_boolean: BOOLEAN is
		do
			Result := (value=g_binding_invert_boolean_low_level)
		end

	is_g_binding_sync_create: BOOLEAN is
		do
			Result := (value=g_binding_sync_create_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_binding_bidirectional_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_BIDIRECTIONAL"
 			}"
 		end

	g_binding_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_DEFAULT"
 			}"
 		end

	g_binding_invert_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_INVERT_BOOLEAN"
 			}"
 		end

	g_binding_sync_create_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BINDING_SYNC_CREATE"
 			}"
 		end


end -- class GBINDINGFLAGS_ENUM
