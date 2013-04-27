-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERTER_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_converter_flush_low_level)  or else
				(a_value = g_converter_input_at_end_low_level)  or else
				(a_value = g_converter_no_flags_low_level) )
		end

feature -- Setters
	default_create,
	set_g_converter_flush is
		do
			value := g_converter_flush_low_level
		end

	set_g_converter_input_at_end is
		do
			value := g_converter_input_at_end_low_level
		end

	set_g_converter_no_flags is
		do
			value := g_converter_no_flags_low_level
		end

feature -- Queries
	is_g_converter_flush: BOOLEAN is
		do
			Result := (value=g_converter_flush_low_level)
		end

	is_g_converter_input_at_end: BOOLEAN is
		do
			Result := (value=g_converter_input_at_end_low_level)
		end

	is_g_converter_no_flags: BOOLEAN is
		do
			Result := (value=g_converter_no_flags_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_converter_flush_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_FLUSH"
 			}"
 		end

	g_converter_input_at_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_INPUT_AT_END"
 			}"
 		end

	g_converter_no_flags_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERTER_NO_FLAGS"
 			}"
 		end


end -- class GCONVERTER_FLAGS_ENUM
