-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XLINK_SHOW
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xlink_show_none) or else 
				(a_value = xlink_show_new) or else 
				(a_value = xlink_show_embed) or else 
				(a_value = xlink_show_replace))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := xlink_show_none
		end

	set_new
		do
			value := xlink_show_new
		end

	set_embed
		do
			value := xlink_show_embed
		end

	set_replace
		do
			value := xlink_show_replace
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=xlink_show_none)
		end

	is_new: BOOLEAN
		do
			Result := (value=xlink_show_new)
		end

	is_embed: BOOLEAN
		do
			Result := (value=xlink_show_embed)
		end

	is_replace: BOOLEAN
		do
			Result := (value=xlink_show_replace)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xlink_show_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_SHOW_NONE"
		end

	xlink_show_new: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_SHOW_NEW"
		end

	xlink_show_embed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_SHOW_EMBED"
		end

	xlink_show_replace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XLINK_SHOW_REPLACE"
		end


end

