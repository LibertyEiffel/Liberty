indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class GDA_CONNECTION_EVENT_CODE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_connection_event_code (a_code: INTEGER): BOOLEAN is
		do	
			Result:=((a_code=gda_connection_event_code_constraint_violation) or else
						(a_code=gda_connection_event_code_restrict_violation) or else
						(a_code=gda_connection_event_code_not_null_violation) or else
						(a_code=gda_connection_event_code_foreign_key_violation) or else
						(a_code=gda_connection_event_code_unique_violation) or else
						(a_code=gda_connection_event_code_check_violation) or else
						(a_code=gda_connection_event_code_insufficient_privileges) or else
						(a_code=gda_connection_event_code_undefined_column) or else
						(a_code=gda_connection_event_code_undefined_function) or else
						(a_code=gda_connection_event_code_undefined_table) or else
						(a_code=gda_connection_event_code_duplicate_column) or else
						(a_code=gda_connection_event_code_duplicate_database) or else
						(a_code=gda_connection_event_code_duplicate_function) or else
						(a_code=gda_connection_event_code_duplicate_schema) or else
						(a_code=gda_connection_event_code_duplicate_table) or else
						(a_code=gda_connection_event_code_duplicate_alias) or else
						(a_code=gda_connection_event_code_duplicate_object) or else
						(a_code=gda_connection_event_code_syntax_error) or else
						(a_code=gda_connection_event_code_unknown))
		end

	gda_connection_event_code_constraint_violation: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_CONSTRAINT_VIOLATION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_CONSTRAINT_VIOLATION"
		end

	gda_connection_event_code_restrict_violation: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_RESTRICT_VIOLATION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_RESTRICT_VIOLATION"
		end

	gda_connection_event_code_not_null_violation: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_NOT_NULL_VIOLATION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_NOT_NULL_VIOLATION"
		end

	gda_connection_event_code_foreign_key_violation: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_FOREIGN_KEY_VIOLATION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_FOREIGN_KEY_VIOLATION"
		end

	gda_connection_event_code_unique_violation: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_UNIQUE_VIOLATION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNIQUE_VIOLATION"
		end

	gda_connection_event_code_check_violation: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_CHECK_VIOLATION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_CHECK_VIOLATION"
		end

	gda_connection_event_code_insufficient_privileges: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_INSUFFICIENT_PRIVILEGES
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_INSUFFICIENT_PRIVILEGES"
		end

	gda_connection_event_code_undefined_column: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_UNDEFINED_COLUMN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNDEFINED_COLUMN"
		end

	gda_connection_event_code_undefined_function: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_UNDEFINED_FUNCTION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNDEFINED_FUNCTION"
		end

	gda_connection_event_code_undefined_table: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_UNDEFINED_TABLE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNDEFINED_TABLE"
		end

	gda_connection_event_code_duplicate_column: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_COLUMN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_COLUMN"
		end

	gda_connection_event_code_duplicate_database: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_DATABASE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_DATABASE"
		end

	gda_connection_event_code_duplicate_function: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_FUNCTION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_FUNCTION"
		end

	gda_connection_event_code_duplicate_schema: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_SCHEMA
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_SCHEMA"
		end

	gda_connection_event_code_duplicate_table: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_TABLE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_TABLE"
		end

	gda_connection_event_code_duplicate_alias: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_ALIAS
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_ALIAS"
		end

	gda_connection_event_code_duplicate_object: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_DUPLICATE_OBJECT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_DUPLICATE_OBJECT"
		end

	gda_connection_event_code_syntax_error: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_SYNTAX_ERROR
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_SYNTAX_ERROR"
		end

	gda_connection_event_code_unknown: INTEGER is
			-- GDA_CONNECTION_EVENT_CODE_UNKNOWN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_CODE_UNKNOWN"
		end
end
