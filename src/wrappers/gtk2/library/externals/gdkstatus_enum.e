-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKSTATUS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_error_low_level)  or else
				(a_value = gdk_error_file_low_level)  or else
				(a_value = gdk_error_mem_low_level)  or else
				(a_value = gdk_error_param_low_level)  or else
				(a_value = gdk_ok_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_error is
		do
			value := gdk_error_low_level
		end

	set_gdk_error_file is
		do
			value := gdk_error_file_low_level
		end

	set_gdk_error_mem is
		do
			value := gdk_error_mem_low_level
		end

	set_gdk_error_param is
		do
			value := gdk_error_param_low_level
		end

	set_gdk_ok is
		do
			value := gdk_ok_low_level
		end

feature {ANY} -- Queries
	is_gdk_error: BOOLEAN is
		do
			Result := (value=gdk_error_low_level)
		end

	is_gdk_error_file: BOOLEAN is
		do
			Result := (value=gdk_error_file_low_level)
		end

	is_gdk_error_mem: BOOLEAN is
		do
			Result := (value=gdk_error_mem_low_level)
		end

	is_gdk_error_param: BOOLEAN is
		do
			Result := (value=gdk_error_param_low_level)
		end

	is_gdk_ok: BOOLEAN is
		do
			Result := (value=gdk_ok_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR"
 			}"
 		end

	gdk_error_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR_FILE"
 			}"
 		end

	gdk_error_mem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR_MEM"
 			}"
 		end

	gdk_error_param_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ERROR_PARAM"
 			}"
 		end

	gdk_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OK"
 			}"
 		end


end -- class GDKSTATUS_ENUM
