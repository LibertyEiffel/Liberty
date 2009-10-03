-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class POINTER_SIZE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = anypointersize_low_level)  or else
				(a_value = pointer64_low_level) )
		end

feature -- Setters
	default_create,
	set_anypointersize is
		do
			value := anypointersize_low_level
		end

	set_pointer64 is
		do
			value := pointer64_low_level
		end

feature -- Queries
	is_anypointersize: BOOLEAN is
		do
			Result := (value=anypointersize_low_level)
		end

	is_pointer64: BOOLEAN is
		do
			Result := (value=pointer64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	anypointersize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "AnyPointerSize"
 			}"
 		end

	pointer64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Pointer64"
 			}"
 		end


end -- class POINTER_SIZE_ENUM
