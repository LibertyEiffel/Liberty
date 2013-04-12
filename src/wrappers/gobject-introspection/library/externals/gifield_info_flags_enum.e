-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIFIELD_INFO_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gi_field_is_readable_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gi_field_is_readable is
		do
			value := value.bit_or(gi_field_is_readable_low_level)
		end

	unset_gi_field_is_readable is
		do
			value := value.bit_xor(gi_field_is_readable_low_level)
		end

feature -- Queries
	is_gi_field_is_readable: BOOLEAN is
		do
			Result := (value=gi_field_is_readable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_field_is_readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_FIELD_IS_READABLE"
 			}"
 		end


end -- class GIFIELD_INFO_FLAGS_ENUM
