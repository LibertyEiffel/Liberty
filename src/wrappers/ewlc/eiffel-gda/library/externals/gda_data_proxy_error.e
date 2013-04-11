-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_PROXY_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_data_proxy_commit_error) or else 
				(a_value = gda_data_proxy_commit_cancelled) or else 
				(a_value = gda_data_proxy_read_only_value) or else 
				(a_value = gda_data_proxy_read_only_row) or else 
				(a_value = gda_data_proxy_filter_error))
		end


feature {ANY} -- Setters
	default_create, set_commit_error is
		do
			value := gda_data_proxy_commit_error
		end

	set_commit_cancelled is
		do
			value := gda_data_proxy_commit_cancelled
		end

	set_read_only_value is
		do
			value := gda_data_proxy_read_only_value
		end

	set_read_only_row is
		do
			value := gda_data_proxy_read_only_row
		end

	set_filter_error is
		do
			value := gda_data_proxy_filter_error
		end


feature {ANY} -- Queries
	is_commit_error: BOOLEAN is
		do
			Result := (value=gda_data_proxy_commit_error)
		end

	is_commit_cancelled: BOOLEAN is
		do
			Result := (value=gda_data_proxy_commit_cancelled)
		end

	is_read_only_value: BOOLEAN is
		do
			Result := (value=gda_data_proxy_read_only_value)
		end

	is_read_only_row: BOOLEAN is
		do
			Result := (value=gda_data_proxy_read_only_row)
		end

	is_filter_error: BOOLEAN is
		do
			Result := (value=gda_data_proxy_filter_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_proxy_commit_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_COMMIT_ERROR"
		end

	gda_data_proxy_commit_cancelled: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_COMMIT_CANCELLED"
		end

	gda_data_proxy_read_only_value: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_READ_ONLY_VALUE"
		end

	gda_data_proxy_read_only_row: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_READ_ONLY_ROW"
		end

	gda_data_proxy_filter_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_FILTER_ERROR"
		end


end

