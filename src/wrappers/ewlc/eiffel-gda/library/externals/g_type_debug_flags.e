-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TYPE_DEBUG_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_type_debug_none) or else 
				(a_value = g_type_debug_objects) or else 
				(a_value = g_type_debug_signals) or else 
				(a_value = g_type_debug_mask))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := g_type_debug_none
		end

	set_objects
		do
			value := g_type_debug_objects
		end

	set_signals
		do
			value := g_type_debug_signals
		end

	set_mask
		do
			value := g_type_debug_mask
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=g_type_debug_none)
		end

	is_objects: BOOLEAN
		do
			Result := (value=g_type_debug_objects)
		end

	is_signals: BOOLEAN
		do
			Result := (value=g_type_debug_signals)
		end

	is_mask: BOOLEAN
		do
			Result := (value=g_type_debug_mask)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_debug_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_NONE"
		end

	g_type_debug_objects: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_OBJECTS"
		end

	g_type_debug_signals: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_SIGNALS"
		end

	g_type_debug_mask: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_MASK"
		end


end

