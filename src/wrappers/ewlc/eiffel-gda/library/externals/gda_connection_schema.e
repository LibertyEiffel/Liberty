-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_SCHEMA
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_aggregates
		do
			value := gda_connection_schema_aggregates
		end

	set_databases
		do
			value := gda_connection_schema_databases
		end

	set_fields
		do
			value := gda_connection_schema_fields
		end

	set_indexes
		do
			value := gda_connection_schema_indexes
		end

	set_languages
		do
			value := gda_connection_schema_languages
		end

	set_namespaces
		do
			value := gda_connection_schema_namespaces
		end

	set_parent_tables
		do
			value := gda_connection_schema_parent_tables
		end

	set_procedures
		do
			value := gda_connection_schema_procedures
		end

	set_sequences
		do
			value := gda_connection_schema_sequences
		end

	set_tables
		do
			value := gda_connection_schema_tables
		end

	set_triggers
		do
			value := gda_connection_schema_triggers
		end

	set_types
		do
			value := gda_connection_schema_types
		end

	set_users
		do
			value := gda_connection_schema_users
		end

	set_views
		do
			value := gda_connection_schema_views
		end

	set_constraints
		do
			value := gda_connection_schema_constraints
		end

	set_table_contents
		do
			value := gda_connection_schema_table_contents
		end


feature {ANY} -- Queries
	is_aggregates: BOOLEAN
		do
			Result := (value=gda_connection_schema_aggregates)
		end

	is_databases: BOOLEAN
		do
			Result := (value=gda_connection_schema_databases)
		end

	is_fields: BOOLEAN
		do
			Result := (value=gda_connection_schema_fields)
		end

	is_indexes: BOOLEAN
		do
			Result := (value=gda_connection_schema_indexes)
		end

	is_languages: BOOLEAN
		do
			Result := (value=gda_connection_schema_languages)
		end

	is_namespaces: BOOLEAN
		do
			Result := (value=gda_connection_schema_namespaces)
		end

	is_parent_tables: BOOLEAN
		do
			Result := (value=gda_connection_schema_parent_tables)
		end

	is_procedures: BOOLEAN
		do
			Result := (value=gda_connection_schema_procedures)
		end

	is_sequences: BOOLEAN
		do
			Result := (value=gda_connection_schema_sequences)
		end

	is_tables: BOOLEAN
		do
			Result := (value=gda_connection_schema_tables)
		end

	is_triggers: BOOLEAN
		do
			Result := (value=gda_connection_schema_triggers)
		end

	is_types: BOOLEAN
		do
			Result := (value=gda_connection_schema_types)
		end

	is_users: BOOLEAN
		do
			Result := (value=gda_connection_schema_users)
		end

	is_views: BOOLEAN
		do
			Result := (value=gda_connection_schema_views)
		end

	is_constraints: BOOLEAN
		do
			Result := (value=gda_connection_schema_constraints)
		end

	is_table_contents: BOOLEAN
		do
			Result := (value=gda_connection_schema_table_contents)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_schema_aggregates: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_AGGREGATES"
		end

	gda_connection_schema_databases: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_DATABASES"
		end

	gda_connection_schema_fields: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_FIELDS"
		end

	gda_connection_schema_indexes: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_INDEXES"
		end

	gda_connection_schema_languages: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_LANGUAGES"
		end

	gda_connection_schema_namespaces: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_NAMESPACES"
		end

	gda_connection_schema_parent_tables: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_PARENT_TABLES"
		end

	gda_connection_schema_procedures: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_PROCEDURES"
		end

	gda_connection_schema_sequences: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_SEQUENCES"
		end

	gda_connection_schema_tables: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TABLES"
		end

	gda_connection_schema_triggers: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TRIGGERS"
		end

	gda_connection_schema_types: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TYPES"
		end

	gda_connection_schema_users: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_USERS"
		end

	gda_connection_schema_views: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_VIEWS"
		end

	gda_connection_schema_constraints: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_CONSTRAINTS"
		end

	gda_connection_schema_table_contents: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_SCHEMA_TABLE_CONTENTS"
		end


end

