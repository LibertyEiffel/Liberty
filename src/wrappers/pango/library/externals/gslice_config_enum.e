-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSLICE_CONFIG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = always_malloc_low_level)  or else
				(a_value = bypass_magazines_low_level)  or else
				(a_value = working_set_msecs_low_level)  or else
				(a_value = color_increment_low_level)  or else
				(a_value = chunk_sizes_low_level)  or else
				(a_value = contention_counter_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_always_malloc is
		do
			value := always_malloc_low_level
		end

	set_bypass_magazines is
		do
			value := bypass_magazines_low_level
		end

	set_working_set_msecs is
		do
			value := working_set_msecs_low_level
		end

	set_color_increment is
		do
			value := color_increment_low_level
		end

	set_chunk_sizes is
		do
			value := chunk_sizes_low_level
		end

	set_contention_counter is
		do
			value := contention_counter_low_level
		end

feature {ANY} -- Queries
	is_always_malloc: BOOLEAN is
		do
			Result := (value=always_malloc_low_level)
		end

	is_bypass_magazines: BOOLEAN is
		do
			Result := (value=bypass_magazines_low_level)
		end

	is_working_set_msecs: BOOLEAN is
		do
			Result := (value=working_set_msecs_low_level)
		end

	is_color_increment: BOOLEAN is
		do
			Result := (value=color_increment_low_level)
		end

	is_chunk_sizes: BOOLEAN is
		do
			Result := (value=chunk_sizes_low_level)
		end

	is_contention_counter: BOOLEAN is
		do
			Result := (value=contention_counter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	always_malloc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_ALWAYS_MALLOC"
 			}"
 		end

	bypass_magazines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_BYPASS_MAGAZINES"
 			}"
 		end

	working_set_msecs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_WORKING_SET_MSECS"
 			}"
 		end

	color_increment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_COLOR_INCREMENT"
 			}"
 		end

	chunk_sizes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CHUNK_SIZES"
 			}"
 		end

	contention_counter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CONTENTION_COUNTER"
 			}"
 		end


end -- class GSLICE_CONFIG_ENUM
