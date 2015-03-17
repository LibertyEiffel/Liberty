-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XLINK_TYPE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xlink_type_extended_low_level)  or else
				(a_value = xlink_type_extended_set_low_level)  or else
				(a_value = xlink_type_none_low_level)  or else
				(a_value = xlink_type_simple_low_level) )
		end

feature -- Setters
	default_create,
	set_xlink_type_extended
		do
			value := xlink_type_extended_low_level
		end

	set_xlink_type_extended_set
		do
			value := xlink_type_extended_set_low_level
		end

	set_xlink_type_none
		do
			value := xlink_type_none_low_level
		end

	set_xlink_type_simple
		do
			value := xlink_type_simple_low_level
		end

feature -- Queries
	is_xlink_type_extended: BOOLEAN
		do
			Result := (value=xlink_type_extended_low_level)
		end

	is_xlink_type_extended_set: BOOLEAN
		do
			Result := (value=xlink_type_extended_set_low_level)
		end

	is_xlink_type_none: BOOLEAN
		do
			Result := (value=xlink_type_none_low_level)
		end

	is_xlink_type_simple: BOOLEAN
		do
			Result := (value=xlink_type_simple_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xlink_type_extended_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_EXTENDED"
 			}"
 		end

	xlink_type_extended_set_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_EXTENDED_SET"
 			}"
 		end

	xlink_type_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_NONE"
 			}"
 		end

	xlink_type_simple_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_SIMPLE"
 			}"
 		end


end -- class XLINK_TYPE_ENUM
