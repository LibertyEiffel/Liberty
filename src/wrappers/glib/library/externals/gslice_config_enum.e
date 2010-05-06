-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSLICE_CONFIG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = always__malloc_low_level)  or else
				(a_value = working__set__msecs_low_level)  or else
				(a_value = color__increment_low_level)  or else
				(a_value = chunk__sizes_low_level)  or else
				(a_value = contention__counter_low_level) )
		end

feature -- Setters
	default_create,
	set_always__malloc is
		do
			value := always__malloc_low_level
		end

	set_working__set__msecs is
		do
			value := working__set__msecs_low_level
		end

	set_color__increment is
		do
			value := color__increment_low_level
		end

	set_chunk__sizes is
		do
			value := chunk__sizes_low_level
		end

	set_contention__counter is
		do
			value := contention__counter_low_level
		end

feature -- Queries
	is_always__malloc: BOOLEAN is
		do
			Result := (value=always__malloc_low_level)
		end

	is_working__set__msecs: BOOLEAN is
		do
			Result := (value=working__set__msecs_low_level)
		end

	is_color__increment: BOOLEAN is
		do
			Result := (value=color__increment_low_level)
		end

	is_chunk__sizes: BOOLEAN is
		do
			Result := (value=chunk__sizes_low_level)
		end

	is_contention__counter: BOOLEAN is
		do
			Result := (value=contention__counter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	always__malloc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_ALWAYS_MALLOC"
 			}"
 		end

	working__set__msecs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_WORKING_SET_MSECS"
 			}"
 		end

	color__increment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_COLOR_INCREMENT"
 			}"
 		end

	chunk__sizes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CHUNK_SIZES"
 			}"
 		end

	contention__counter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SLICE_CONFIG_CONTENTION_COUNTER"
 			}"
 		end


end -- class GSLICE_CONFIG_ENUM
