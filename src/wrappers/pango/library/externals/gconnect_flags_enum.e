-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONNECT_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (after_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_after is
		do
			value := value.bit_or(after_low_level)
		end

	unset_after is
		do
			value := value.bit_xor(after_low_level)
		end

feature {ANY} -- Queries
	is_after: BOOLEAN is
		do
			Result := (value=after_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_CONNECT_AFTER"
 			}"
 		end


end -- class GCONNECT_FLAGS_ENUM
