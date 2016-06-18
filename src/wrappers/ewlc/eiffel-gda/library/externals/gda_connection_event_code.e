-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_EVENT_CODE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_connection_event_code_constraint_violation) or else 
				(a_value = gda_connection_event_code_restrict_violation) or else 
				(a_value = gda_connection_event_code_not_null_violation) or else 
				(a_value = gda_connection_event_code_foreign_key_violation) or else 
				(a_value = gda_connection_event_code_unique_violation) or else 
				(a_value = gda_connection_event_code_check_violation) or else 
				(a_value = gda_connection_event_code_insufficient_privileges) or else 
				(a_value = gda_connection_event_code_undefined_column) or else 
				(a_value = gda_connection_event_code_undefined_function) or else 
				(a_value = gda_connection_event_code_undefined_table) or else 
				(a_value = gda_connection_event_code_duplicate_column) or else 
				(a_value = gda_connection_event_code_duplicate_database) or else 
				(a_value = gda_connection_event_code_duplicate_function) or else 
				(a_value = gda_connection_event_code_duplicate_schema) or else 
				(a_value = gda_connection_event_code_duplicate_table) or else 
				(a_value = gda_connection_event_code_duplicate_alias) or else 
				(a_value = gda_connection_event_code_duplicate_object) or else 
				(a_value = gda_connection_event_code_syntax_error) or else 
				(a_value = gda_connection_event_code_unknown))
		end


feature {ANY} -- Setters
	default_create, set_constraint_violation
		do
			value := gda_connection_event_code_constraint_violation
		end

	set_restrict_violation
		do
			value := gda_connection_event_code_restrict_violation
		end

	set_not_null_violation
		do
			value := gda_connection_event_code_not_null_violation
		end

	set_foreign_key_violation
		do
			value := gda_connection_event_code_foreign_key_violation
		end

	set_unique_violation
		do
			value := gda_connection_event_code_unique_violation
		end

	set_check_violation
		do
			value := gda_connection_event_code_check_violation
		end

	set_insufficient_privileges
		do
			value := gda_connection_event_code_insufficient_privileges
		end

	set_undefined_column
		do
			value := gda_connection_event_code_undefined_column
		end

	set_undefined_function
		do
			value := gda_connection_event_code_undefined_function
		end

	set_undefined_table
		do
			value := gda_connection_event_code_undefined_table
		end

	set_duplicate_column
		do
			value := gda_connection_event_code_duplicate_column
		end

	set_duplicate_database
		do
			value := gda_connection_event_code_duplicate_database
		end

	set_duplicate_function
		do
			value := gda_connection_event_code_duplicate_function
		end

	set_duplicate_schema
		do
			value := gda_connection_event_code_duplicate_schema
		end

	set_duplicate_table
		do
			value := gda_connection_event_code_duplicate_table
		end

	set_duplicate_alias
		do
			value := gda_connection_event_code_duplicate_alias
		end

	set_duplicate_object
		do
			value := gda_connection_event_code_duplicate_object
		end

	set_syntax_error
		do
			value := gda_connection_event_code_syntax_error
		end

	set_unknown
		do
			value := gda_connection_event_code_unknown
		end


feature {ANY} -- Queries
	is_constraint_violation: BOOLEAN
		do
			Result := (value=gda_connection_event_code_constraint_violation)
		end

	is_restrict_violation: BOOLEAN
		do
			Result := (value=gda_connection_event_code_restrict_violation)
		end

	is_not_null_violation: BOOLEAN
		do
			Result := (value=gda_connection_event_code_not_null_violation)
		end

	is_foreign_key_violation: BOOLEAN
		do
			Result := (value=gda_connection_event_code_foreign_key_violation)
		end

	is_unique_violation: BOOLEAN
		do
			Result := (value=gda_connection_event_code_unique_violation)
		end

	is_check_violation: BOOLEAN
		do
			Result := (value=gda_connection_event_code_check_violation)
		end

	is_insufficient_privileges: BOOLEAN
		do
			Result := (value=gda_connection_event_code_insufficient_privileges)
		end

	is_undefined_column: BOOLEAN
		do
			Result := (value=gda_connection_event_code_undefined_column)
		end

	is_undefined_function: BOOLEAN
		do
			Result := (value=gda_connection_event_code_undefined_function)
		end

	is_undefined_table: BOOLEAN
		do
			Result := (value=gda_connection_event_code_undefined_table)
		end

	is_duplicate_column: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_column)
		end

	is_duplicate_database: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_database)
		end

	is_duplicate_function: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_function)
		end

	is_duplicate_schema: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_schema)
		end

	is_duplicate_table: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_table)
		end

	is_duplicate_alias: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_alias)
		end

	is_duplicate_object: BOOLEAN
		do
			Result := (value=gda_connection_event_code_duplicate_object)
		end

	is_syntax_error: BOOLEAN
		do
			Result := (value=gda_connection_event_code_syntax_error)
		end

	is_unknown: BOOLEAN
		do
			Result := (value=gda_connection_event_code_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_event_code_constraint_violation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_CONSTRAINT_VIOLATION"
		end

	gda_connection_event_code_restrict_violation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_RESTRICT_VIOLATION"
		end

	gda_connection_event_code_not_null_violation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_NOT_NULL_VIOLATION"
		end

	gda_connection_event_code_foreign_key_violation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_FOREIGN_KEY_VIOLATION"
		end

	gda_connection_event_code_unique_violation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNIQUE_VIOLATION"
		end

	gda_connection_event_code_check_violation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_CHECK_VIOLATION"
		end

	gda_connection_event_code_insufficient_privileges: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_INSUFFICIENT_PRIVILEGES"
		end

	gda_connection_event_code_undefined_column: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNDEFINED_COLUMN"
		end

	gda_connection_event_code_undefined_function: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNDEFINED_FUNCTION"
		end

	gda_connection_event_code_undefined_table: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNDEFINED_TABLE"
		end

	gda_connection_event_code_duplicate_column: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_COLUMN"
		end

	gda_connection_event_code_duplicate_database: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_DATABASE"
		end

	gda_connection_event_code_duplicate_function: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_FUNCTION"
		end

	gda_connection_event_code_duplicate_schema: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_SCHEMA"
		end

	gda_connection_event_code_duplicate_table: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_TABLE"
		end

	gda_connection_event_code_duplicate_alias: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_ALIAS"
		end

	gda_connection_event_code_duplicate_object: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_OBJECT"
		end

	gda_connection_event_code_syntax_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_SYNTAX_ERROR"
		end

	gda_connection_event_code_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNKNOWN"
		end


end

