-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOSTREAM_SPLICE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_io_stream_splice_close_stream1_low_level)  or else
				(a_value = g_io_stream_splice_close_stream2_low_level)  or else
				(a_value = g_io_stream_splice_none_low_level)  or else
				(a_value = g_io_stream_splice_wait_for_both_low_level) )
		end

feature -- Setters
	default_create,
	set_g_io_stream_splice_close_stream1 is
		do
			value := g_io_stream_splice_close_stream1_low_level
		end

	set_g_io_stream_splice_close_stream2 is
		do
			value := g_io_stream_splice_close_stream2_low_level
		end

	set_g_io_stream_splice_none is
		do
			value := g_io_stream_splice_none_low_level
		end

	set_g_io_stream_splice_wait_for_both is
		do
			value := g_io_stream_splice_wait_for_both_low_level
		end

feature -- Queries
	is_g_io_stream_splice_close_stream1: BOOLEAN is
		do
			Result := (value=g_io_stream_splice_close_stream1_low_level)
		end

	is_g_io_stream_splice_close_stream2: BOOLEAN is
		do
			Result := (value=g_io_stream_splice_close_stream2_low_level)
		end

	is_g_io_stream_splice_none: BOOLEAN is
		do
			Result := (value=g_io_stream_splice_none_low_level)
		end

	is_g_io_stream_splice_wait_for_both: BOOLEAN is
		do
			Result := (value=g_io_stream_splice_wait_for_both_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_stream_splice_close_stream1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STREAM_SPLICE_CLOSE_STREAM1"
 			}"
 		end

	g_io_stream_splice_close_stream2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STREAM_SPLICE_CLOSE_STREAM2"
 			}"
 		end

	g_io_stream_splice_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STREAM_SPLICE_NONE"
 			}"
 		end

	g_io_stream_splice_wait_for_both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STREAM_SPLICE_WAIT_FOR_BOTH"
 			}"
 		end


end -- class GIOSTREAM_SPLICE_FLAGS_ENUM
