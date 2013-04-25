-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PIXBUF_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = corrupt_image_low_level)  or else
				(a_value = insufficient_memory_low_level)  or else
				(a_value = bad_option_low_level)  or else
				(a_value = unknown_type_low_level)  or else
				(a_value = unsupported_operation_low_level)  or else
				(a_value = failed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_corrupt_image is
		do
			value := corrupt_image_low_level
		end

	set_insufficient_memory is
		do
			value := insufficient_memory_low_level
		end

	set_bad_option is
		do
			value := bad_option_low_level
		end

	set_unknown_type is
		do
			value := unknown_type_low_level
		end

	set_unsupported_operation is
		do
			value := unsupported_operation_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

feature {ANY} -- Queries
	corrupt_image: BOOLEAN is
		do
			Result := (value=corrupt_image_low_level)
		end

	insufficient_memory: BOOLEAN is
		do
			Result := (value=insufficient_memory_low_level)
		end

	bad_option: BOOLEAN is
		do
			Result := (value=bad_option_low_level)
		end

	unknown_type: BOOLEAN is
		do
			Result := (value=unknown_type_low_level)
		end

	unsupported_operation: BOOLEAN is
		do
			Result := (value=unsupported_operation_low_level)
		end

	failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	corrupt_image_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_CORRUPT_IMAGE"
 			}"
 		end

	insufficient_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY"
 			}"
 		end

	bad_option_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_BAD_OPTION"
 			}"
 		end

	unknown_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_UNKNOWN_TYPE"
 			}"
 		end

	unsupported_operation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_FAILED"
 			}"
 		end


end -- class GDK_PIXBUF_ERROR_ENUM
