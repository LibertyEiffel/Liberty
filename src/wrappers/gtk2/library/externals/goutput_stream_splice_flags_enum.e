-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOUTPUT_STREAM_SPLICE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = close_source_low_level)  or else
				(a_value = close_target_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_close_source is
		do
			value := close_source_low_level
		end

	set_close_target is
		do
			value := close_target_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	close_source: BOOLEAN is
		do
			Result := (value=close_source_low_level)
		end

	close_target: BOOLEAN is
		do
			Result := (value=close_target_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OUTPUT_STREAM_SPLICE_NONE"
 			}"
 		end

	close_source_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OUTPUT_STREAM_SPLICE_CLOSE_SOURCE"
 			}"
 		end

	close_target_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OUTPUT_STREAM_SPLICE_CLOSE_TARGET"
 			}"
 		end


end -- class GOUTPUT_STREAM_SPLICE_FLAGS_ENUM
