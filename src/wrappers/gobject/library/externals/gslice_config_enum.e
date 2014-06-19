-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSLICE_CONFIG_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_slice_config_always_malloc_low_level)  or else
				(a_value = g_slice_config_bypass_magazines_low_level)  or else
				(a_value = g_slice_config_chunk_sizes_low_level)  or else
				(a_value = g_slice_config_color_increment_low_level)  or else
				(a_value = g_slice_config_contention_counter_low_level)  or else
				(a_value = g_slice_config_working_set_msecs_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_slice_config_always_malloc
		do
			value := g_slice_config_always_malloc_low_level
		end

	set_g_slice_config_bypass_magazines
		do
			value := g_slice_config_bypass_magazines_low_level
		end

	set_g_slice_config_chunk_sizes
		do
			value := g_slice_config_chunk_sizes_low_level
		end

	set_g_slice_config_color_increment
		do
			value := g_slice_config_color_increment_low_level
		end

	set_g_slice_config_contention_counter
		do
			value := g_slice_config_contention_counter_low_level
		end

	set_g_slice_config_working_set_msecs
		do
			value := g_slice_config_working_set_msecs_low_level
		end

feature {ANY} -- Queries
	is_g_slice_config_always_malloc: BOOLEAN
		do
			Result := (value=g_slice_config_always_malloc_low_level)
		end

	is_g_slice_config_bypass_magazines: BOOLEAN
		do
			Result := (value=g_slice_config_bypass_magazines_low_level)
		end

	is_g_slice_config_chunk_sizes: BOOLEAN
		do
			Result := (value=g_slice_config_chunk_sizes_low_level)
		end

	is_g_slice_config_color_increment: BOOLEAN
		do
			Result := (value=g_slice_config_color_increment_low_level)
		end

	is_g_slice_config_contention_counter: BOOLEAN
		do
			Result := (value=g_slice_config_contention_counter_low_level)
		end

	is_g_slice_config_working_set_msecs: BOOLEAN
		do
			Result := (value=g_slice_config_working_set_msecs_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_slice_config_always_malloc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_ALWAYS_MALLOC"
 			}"
 		end

	g_slice_config_bypass_magazines_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_BYPASS_MAGAZINES"
 			}"
 		end

	g_slice_config_chunk_sizes_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CHUNK_SIZES"
 			}"
 		end

	g_slice_config_color_increment_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_COLOR_INCREMENT"
 			}"
 		end

	g_slice_config_contention_counter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CONTENTION_COUNTER"
 			}"
 		end

	g_slice_config_working_set_msecs_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_WORKING_SET_MSECS"
 			}"
 		end


end -- class GSLICE_CONFIG_ENUM
