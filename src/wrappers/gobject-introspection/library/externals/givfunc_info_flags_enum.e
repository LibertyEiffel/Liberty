-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIVFUNC_INFO_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (must_chain_up_low_level | 
				must_not_override_low_level | 
				must_override_low_level | 
				throws_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_must_chain_up is
		do
			value := value.bit_or(must_chain_up_low_level)
		end

	unset_must_chain_up is
		do
			value := value.bit_xor(must_chain_up_low_level)
		end

	set_must_not_override is
		do
			value := value.bit_or(must_not_override_low_level)
		end

	unset_must_not_override is
		do
			value := value.bit_xor(must_not_override_low_level)
		end

	set_must_override is
		do
			value := value.bit_or(must_override_low_level)
		end

	unset_must_override is
		do
			value := value.bit_xor(must_override_low_level)
		end

	set_throws is
		do
			value := value.bit_or(throws_low_level)
		end

	unset_throws is
		do
			value := value.bit_xor(throws_low_level)
		end

feature {ANY} -- Queries
	is_must_chain_up: BOOLEAN is
		do
			Result := (value=must_chain_up_low_level)
		end

	is_must_not_override: BOOLEAN is
		do
			Result := (value=must_not_override_low_level)
		end

	is_must_override: BOOLEAN is
		do
			Result := (value=must_override_low_level)
		end

	is_throws: BOOLEAN is
		do
			Result := (value=throws_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	must_chain_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_MUST_CHAIN_UP"
 			}"
 		end

	must_not_override_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_MUST_NOT_OVERRIDE"
 			}"
 		end

	must_override_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_MUST_OVERRIDE"
 			}"
 		end

	throws_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_THROWS"
 			}"
 		end


end -- class GIVFUNC_INFO_FLAGS_ENUM
