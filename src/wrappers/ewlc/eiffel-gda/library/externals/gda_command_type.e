-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_COMMAND_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_command_type_sql) or else 
				(a_value = gda_command_type_xml) or else 
				(a_value = gda_command_type_procedure) or else 
				(a_value = gda_command_type_table) or else 
				(a_value = gda_command_type_schema) or else 
				(a_value = gda_command_type_invalid))
		end


feature {ANY} -- Setters
	default_create, set_sql
		do
			value := gda_command_type_sql
		end

	set_xml
		do
			value := gda_command_type_xml
		end

	set_procedure
		do
			value := gda_command_type_procedure
		end

	set_table
		do
			value := gda_command_type_table
		end

	set_schema
		do
			value := gda_command_type_schema
		end

	set_invalid
		do
			value := gda_command_type_invalid
		end


feature {ANY} -- Queries
	is_sql: BOOLEAN
		do
			Result := (value=gda_command_type_sql)
		end

	is_xml: BOOLEAN
		do
			Result := (value=gda_command_type_xml)
		end

	is_procedure: BOOLEAN
		do
			Result := (value=gda_command_type_procedure)
		end

	is_table: BOOLEAN
		do
			Result := (value=gda_command_type_table)
		end

	is_schema: BOOLEAN
		do
			Result := (value=gda_command_type_schema)
		end

	is_invalid: BOOLEAN
		do
			Result := (value=gda_command_type_invalid)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_command_type_sql: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_TYPE_SQL"
		end

	gda_command_type_xml: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_TYPE_XML"
		end

	gda_command_type_procedure: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_TYPE_PROCEDURE"
		end

	gda_command_type_table: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_TYPE_TABLE"
		end

	gda_command_type_schema: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_TYPE_SCHEMA"
		end

	gda_command_type_invalid: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_TYPE_INVALID"
		end


end

