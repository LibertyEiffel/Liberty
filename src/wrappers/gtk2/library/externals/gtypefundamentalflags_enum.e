-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTYPEFUNDAMENTALFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_type_flag_classed_low_level | 
				g_type_flag_derivable_low_level | 
				g_type_flag_instantiatable_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_type_flag_classed is
		do
			value := value.bit_or(g_type_flag_classed_low_level)
		end

	unset_g_type_flag_classed is
		do
			value := value.bit_xor(g_type_flag_classed_low_level)
		end

	set_g_type_flag_derivable is
		do
			value := value.bit_or(g_type_flag_derivable_low_level)
		end

	unset_g_type_flag_derivable is
		do
			value := value.bit_xor(g_type_flag_derivable_low_level)
		end

	set_g_type_flag_instantiatable is
		do
			value := value.bit_or(g_type_flag_instantiatable_low_level)
		end

	unset_g_type_flag_instantiatable is
		do
			value := value.bit_xor(g_type_flag_instantiatable_low_level)
		end

feature {ANY} -- Queries
	is_g_type_flag_classed: BOOLEAN is
		do
			Result := (value=g_type_flag_classed_low_level)
		end

	is_g_type_flag_derivable: BOOLEAN is
		do
			Result := (value=g_type_flag_derivable_low_level)
		end

	is_g_type_flag_instantiatable: BOOLEAN is
		do
			Result := (value=g_type_flag_instantiatable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_flag_classed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_CLASSED"
 			}"
 		end

	g_type_flag_derivable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_DERIVABLE"
 			}"
 		end

	g_type_flag_instantiatable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_INSTANTIATABLE"
 			}"
 		end


end -- class GTYPEFUNDAMENTALFLAGS_ENUM
