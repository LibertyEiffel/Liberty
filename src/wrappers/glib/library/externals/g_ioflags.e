-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_IOFLAGS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_io_flag_append | 
				g_io_flag_nonblock | 
				g_io_flag_is_readable | 
				g_io_flag_is_writeable | 
				g_io_flag_is_seekable | 
				g_io_flag_mask | 
				g_io_flag_get_mask | 
				g_io_flag_set_mask)).to_boolean
		end

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_append is
		
	do
		value := value.bit_or(g_io_flag_append)
	end

	unset_append is
		
	do
		value := value.bit_xor(g_io_flag_append)
	end

	set_nonblock is
		
	do
		value := value.bit_or(g_io_flag_nonblock)
	end

	unset_nonblock is
		
	do
		value := value.bit_xor(g_io_flag_nonblock)
	end

	set_is_readable is
		
	do
		value := value.bit_or(g_io_flag_is_readable)
	end

	unset_is_readable is
		
	do
		value := value.bit_xor(g_io_flag_is_readable)
	end

	set_is_writeable is
		
	do
		value := value.bit_or(g_io_flag_is_writeable)
	end

	unset_is_writeable is
		
	do
		value := value.bit_xor(g_io_flag_is_writeable)
	end

	set_is_seekable is
		
	do
		value := value.bit_or(g_io_flag_is_seekable)
	end

	unset_is_seekable is
		
	do
		value := value.bit_xor(g_io_flag_is_seekable)
	end

	set_mask is
		
	do
		value := value.bit_or(g_io_flag_mask)
	end

	unset_mask is
		
	do
		value := value.bit_xor(g_io_flag_mask)
	end

	set_get_mask is
		
	do
		value := value.bit_or(g_io_flag_get_mask)
	end

	unset_get_mask is
		
	do
		value := value.bit_xor(g_io_flag_get_mask)
	end

	set_set_mask is
		
	do
		value := value.bit_or(g_io_flag_set_mask)
	end

	unset_set_mask is
		
	do
		value := value.bit_xor(g_io_flag_set_mask)
	end

feature -- Queries
	is_append: BOOLEAN is
		
	do
		Result := (value & g_io_flag_append).to_boolean
	end

	is_nonblock: BOOLEAN is
		
	do
		Result := (value & g_io_flag_nonblock).to_boolean
	end

	is_is_readable: BOOLEAN is
		
	do
		Result := (value & g_io_flag_is_readable).to_boolean
	end

	is_is_writeable: BOOLEAN is
		
	do
		Result := (value & g_io_flag_is_writeable).to_boolean
	end

	is_is_seekable: BOOLEAN is
		
	do
		Result := (value & g_io_flag_is_seekable).to_boolean
	end

	is_mask: BOOLEAN is
		
	do
		Result := (value & g_io_flag_mask).to_boolean
	end

	is_get_mask: BOOLEAN is
		
	do
		Result := (value & g_io_flag_get_mask).to_boolean
	end

	is_set_mask: BOOLEAN is
		
	do
		Result := (value & g_io_flag_set_mask).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_flag_append: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_APPEND"
 			}"
 		end

	g_io_flag_nonblock: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_NONBLOCK"
 			}"
 		end

	g_io_flag_is_readable: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_IS_READABLE"
 			}"
 		end

	g_io_flag_is_writeable: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_IS_WRITEABLE"
 			}"
 		end

	g_io_flag_is_seekable: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_IS_SEEKABLE"
 			}"
 		end

	g_io_flag_mask: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_MASK"
 			}"
 		end

	g_io_flag_get_mask: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_GET_MASK"
 			}"
 		end

	g_io_flag_set_mask: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_FLAG_SET_MASK"
 			}"
 		end

end

