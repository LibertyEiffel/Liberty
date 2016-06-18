-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XLINK_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xlink_type_none) or else 
				(a_value = xlink_type_simple) or else 
				(a_value = xlink_type_extended) or else 
				(a_value = xlink_type_extended_set))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := xlink_type_none
		end

	set_simple
		do
			value := xlink_type_simple
		end

	set_extended
		do
			value := xlink_type_extended
		end

	set_extended_set
		do
			value := xlink_type_extended_set
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=xlink_type_none)
		end

	is_simple: BOOLEAN
		do
			Result := (value=xlink_type_simple)
		end

	is_extended: BOOLEAN
		do
			Result := (value=xlink_type_extended)
		end

	is_extended_set: BOOLEAN
		do
			Result := (value=xlink_type_extended_set)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xlink_type_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_TYPE_NONE"
		end

	xlink_type_simple: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_TYPE_SIMPLE"
		end

	xlink_type_extended: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_TYPE_EXTENDED"
		end

	xlink_type_extended_set: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_TYPE_EXTENDED_SET"
		end


end

