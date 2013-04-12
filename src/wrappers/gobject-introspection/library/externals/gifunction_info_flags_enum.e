-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIFUNCTION_INFO_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gi_function_is_constructor_low_level | 
				gi_function_is_method_low_level | 
				gi_function_is_setter_low_level | 
				gi_function_throws_low_level | 
				gi_function_wraps_vfunc_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gi_function_is_constructor is
		do
			value := value.bit_or(gi_function_is_constructor_low_level)
		end

	unset_gi_function_is_constructor is
		do
			value := value.bit_xor(gi_function_is_constructor_low_level)
		end

	set_gi_function_is_method is
		do
			value := value.bit_or(gi_function_is_method_low_level)
		end

	unset_gi_function_is_method is
		do
			value := value.bit_xor(gi_function_is_method_low_level)
		end

	set_gi_function_is_setter is
		do
			value := value.bit_or(gi_function_is_setter_low_level)
		end

	unset_gi_function_is_setter is
		do
			value := value.bit_xor(gi_function_is_setter_low_level)
		end

	set_gi_function_throws is
		do
			value := value.bit_or(gi_function_throws_low_level)
		end

	unset_gi_function_throws is
		do
			value := value.bit_xor(gi_function_throws_low_level)
		end

	set_gi_function_wraps_vfunc is
		do
			value := value.bit_or(gi_function_wraps_vfunc_low_level)
		end

	unset_gi_function_wraps_vfunc is
		do
			value := value.bit_xor(gi_function_wraps_vfunc_low_level)
		end

feature -- Queries
	is_gi_function_is_constructor: BOOLEAN is
		do
			Result := (value=gi_function_is_constructor_low_level)
		end

	is_gi_function_is_method: BOOLEAN is
		do
			Result := (value=gi_function_is_method_low_level)
		end

	is_gi_function_is_setter: BOOLEAN is
		do
			Result := (value=gi_function_is_setter_low_level)
		end

	is_gi_function_throws: BOOLEAN is
		do
			Result := (value=gi_function_throws_low_level)
		end

	is_gi_function_wraps_vfunc: BOOLEAN is
		do
			Result := (value=gi_function_wraps_vfunc_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_function_is_constructor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_FUNCTION_IS_CONSTRUCTOR"
 			}"
 		end

	gi_function_is_method_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_FUNCTION_IS_METHOD"
 			}"
 		end

	gi_function_is_setter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_FUNCTION_IS_SETTER"
 			}"
 		end

	gi_function_throws_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_FUNCTION_THROWS"
 			}"
 		end

	gi_function_wraps_vfunc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GI_FUNCTION_WRAPS_VFUNC"
 			}"
 		end


end -- class GIFUNCTION_INFO_FLAGS_ENUM
