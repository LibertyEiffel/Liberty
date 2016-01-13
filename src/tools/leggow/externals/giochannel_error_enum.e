-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIOCHANNEL_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = failed_low_level)  or else
				(a_value = fbig_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = io_low_level)  or else
				(a_value = isdir_low_level)  or else
				(a_value = nospc_low_level)  or else
				(a_value = nxio_low_level)  or else
				(a_value = overflow_low_level)  or else
				(a_value = pipe_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_failed
               do
                       value := failed_low_level
               end

	set_fbig
               do
                       value := fbig_low_level
               end

	set_inval
               do
                       value := inval_low_level
               end

	set_io
               do
                       value := io_low_level
               end

	set_isdir
               do
                       value := isdir_low_level
               end

	set_nospc
               do
                       value := nospc_low_level
               end

	set_nxio
               do
                       value := nxio_low_level
               end

	set_overflow
               do
                       value := overflow_low_level
               end

	set_pipe
               do
                       value := pipe_low_level
               end

feature {ANY} -- Queries
       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

       is_fbig: BOOLEAN
               do
                       Result := (value=fbig_low_level)
               end

       is_inval: BOOLEAN
               do
                       Result := (value=inval_low_level)
               end

       is_io: BOOLEAN
               do
                       Result := (value=io_low_level)
               end

       is_isdir: BOOLEAN
               do
                       Result := (value=isdir_low_level)
               end

       is_nospc: BOOLEAN
               do
                       Result := (value=nospc_low_level)
               end

       is_nxio: BOOLEAN
               do
                       Result := (value=nxio_low_level)
               end

       is_overflow: BOOLEAN
               do
                       Result := (value=overflow_low_level)
               end

       is_pipe: BOOLEAN
               do
                       Result := (value=pipe_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_FAILED"
                       }"
               end

     fbig_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_FBIG"
                       }"
               end

     inval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_INVAL"
                       }"
               end

     io_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_IO"
                       }"
               end

     isdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_ISDIR"
                       }"
               end

     nospc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_NOSPC"
                       }"
               end

     nxio_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_NXIO"
                       }"
               end

     overflow_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_OVERFLOW"
                       }"
               end

     pipe_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_CHANNEL_ERROR_PIPE"
                       }"
               end


end -- class GIOCHANNEL_ERROR_ENUM
