-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTYPEFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_type_flag_abstract_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_type_flag_abstract is
		do
			value := value.bit_or(g_type_flag_abstract_low_level)
		end

	unset_g_type_flag_abstract is
		do
			value := value.bit_xor(g_type_flag_abstract_low_level)
		end

feature {ANY} -- Queries
	is_g_type_flag_abstract: BOOLEAN is
		do
			Result := (value=g_type_flag_abstract_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_flag_abstract_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_ABSTRACT"
 			}"
 		end


end -- class GTYPEFLAGS_ENUM
