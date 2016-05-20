-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_THREAD_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_thread_error_again))
		end


feature {ANY} -- Setters
	default_create, set_g_thread_error_again is
		do
			value := g_thread_error_again
		end


feature {ANY} -- Queries
	is_g_thread_error_again: BOOLEAN is
		do
			Result := (value=g_thread_error_again)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_thread_error_again: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_THREAD_ERROR_AGAIN"
		end


end

