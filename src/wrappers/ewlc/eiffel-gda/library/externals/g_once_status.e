-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_ONCE_STATUS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_once_status_notcalled) or else 
				(a_value = g_once_status_progress) or else 
				(a_value = g_once_status_ready))
		end


feature {ANY} -- Setters
	default_create, set_g_once_status_notcalled is
		do
			value := g_once_status_notcalled
		end

	set_g_once_status_progress is
		do
			value := g_once_status_progress
		end

	set_g_once_status_ready is
		do
			value := g_once_status_ready
		end


feature {ANY} -- Queries
	is_g_once_status_notcalled: BOOLEAN is
		do
			Result := (value=g_once_status_notcalled)
		end

	is_g_once_status_progress: BOOLEAN is
		do
			Result := (value=g_once_status_progress)
		end

	is_g_once_status_ready: BOOLEAN is
		do
			Result := (value=g_once_status_ready)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_once_status_notcalled: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ONCE_STATUS_NOTCALLED"
		end

	g_once_status_progress: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ONCE_STATUS_PROGRESS"
		end

	g_once_status_ready: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ONCE_STATUS_READY"
		end


end

