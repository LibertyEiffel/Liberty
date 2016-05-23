-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TYPE_DEBUG_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_type_debug_none) or else 
				(a_value = g_type_debug_objects) or else 
				(a_value = g_type_debug_signals) or else 
				(a_value = g_type_debug_mask))
		end


feature {ANY} -- Setters
	default_create, set_none is
		do
			value := g_type_debug_none
		end

	set_objects is
		do
			value := g_type_debug_objects
		end

	set_signals is
		do
			value := g_type_debug_signals
		end

	set_mask is
		do
			value := g_type_debug_mask
		end


feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=g_type_debug_none)
		end

	is_objects: BOOLEAN is
		do
			Result := (value=g_type_debug_objects)
		end

	is_signals: BOOLEAN is
		do
			Result := (value=g_type_debug_signals)
		end

	is_mask: BOOLEAN is
		do
			Result := (value=g_type_debug_mask)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_debug_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_NONE"
		end

	g_type_debug_objects: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_OBJECTS"
		end

	g_type_debug_signals: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_SIGNALS"
		end

	g_type_debug_mask: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_DEBUG_MASK"
		end


end

