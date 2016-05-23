-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SLICE_CONFIG
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_slice_config_always_malloc) or else 
				(a_value = g_slice_config_bypass_magazines) or else 
				(a_value = g_slice_config_working_set_msecs) or else 
				(a_value = g_slice_config_color_increment) or else 
				(a_value = g_slice_config_chunk_sizes) or else 
				(a_value = g_slice_config_contention_counter))
		end


feature {ANY} -- Setters
	default_create, set_always_malloc is
		do
			value := g_slice_config_always_malloc
		end

	set_bypass_magazines is
		do
			value := g_slice_config_bypass_magazines
		end

	set_working_set_msecs is
		do
			value := g_slice_config_working_set_msecs
		end

	set_color_increment is
		do
			value := g_slice_config_color_increment
		end

	set_chunk_sizes is
		do
			value := g_slice_config_chunk_sizes
		end

	set_contention_counter is
		do
			value := g_slice_config_contention_counter
		end


feature {ANY} -- Queries
	is_always_malloc: BOOLEAN is
		do
			Result := (value=g_slice_config_always_malloc)
		end

	is_bypass_magazines: BOOLEAN is
		do
			Result := (value=g_slice_config_bypass_magazines)
		end

	is_working_set_msecs: BOOLEAN is
		do
			Result := (value=g_slice_config_working_set_msecs)
		end

	is_color_increment: BOOLEAN is
		do
			Result := (value=g_slice_config_color_increment)
		end

	is_chunk_sizes: BOOLEAN is
		do
			Result := (value=g_slice_config_chunk_sizes)
		end

	is_contention_counter: BOOLEAN is
		do
			Result := (value=g_slice_config_contention_counter)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_slice_config_always_malloc: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_ALWAYS_MALLOC"
		end

	g_slice_config_bypass_magazines: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_BYPASS_MAGAZINES"
		end

	g_slice_config_working_set_msecs: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_WORKING_SET_MSECS"
		end

	g_slice_config_color_increment: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_COLOR_INCREMENT"
		end

	g_slice_config_chunk_sizes: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_CHUNK_SIZES"
		end

	g_slice_config_contention_counter: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_CONTENTION_COUNTER"
		end


end

