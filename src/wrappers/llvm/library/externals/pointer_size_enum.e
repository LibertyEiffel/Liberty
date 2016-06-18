-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class POINTER_SIZE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = any_pointer_size_low_level)  or else
				(a_value = pointer32_low_level)  or else
				(a_value = pointer64_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_any_pointer_size
		do
			value := any_pointer_size_low_level
		end

	set_pointer32
		do
			value := pointer32_low_level
		end

	set_pointer64
		do
			value := pointer64_low_level
		end

feature {ANY} -- Queries
	is_any_pointer_size: BOOLEAN
		do
			Result := (value=any_pointer_size_low_level)
		end

	is_pointer32: BOOLEAN
		do
			Result := (value=pointer32_low_level)
		end

	is_pointer64: BOOLEAN
		do
			Result := (value=pointer64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	any_pointer_size_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AnyPointerSize"
 			}"
 		end

	pointer32_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Pointer32"
 			}"
 		end

	pointer64_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Pointer64"
 			}"
 		end


end -- class POINTER_SIZE_ENUM
