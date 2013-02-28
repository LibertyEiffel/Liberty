-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_STATUS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ok_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = error_param_low_level)  or else
				(a_value = error_file_low_level)  or else
				(a_value = error_mem_low_level) )
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

	set_error_param is
		do
			value := error_param_low_level
		end

	set_error_file is
		do
			value := error_file_low_level
		end

	set_error_mem is
		do
			value := error_mem_low_level
		end

feature -- Queries
	ok: BOOLEAN is
		do
			Result := (value=ok_low_level)
		end

	error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	error_param: BOOLEAN is
		do
			Result := (value=error_param_low_level)
		end

	error_file: BOOLEAN is
		do
			Result := (value=error_file_low_level)
		end

	error_mem: BOOLEAN is
		do
			Result := (value=error_mem_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OK"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR"
 			}"
 		end

	error_param_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR_PARAM"
 			}"
 		end

	error_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR_FILE"
 			}"
 		end

	error_mem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR_MEM"
 			}"
 		end


end -- class GDK_STATUS_ENUM
