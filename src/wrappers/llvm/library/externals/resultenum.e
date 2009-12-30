-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class RESULTENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ok_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = noconv_low_level) )
		end

feature -- Setters
	default_create,
	set_ok is
		do
			value := ok_low_level
		end

	set_error is
		do
			value := error_low_level
		end

	set_noconv is
		do
			value := noconv_low_level
		end

feature -- Queries
	is_ok: BOOLEAN is
		do
			Result := (value=ok_low_level)
		end

	is_error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	is_noconv: BOOLEAN is
		do
			Result := (value=noconv_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ok"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "error"
 			}"
 		end

	noconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "noconv"
 			}"
 		end


end -- class RESULTENUM
