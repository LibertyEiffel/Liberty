-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_SERVER_OPERATION_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_server_operation_create_db) or else 
				(a_value = gda_server_operation_drop_db) or else 
				(a_value = gda_server_operation_create_table) or else 
				(a_value = gda_server_operation_drop_table) or else 
				(a_value = gda_server_operation_rename_table) or else 
				(a_value = gda_server_operation_add_column) or else 
				(a_value = gda_server_operation_drop_column) or else 
				(a_value = gda_server_operation_create_index) or else 
				(a_value = gda_server_operation_drop_index) or else 
				(a_value = gda_server_operation_create_view) or else 
				(a_value = gda_server_operation_drop_view) or else 
				(a_value = gda_server_operation_last))
		end


feature {ANY} -- Setters
	default_create, set_create_db is
		do
			value := gda_server_operation_create_db
		end

	set_drop_db is
		do
			value := gda_server_operation_drop_db
		end

	set_create_table is
		do
			value := gda_server_operation_create_table
		end

	set_drop_table is
		do
			value := gda_server_operation_drop_table
		end

	set_rename_table is
		do
			value := gda_server_operation_rename_table
		end

	set_add_column is
		do
			value := gda_server_operation_add_column
		end

	set_drop_column is
		do
			value := gda_server_operation_drop_column
		end

	set_create_index is
		do
			value := gda_server_operation_create_index
		end

	set_drop_index is
		do
			value := gda_server_operation_drop_index
		end

	set_create_view is
		do
			value := gda_server_operation_create_view
		end

	set_drop_view is
		do
			value := gda_server_operation_drop_view
		end

	set_last is
		do
			value := gda_server_operation_last
		end


feature {ANY} -- Queries
	is_create_db: BOOLEAN is
		do
			Result := (value=gda_server_operation_create_db)
		end

	is_drop_db: BOOLEAN is
		do
			Result := (value=gda_server_operation_drop_db)
		end

	is_create_table: BOOLEAN is
		do
			Result := (value=gda_server_operation_create_table)
		end

	is_drop_table: BOOLEAN is
		do
			Result := (value=gda_server_operation_drop_table)
		end

	is_rename_table: BOOLEAN is
		do
			Result := (value=gda_server_operation_rename_table)
		end

	is_add_column: BOOLEAN is
		do
			Result := (value=gda_server_operation_add_column)
		end

	is_drop_column: BOOLEAN is
		do
			Result := (value=gda_server_operation_drop_column)
		end

	is_create_index: BOOLEAN is
		do
			Result := (value=gda_server_operation_create_index)
		end

	is_drop_index: BOOLEAN is
		do
			Result := (value=gda_server_operation_drop_index)
		end

	is_create_view: BOOLEAN is
		do
			Result := (value=gda_server_operation_create_view)
		end

	is_drop_view: BOOLEAN is
		do
			Result := (value=gda_server_operation_drop_view)
		end

	is_last: BOOLEAN is
		do
			Result := (value=gda_server_operation_last)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_server_operation_create_db: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_CREATE_DB"
		end

	gda_server_operation_drop_db: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_DROP_DB"
		end

	gda_server_operation_create_table: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_CREATE_TABLE"
		end

	gda_server_operation_drop_table: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_DROP_TABLE"
		end

	gda_server_operation_rename_table: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_RENAME_TABLE"
		end

	gda_server_operation_add_column: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_ADD_COLUMN"
		end

	gda_server_operation_drop_column: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_DROP_COLUMN"
		end

	gda_server_operation_create_index: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_CREATE_INDEX"
		end

	gda_server_operation_drop_index: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_DROP_INDEX"
		end

	gda_server_operation_create_view: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_CREATE_VIEW"
		end

	gda_server_operation_drop_view: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_DROP_VIEW"
		end

	gda_server_operation_last: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_LAST"
		end


end

