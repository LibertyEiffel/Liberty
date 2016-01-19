-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOCHANNEL_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = fbig_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = io_low_level)  or else
				(a_value = isdir_low_level)  or else
				(a_value = nospc_low_level)  or else
				(a_value = nxio_low_level)  or else
				(a_value = overflow_low_level)  or else
				(a_value = pipe_low_level)  or else
				(a_value = failed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_fbig is
		do
			value := fbig_low_level
		end

	set_inval is
		do
			value := inval_low_level
		end

	set_io is
		do
			value := io_low_level
		end

	set_isdir is
		do
			value := isdir_low_level
		end

	set_nospc is
		do
			value := nospc_low_level
		end

	set_nxio is
		do
			value := nxio_low_level
		end

	set_overflow is
		do
			value := overflow_low_level
		end

	set_pipe is
		do
			value := pipe_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

feature {ANY} -- Queries
	is_fbig: BOOLEAN is
		do
			Result := (value=fbig_low_level)
		end

	is_inval: BOOLEAN is
		do
			Result := (value=inval_low_level)
		end

	is_io: BOOLEAN is
		do
			Result := (value=io_low_level)
		end

	is_isdir: BOOLEAN is
		do
			Result := (value=isdir_low_level)
		end

	is_nospc: BOOLEAN is
		do
			Result := (value=nospc_low_level)
		end

	is_nxio: BOOLEAN is
		do
			Result := (value=nxio_low_level)
		end

	is_overflow: BOOLEAN is
		do
			Result := (value=overflow_low_level)
		end

	is_pipe: BOOLEAN is
		do
			Result := (value=pipe_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fbig_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_FBIG"
 			}"
 		end

	inval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_INVAL"
 			}"
 		end

	io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_IO"
 			}"
 		end

	isdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_ISDIR"
 			}"
 		end

	nospc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_NOSPC"
 			}"
 		end

	nxio_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_NXIO"
 			}"
 		end

	overflow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_OVERFLOW"
 			}"
 		end

	pipe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_PIPE"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_FAILED"
 			}"
 		end


end -- class GIOCHANNEL_ERROR_ENUM
