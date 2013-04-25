-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERTER_RESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = error_low_level)  or else
				(a_value = converted_low_level)  or else
				(a_value = finished_low_level)  or else
				(a_value = flushed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_error is
		do
			value := error_low_level
		end

	set_converted is
		do
			value := converted_low_level
		end

	set_finished is
		do
			value := finished_low_level
		end

	set_flushed is
		do
			value := flushed_low_level
		end

feature {ANY} -- Queries
	error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	converted: BOOLEAN is
		do
			Result := (value=converted_low_level)
		end

	finished: BOOLEAN is
		do
			Result := (value=finished_low_level)
		end

	flushed: BOOLEAN is
		do
			Result := (value=flushed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_ERROR"
 			}"
 		end

	converted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_CONVERTED"
 			}"
 		end

	finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_FINISHED"
 			}"
 		end

	flushed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_FLUSHED"
 			}"
 		end


end -- class GCONVERTER_RESULT_ENUM
