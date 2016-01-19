-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PIXBUF_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_pixbuf_error_bad_option_low_level)  or else
				(a_value = gdk_pixbuf_error_corrupt_image_low_level)  or else
				(a_value = gdk_pixbuf_error_failed_low_level)  or else
				(a_value = gdk_pixbuf_error_insufficient_memory_low_level)  or else
				(a_value = gdk_pixbuf_error_unknown_type_low_level)  or else
				(a_value = gdk_pixbuf_error_unsupported_operation_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_pixbuf_error_bad_option is
		do
			value := gdk_pixbuf_error_bad_option_low_level
		end

	set_gdk_pixbuf_error_corrupt_image is
		do
			value := gdk_pixbuf_error_corrupt_image_low_level
		end

	set_gdk_pixbuf_error_failed is
		do
			value := gdk_pixbuf_error_failed_low_level
		end

	set_gdk_pixbuf_error_insufficient_memory is
		do
			value := gdk_pixbuf_error_insufficient_memory_low_level
		end

	set_gdk_pixbuf_error_unknown_type is
		do
			value := gdk_pixbuf_error_unknown_type_low_level
		end

	set_gdk_pixbuf_error_unsupported_operation is
		do
			value := gdk_pixbuf_error_unsupported_operation_low_level
		end

feature -- Queries
	is_gdk_pixbuf_error_bad_option: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_error_bad_option_low_level)
		end

	is_gdk_pixbuf_error_corrupt_image: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_error_corrupt_image_low_level)
		end

	is_gdk_pixbuf_error_failed: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_error_failed_low_level)
		end

	is_gdk_pixbuf_error_insufficient_memory: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_error_insufficient_memory_low_level)
		end

	is_gdk_pixbuf_error_unknown_type: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_error_unknown_type_low_level)
		end

	is_gdk_pixbuf_error_unsupported_operation: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_error_unsupported_operation_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_pixbuf_error_bad_option_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_BAD_OPTION"
 			}"
 		end

	gdk_pixbuf_error_corrupt_image_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_CORRUPT_IMAGE"
 			}"
 		end

	gdk_pixbuf_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_FAILED"
 			}"
 		end

	gdk_pixbuf_error_insufficient_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY"
 			}"
 		end

	gdk_pixbuf_error_unknown_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_UNKNOWN_TYPE"
 			}"
 		end

	gdk_pixbuf_error_unsupported_operation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION"
 			}"
 		end


end -- class GDK_PIXBUF_ERROR_ENUM
