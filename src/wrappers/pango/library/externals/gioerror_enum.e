-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = again_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_again is
		do
			value := again_low_level
		end

	set_inval is
		do
			value := inval_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_again: BOOLEAN is
		do
			Result := (value=again_low_level)
		end

	is_inval: BOOLEAN is
		do
			Result := (value=inval_low_level)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NONE"
 			}"
 		end

	again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_AGAIN"
 			}"
 		end

	inval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVAL"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_UNKNOWN"
 			}"
 		end


end -- class GIOERROR_ENUM
