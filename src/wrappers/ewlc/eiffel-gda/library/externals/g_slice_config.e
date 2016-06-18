-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SLICE_CONFIG
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_slice_config_always_malloc) or else 
				(a_value = g_slice_config_bypass_magazines) or else 
				(a_value = g_slice_config_working_set_msecs) or else 
				(a_value = g_slice_config_color_increment) or else 
				(a_value = g_slice_config_chunk_sizes) or else 
				(a_value = g_slice_config_contention_counter))
		end


feature {ANY} -- Setters
	default_create, set_always_malloc
		do
			value := g_slice_config_always_malloc
		end

	set_bypass_magazines
		do
			value := g_slice_config_bypass_magazines
		end

	set_working_set_msecs
		do
			value := g_slice_config_working_set_msecs
		end

	set_color_increment
		do
			value := g_slice_config_color_increment
		end

	set_chunk_sizes
		do
			value := g_slice_config_chunk_sizes
		end

	set_contention_counter
		do
			value := g_slice_config_contention_counter
		end


feature {ANY} -- Queries
	is_always_malloc: BOOLEAN
		do
			Result := (value=g_slice_config_always_malloc)
		end

	is_bypass_magazines: BOOLEAN
		do
			Result := (value=g_slice_config_bypass_magazines)
		end

	is_working_set_msecs: BOOLEAN
		do
			Result := (value=g_slice_config_working_set_msecs)
		end

	is_color_increment: BOOLEAN
		do
			Result := (value=g_slice_config_color_increment)
		end

	is_chunk_sizes: BOOLEAN
		do
			Result := (value=g_slice_config_chunk_sizes)
		end

	is_contention_counter: BOOLEAN
		do
			Result := (value=g_slice_config_contention_counter)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_slice_config_always_malloc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_ALWAYS_MALLOC"
		end

	g_slice_config_bypass_magazines: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_BYPASS_MAGAZINES"
		end

	g_slice_config_working_set_msecs: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_WORKING_SET_MSECS"
		end

	g_slice_config_color_increment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_COLOR_INCREMENT"
		end

	g_slice_config_chunk_sizes: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_CHUNK_SIZES"
		end

	g_slice_config_contention_counter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SLICE_CONFIG_CONTENTION_COUNTER"
		end


end

