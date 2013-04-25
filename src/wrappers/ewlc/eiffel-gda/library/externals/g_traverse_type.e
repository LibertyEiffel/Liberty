-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TRAVERSE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_in_order) or else 
				(a_value = g_pre_order) or else 
				(a_value = g_post_order) or else 
				(a_value = g_level_order))
		end


feature {ANY} -- Setters
	default_create, set_in_order is
		do
			value := g_in_order
		end

	set_pre_order is
		do
			value := g_pre_order
		end

	set_post_order is
		do
			value := g_post_order
		end

	set_level_order is
		do
			value := g_level_order
		end


feature {ANY} -- Queries
	is_in_order: BOOLEAN is
		do
			Result := (value=g_in_order)
		end

	is_pre_order: BOOLEAN is
		do
			Result := (value=g_pre_order)
		end

	is_post_order: BOOLEAN is
		do
			Result := (value=g_post_order)
		end

	is_level_order: BOOLEAN is
		do
			Result := (value=g_level_order)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_in_order: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IN_ORDER"
		end

	g_pre_order: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PRE_ORDER"
		end

	g_post_order: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_POST_ORDER"
		end

	g_level_order: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LEVEL_ORDER"
		end


end

