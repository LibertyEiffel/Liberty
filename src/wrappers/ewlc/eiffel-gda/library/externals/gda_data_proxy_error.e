-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_PROXY_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_data_proxy_commit_error) or else 
				(a_value = gda_data_proxy_commit_cancelled) or else 
				(a_value = gda_data_proxy_read_only_value) or else 
				(a_value = gda_data_proxy_read_only_row) or else 
				(a_value = gda_data_proxy_filter_error))
		end


feature {ANY} -- Setters
	default_create, set_commit_error
		do
			value := gda_data_proxy_commit_error
		end

	set_commit_cancelled
		do
			value := gda_data_proxy_commit_cancelled
		end

	set_read_only_value
		do
			value := gda_data_proxy_read_only_value
		end

	set_read_only_row
		do
			value := gda_data_proxy_read_only_row
		end

	set_filter_error
		do
			value := gda_data_proxy_filter_error
		end


feature {ANY} -- Queries
	is_commit_error: BOOLEAN
		do
			Result := (value=gda_data_proxy_commit_error)
		end

	is_commit_cancelled: BOOLEAN
		do
			Result := (value=gda_data_proxy_commit_cancelled)
		end

	is_read_only_value: BOOLEAN
		do
			Result := (value=gda_data_proxy_read_only_value)
		end

	is_read_only_row: BOOLEAN
		do
			Result := (value=gda_data_proxy_read_only_row)
		end

	is_filter_error: BOOLEAN
		do
			Result := (value=gda_data_proxy_filter_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_proxy_commit_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_COMMIT_ERROR"
		end

	gda_data_proxy_commit_cancelled: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_COMMIT_CANCELLED"
		end

	gda_data_proxy_read_only_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_READ_ONLY_VALUE"
		end

	gda_data_proxy_read_only_row: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_READ_ONLY_ROW"
		end

	gda_data_proxy_filter_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_PROXY_FILTER_ERROR"
		end


end

