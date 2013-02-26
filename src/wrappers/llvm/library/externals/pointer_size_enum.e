-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class POINTER_SIZE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = any_pointer_size_low_level)  or else
				(a_value = pointer32_low_level)  or else
				(a_value = pointer64_low_level) )
		end

feature -- Setters
	default_create,
	set_any_pointer_size is
		do
			value := any_pointer_size_low_level
		end

	set_pointer32 is
		do
			value := pointer32_low_level
		end

	set_pointer64 is
		do
			value := pointer64_low_level
		end

feature -- Queries
	any_pointer_size: BOOLEAN is
		do
			Result := (value=any_pointer_size_low_level)
		end

	pointer32: BOOLEAN is
		do
			Result := (value=pointer32_low_level)
		end

	pointer64: BOOLEAN is
		do
			Result := (value=pointer64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	any_pointer_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AnyPointerSize"
 			}"
 		end

	pointer32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Pointer32"
 			}"
 		end

	pointer64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Pointer64"
 			}"
 		end


end -- class POINTER_SIZE_ENUM
