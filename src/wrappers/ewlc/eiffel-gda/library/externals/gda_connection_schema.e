-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_SCHEMA
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_connection_schema_aggregates) or else 
				(a_value = gda_connection_schema_databases) or else 
				(a_value = gda_connection_schema_fields) or else 
				(a_value = gda_connection_schema_indexes) or else 
				(a_value = gda_connection_schema_languages) or else 
				(a_value = gda_connection_schema_namespaces) or else 
				(a_value = gda_connection_schema_parent_tables) or else 
				(a_value = gda_connection_schema_procedures) or else 
				(a_value = gda_connection_schema_sequences) or else 
				(a_value = gda_connection_schema_tables) or else 
				(a_value = gda_connection_schema_triggers) or else 
				(a_value = gda_connection_schema_types) or else 
				(a_value = gda_connection_schema_users) or else 
				(a_value = gda_connection_schema_views) or else 
				(a_value = gda_connection_schema_constraints) or else 
				(a_value = gda_connection_schema_table_contents))
		end


feature {ANY} -- Setters
	default_create, set_aggregates is
		do
			value := gda_connection_schema_aggregates
		end

	set_databases is
		do
			value := gda_connection_schema_databases
		end

	set_fields is
		do
			value := gda_connection_schema_fields
		end

	set_indexes is
		do
			value := gda_connection_schema_indexes
		end

	set_languages is
		do
			value := gda_connection_schema_languages
		end

	set_namespaces is
		do
			value := gda_connection_schema_namespaces
		end

	set_parent_tables is
		do
			value := gda_connection_schema_parent_tables
		end

	set_procedures is
		do
			value := gda_connection_schema_procedures
		end

	set_sequences is
		do
			value := gda_connection_schema_sequences
		end

	set_tables is
		do
			value := gda_connection_schema_tables
		end

	set_triggers is
		do
			value := gda_connection_schema_triggers
		end

	set_types is
		do
			value := gda_connection_schema_types
		end

	set_users is
		do
			value := gda_connection_schema_users
		end

	set_views is
		do
			value := gda_connection_schema_views
		end

	set_constraints is
		do
			value := gda_connection_schema_constraints
		end

	set_table_contents is
		do
			value := gda_connection_schema_table_contents
		end


feature {ANY} -- Queries
	is_aggregates: BOOLEAN is
		do
			Result := (value=gda_connection_schema_aggregates)
		end

	is_databases: BOOLEAN is
		do
			Result := (value=gda_connection_schema_databases)
		end

	is_fields: BOOLEAN is
		do
			Result := (value=gda_connection_schema_fields)
		end

	is_indexes: BOOLEAN is
		do
			Result := (value=gda_connection_schema_indexes)
		end

	is_languages: BOOLEAN is
		do
			Result := (value=gda_connection_schema_languages)
		end

	is_namespaces: BOOLEAN is
		do
			Result := (value=gda_connection_schema_namespaces)
		end

	is_parent_tables: BOOLEAN is
		do
			Result := (value=gda_connection_schema_parent_tables)
		end

	is_procedures: BOOLEAN is
		do
			Result := (value=gda_connection_schema_procedures)
		end

	is_sequences: BOOLEAN is
		do
			Result := (value=gda_connection_schema_sequences)
		end

	is_tables: BOOLEAN is
		do
			Result := (value=gda_connection_schema_tables)
		end

	is_triggers: BOOLEAN is
		do
			Result := (value=gda_connection_schema_triggers)
		end

	is_types: BOOLEAN is
		do
			Result := (value=gda_connection_schema_types)
		end

	is_users: BOOLEAN is
		do
			Result := (value=gda_connection_schema_users)
		end

	is_views: BOOLEAN is
		do
			Result := (value=gda_connection_schema_views)
		end

	is_constraints: BOOLEAN is
		do
			Result := (value=gda_connection_schema_constraints)
		end

	is_table_contents: BOOLEAN is
		do
			Result := (value=gda_connection_schema_table_contents)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_schema_aggregates: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_AGGREGATES"
		end

	gda_connection_schema_databases: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_DATABASES"
		end

	gda_connection_schema_fields: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_FIELDS"
		end

	gda_connection_schema_indexes: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_INDEXES"
		end

	gda_connection_schema_languages: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_LANGUAGES"
		end

	gda_connection_schema_namespaces: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_NAMESPACES"
		end

	gda_connection_schema_parent_tables: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_PARENT_TABLES"
		end

	gda_connection_schema_procedures: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_PROCEDURES"
		end

	gda_connection_schema_sequences: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_SEQUENCES"
		end

	gda_connection_schema_tables: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TABLES"
		end

	gda_connection_schema_triggers: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TRIGGERS"
		end

	gda_connection_schema_types: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TYPES"
		end

	gda_connection_schema_users: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_USERS"
		end

	gda_connection_schema_views: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_VIEWS"
		end

	gda_connection_schema_constraints: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_CONSTRAINTS"
		end

	gda_connection_schema_table_contents: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TABLE_CONTENTS"
		end


end

