-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATA_STREAM_NEWLINE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = lf_low_level)  or else
				(a_value = cr_low_level)  or else
				(a_value = cr_lf_low_level)  or else
				(a_value = any_low_level) )
		end

feature -- Setters
	default_create,
	set_lf is
		do
			value := lf_low_level
		end

	set_cr is
		do
			value := cr_low_level
		end

	set_cr_lf is
		do
			value := cr_lf_low_level
		end

	set_any is
		do
			value := any_low_level
		end

feature -- Queries
	is_lf: BOOLEAN is
		do
			Result := (value=lf_low_level)
		end

	is_cr: BOOLEAN is
		do
			Result := (value=cr_low_level)
		end

	is_cr_lf: BOOLEAN is
		do
			Result := (value=cr_lf_low_level)
		end

	is_any: BOOLEAN is
		do
			Result := (value=any_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_NEWLINE_TYPE_LF"
 			}"
 		end

	cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_NEWLINE_TYPE_CR"
 			}"
 		end

	cr_lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_NEWLINE_TYPE_CR_LF"
 			}"
 		end

	any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_NEWLINE_TYPE_ANY"
 			}"
 		end


end -- class GDATA_STREAM_NEWLINE_TYPE_ENUM
