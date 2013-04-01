-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIARRAY_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gi_array_type_array_low_level)  or else
				(a_value = gi_array_type_byte_array_low_level)  or else
				(a_value = gi_array_type_c_low_level)  or else
				(a_value = gi_array_type_ptr_array_low_level) )
		end

feature -- Setters
	default_create,
	set_gi_array_type_array is
		do
			value := gi_array_type_array_low_level
		end

	set_gi_array_type_byte_array is
		do
			value := gi_array_type_byte_array_low_level
		end

	set_gi_array_type_c is
		do
			value := gi_array_type_c_low_level
		end

	set_gi_array_type_ptr_array is
		do
			value := gi_array_type_ptr_array_low_level
		end

feature -- Queries
	is_gi_array_type_array: BOOLEAN is
		do
			Result := (value=gi_array_type_array_low_level)
		end

	is_gi_array_type_byte_array: BOOLEAN is
		do
			Result := (value=gi_array_type_byte_array_low_level)
		end

	is_gi_array_type_c: BOOLEAN is
		do
			Result := (value=gi_array_type_c_low_level)
		end

	is_gi_array_type_ptr_array: BOOLEAN is
		do
			Result := (value=gi_array_type_ptr_array_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_array_type_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_ARRAY"
 			}"
 		end

	gi_array_type_byte_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_BYTE_ARRAY"
 			}"
 		end

	gi_array_type_c_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_C"
 			}"
 		end

	gi_array_type_ptr_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_PTR_ARRAY"
 			}"
 		end


end -- class GIARRAY_TYPE_ENUM
