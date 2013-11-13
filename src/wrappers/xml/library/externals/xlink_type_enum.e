-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XLINK_TYPE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xlink_type_extended_low_level)  or else
				(a_value = xlink_type_extended_set_low_level)  or else
				(a_value = xlink_type_none_low_level)  or else
				(a_value = xlink_type_simple_low_level) )
		end

feature -- Setters
	default_create,
	set_xlink_type_extended is
		do
			value := xlink_type_extended_low_level
		end

	set_xlink_type_extended_set is
		do
			value := xlink_type_extended_set_low_level
		end

	set_xlink_type_none is
		do
			value := xlink_type_none_low_level
		end

	set_xlink_type_simple is
		do
			value := xlink_type_simple_low_level
		end

feature -- Queries
	is_xlink_type_extended: BOOLEAN is
		do
			Result := (value=xlink_type_extended_low_level)
		end

	is_xlink_type_extended_set: BOOLEAN is
		do
			Result := (value=xlink_type_extended_set_low_level)
		end

	is_xlink_type_none: BOOLEAN is
		do
			Result := (value=xlink_type_none_low_level)
		end

	is_xlink_type_simple: BOOLEAN is
		do
			Result := (value=xlink_type_simple_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xlink_type_extended_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_EXTENDED"
 			}"
 		end

	xlink_type_extended_set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_EXTENDED_SET"
 			}"
 		end

	xlink_type_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_NONE"
 			}"
 		end

	xlink_type_simple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_TYPE_SIMPLE"
 			}"
 		end


end -- class XLINK_TYPE_ENUM
