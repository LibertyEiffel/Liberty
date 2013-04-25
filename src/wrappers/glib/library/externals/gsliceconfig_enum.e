-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSLICECONFIG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_slice_config_always_malloc is
		do
			value := g_slice_config_always_malloc_low_level
		end

	set_g_slice_config_bypass_magazines is
		do
			value := g_slice_config_bypass_magazines_low_level
		end

	set_g_slice_config_chunk_sizes is
		do
			value := g_slice_config_chunk_sizes_low_level
		end

	set_g_slice_config_color_increment is
		do
			value := g_slice_config_color_increment_low_level
		end

	set_g_slice_config_contention_counter is
		do
			value := g_slice_config_contention_counter_low_level
		end

	set_g_slice_config_working_set_msecs is
		do
			value := g_slice_config_working_set_msecs_low_level
		end

feature {ANY} -- Queries
	is_g_slice_config_always_malloc: BOOLEAN is
		do
			Result := (value=g_slice_config_always_malloc_low_level)
		end

	is_g_slice_config_bypass_magazines: BOOLEAN is
		do
			Result := (value=g_slice_config_bypass_magazines_low_level)
		end

	is_g_slice_config_chunk_sizes: BOOLEAN is
		do
			Result := (value=g_slice_config_chunk_sizes_low_level)
		end

	is_g_slice_config_color_increment: BOOLEAN is
		do
			Result := (value=g_slice_config_color_increment_low_level)
		end

	is_g_slice_config_contention_counter: BOOLEAN is
		do
			Result := (value=g_slice_config_contention_counter_low_level)
		end

	is_g_slice_config_working_set_msecs: BOOLEAN is
		do
			Result := (value=g_slice_config_working_set_msecs_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_slice_config_always_malloc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_ALWAYS_MALLOC"
 			}"
 		end

	g_slice_config_bypass_magazines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_BYPASS_MAGAZINES"
 			}"
 		end

	g_slice_config_chunk_sizes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CHUNK_SIZES"
 			}"
 		end

	g_slice_config_color_increment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_COLOR_INCREMENT"
 			}"
 		end

	g_slice_config_contention_counter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CONTENTION_COUNTER"
 			}"
 		end

	g_slice_config_working_set_msecs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_WORKING_SET_MSECS"
 			}"
 		end


end -- class GSLICECONFIG_ENUM
