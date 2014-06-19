-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTYPE_FUNDAMENTAL_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_type_flag_classed_low_level | 
				g_type_flag_derivable_low_level | 
				g_type_flag_instantiatable_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_type_flag_classed
		do
			value := value.bit_or(g_type_flag_classed_low_level)
		end

	unset_g_type_flag_classed
		do
			value := value.bit_xor(g_type_flag_classed_low_level)
		end

	set_g_type_flag_derivable
		do
			value := value.bit_or(g_type_flag_derivable_low_level)
		end

	unset_g_type_flag_derivable
		do
			value := value.bit_xor(g_type_flag_derivable_low_level)
		end

	set_g_type_flag_instantiatable
		do
			value := value.bit_or(g_type_flag_instantiatable_low_level)
		end

	unset_g_type_flag_instantiatable
		do
			value := value.bit_xor(g_type_flag_instantiatable_low_level)
		end

feature {ANY} -- Queries
	is_g_type_flag_classed: BOOLEAN
		do
			Result := (value=g_type_flag_classed_low_level)
		end

	is_g_type_flag_derivable: BOOLEAN
		do
			Result := (value=g_type_flag_derivable_low_level)
		end

	is_g_type_flag_instantiatable: BOOLEAN
		do
			Result := (value=g_type_flag_instantiatable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_flag_classed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_CLASSED"
 			}"
 		end

	g_type_flag_derivable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_DERIVABLE"
 			}"
 		end

	g_type_flag_instantiatable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_INSTANTIATABLE"
 			}"
 		end


end -- class GTYPE_FUNDAMENTAL_FLAGS_ENUM
