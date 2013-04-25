-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTYPE_FUNDAMENTAL_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (classed_low_level | 
				derivable_low_level | 
				deep_derivable_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_classed is
		do
			value := value.bit_or(classed_low_level)
		end

	unset_classed is
		do
			value := value.bit_xor(classed_low_level)
		end

	set_derivable is
		do
			value := value.bit_or(derivable_low_level)
		end

	unset_derivable is
		do
			value := value.bit_xor(derivable_low_level)
		end

	set_deep_derivable is
		do
			value := value.bit_or(deep_derivable_low_level)
		end

	unset_deep_derivable is
		do
			value := value.bit_xor(deep_derivable_low_level)
		end

feature {ANY} -- Queries
	is_classed: BOOLEAN is
		do
			Result := (value=classed_low_level)
		end

	is_derivable: BOOLEAN is
		do
			Result := (value=derivable_low_level)
		end

	is_deep_derivable: BOOLEAN is
		do
			Result := (value=deep_derivable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	classed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_CLASSED"
 			}"
 		end

	derivable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_DERIVABLE"
 			}"
 		end

	deep_derivable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TYPE_FLAG_DEEP_DERIVABLE"
 			}"
 		end


end -- class GTYPE_FUNDAMENTAL_FLAGS_ENUM
