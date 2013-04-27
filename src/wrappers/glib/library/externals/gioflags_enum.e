-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOFLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_io_flag_append_low_level)  or else
				(a_value = g_io_flag_get_mask_low_level)  or else
				(a_value = g_io_flag_is_readable_low_level)  or else
				(a_value = g_io_flag_is_seekable_low_level)  or else
				(a_value = g_io_flag_is_writable_low_level)  or else
				(a_value = g_io_flag_mask_low_level)  or else
				(a_value = g_io_flag_nonblock_low_level)  or else
				(a_value = g_io_flag_set_mask_low_level) )
		end

feature -- Setters
	default_create,
	set_g_io_flag_append is
		do
			value := g_io_flag_append_low_level
		end

	set_g_io_flag_get_mask is
		do
			value := g_io_flag_get_mask_low_level
		end

	set_g_io_flag_is_readable is
		do
			value := g_io_flag_is_readable_low_level
		end

	set_g_io_flag_is_seekable is
		do
			value := g_io_flag_is_seekable_low_level
		end

	set_g_io_flag_is_writable is
		do
			value := g_io_flag_is_writable_low_level
		end

	set_g_io_flag_mask is
		do
			value := g_io_flag_mask_low_level
		end

	set_g_io_flag_nonblock is
		do
			value := g_io_flag_nonblock_low_level
		end

	set_g_io_flag_set_mask is
		do
			value := g_io_flag_set_mask_low_level
		end

feature -- Queries
	is_g_io_flag_append: BOOLEAN is
		do
			Result := (value=g_io_flag_append_low_level)
		end

	is_g_io_flag_get_mask: BOOLEAN is
		do
			Result := (value=g_io_flag_get_mask_low_level)
		end

	is_g_io_flag_is_readable: BOOLEAN is
		do
			Result := (value=g_io_flag_is_readable_low_level)
		end

	is_g_io_flag_is_seekable: BOOLEAN is
		do
			Result := (value=g_io_flag_is_seekable_low_level)
		end

	is_g_io_flag_is_writable: BOOLEAN is
		do
			Result := (value=g_io_flag_is_writable_low_level)
		end

	is_g_io_flag_mask: BOOLEAN is
		do
			Result := (value=g_io_flag_mask_low_level)
		end

	is_g_io_flag_nonblock: BOOLEAN is
		do
			Result := (value=g_io_flag_nonblock_low_level)
		end

	is_g_io_flag_set_mask: BOOLEAN is
		do
			Result := (value=g_io_flag_set_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_flag_append_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_APPEND"
 			}"
 		end

	g_io_flag_get_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_GET_MASK"
 			}"
 		end

	g_io_flag_is_readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_IS_READABLE"
 			}"
 		end

	g_io_flag_is_seekable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_IS_SEEKABLE"
 			}"
 		end

	g_io_flag_is_writable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_IS_WRITABLE"
 			}"
 		end

	g_io_flag_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_MASK"
 			}"
 		end

	g_io_flag_nonblock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_NONBLOCK"
 			}"
 		end

	g_io_flag_set_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_SET_MASK"
 			}"
 		end


end -- class GIOFLAGS_ENUM
