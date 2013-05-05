-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIVFUNC_INFO_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gi_vfunc_must_chain_up_low_level | 
				gi_vfunc_must_override_low_level | 
				gi_vfunc_throws_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gi_vfunc_must_chain_up is
		do
			value := value.bit_or(gi_vfunc_must_chain_up_low_level)
		end

	unset_gi_vfunc_must_chain_up is
		do
			value := value.bit_xor(gi_vfunc_must_chain_up_low_level)
		end

	set_gi_vfunc_must_override is
		do
			value := value.bit_or(gi_vfunc_must_override_low_level)
		end

	unset_gi_vfunc_must_override is
		do
			value := value.bit_xor(gi_vfunc_must_override_low_level)
		end

	set_gi_vfunc_throws is
		do
			value := value.bit_or(gi_vfunc_throws_low_level)
		end

	unset_gi_vfunc_throws is
		do
			value := value.bit_xor(gi_vfunc_throws_low_level)
		end

feature -- Queries
	is_gi_vfunc_must_chain_up: BOOLEAN is
		do
			Result := (value=gi_vfunc_must_chain_up_low_level)
		end

	is_gi_vfunc_must_override: BOOLEAN is
		do
			Result := (value=gi_vfunc_must_override_low_level)
		end

	is_gi_vfunc_throws: BOOLEAN is
		do
			Result := (value=gi_vfunc_throws_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_vfunc_must_chain_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_MUST_CHAIN_UP"
 			}"
 		end

	gi_vfunc_must_override_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_MUST_OVERRIDE"
 			}"
 		end

	gi_vfunc_throws_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_VFUNC_THROWS"
 			}"
 		end


end -- class GIVFUNC_INFO_FLAGS_ENUM
