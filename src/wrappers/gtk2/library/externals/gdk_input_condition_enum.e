-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_INPUT_CONDITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (read_low_level | 
				exception_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_read is
		do
			value := value.bit_or(read_low_level)
		end

	unset_read is
		do
			value := value.bit_xor(read_low_level)
		end

	set_exception is
		do
			value := value.bit_or(exception_low_level)
		end

	unset_exception is
		do
			value := value.bit_xor(exception_low_level)
		end

feature {ANY} -- Queries
	is_read: BOOLEAN is
		do
			Result := (value=read_low_level)
		end

	is_exception: BOOLEAN is
		do
			Result := (value=exception_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	read_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_INPUT_READ"
 			}"
 		end

	exception_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_INPUT_EXCEPTION"
 			}"
 		end


end -- class GDK_INPUT_CONDITION_ENUM
