-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERTERRESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_converter_converted_low_level)  or else
				(a_value = g_converter_error_low_level)  or else
				(a_value = g_converter_finished_low_level)  or else
				(a_value = g_converter_flushed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_converter_converted is
		do
			value := g_converter_converted_low_level
		end

	set_g_converter_error is
		do
			value := g_converter_error_low_level
		end

	set_g_converter_finished is
		do
			value := g_converter_finished_low_level
		end

	set_g_converter_flushed is
		do
			value := g_converter_flushed_low_level
		end

feature {ANY} -- Queries
	is_g_converter_converted: BOOLEAN is
		do
			Result := (value=g_converter_converted_low_level)
		end

	is_g_converter_error: BOOLEAN is
		do
			Result := (value=g_converter_error_low_level)
		end

	is_g_converter_finished: BOOLEAN is
		do
			Result := (value=g_converter_finished_low_level)
		end

	is_g_converter_flushed: BOOLEAN is
		do
			Result := (value=g_converter_flushed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_converter_converted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_CONVERTED"
 			}"
 		end

	g_converter_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_ERROR"
 			}"
 		end

	g_converter_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_FINISHED"
 			}"
 		end

	g_converter_flushed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_FLUSHED"
 			}"
 		end


end -- class GCONVERTERRESULT_ENUM
