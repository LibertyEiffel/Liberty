-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_THREAD_PRIORITY
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_thread_priority_low) or else 
				(a_value = g_thread_priority_normal) or else 
				(a_value = g_thread_priority_high) or else 
				(a_value = g_thread_priority_urgent))
		end


feature {ANY} -- Setters
	default_create, set_low
		do
			value := g_thread_priority_low
		end

	set_normal
		do
			value := g_thread_priority_normal
		end

	set_high
		do
			value := g_thread_priority_high
		end

	set_urgent
		do
			value := g_thread_priority_urgent
		end


feature {ANY} -- Queries
	is_low: BOOLEAN
		do
			Result := (value=g_thread_priority_low)
		end

	is_normal: BOOLEAN
		do
			Result := (value=g_thread_priority_normal)
		end

	is_high: BOOLEAN
		do
			Result := (value=g_thread_priority_high)
		end

	is_urgent: BOOLEAN
		do
			Result := (value=g_thread_priority_urgent)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_thread_priority_low: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_THREAD_PRIORITY_LOW"
		end

	g_thread_priority_normal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_THREAD_PRIORITY_NORMAL"
		end

	g_thread_priority_high: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_THREAD_PRIORITY_HIGH"
		end

	g_thread_priority_urgent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_THREAD_PRIORITY_URGENT"
		end


end

