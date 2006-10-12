indexing
	description: "enum GdaConnectionSchema"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GDA_CONNECTION_SCHEMA_ENUM
feature {} -- enum
	is_valid_schema (a_schema :INTEGER): BOOLEAN is
		do	
			Result:=((a_schema = gda_connection_schema_aggregates) or else
						(a_schema = gda_connection_schema_databases) or else
						(a_schema = gda_connection_schema_fields) or else
						(a_schema = gda_connection_schema_indexes) or else
						(a_schema = gda_connection_schema_languages) or else
						(a_schema = gda_connection_schema_namespaces) or else
						(a_schema = gda_connection_schema_parent_tables) or else
						(a_schema = gda_connection_schema_procedures) or else
						(a_schema = gda_connection_schema_sequences) or else
						(a_schema = gda_connection_schema_tables) or else
						(a_schema = gda_connection_schema_triggers) or else
						(a_schema = gda_connection_schema_types) or else
						(a_schema = gda_connection_schema_users) or else
						(a_schema = gda_connection_schema_views) or else
						(a_schema = gda_connection_schema_constraints) or else						
						(a_schema = gda_connection_schema_table_contents))
		end

	gda_connection_schema_aggregates: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_AGGREGATES"
      end
	
	gda_connection_schema_databases: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_DATABASES"
      end
	
	gda_connection_schema_fields: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_FIELDS"
      end
	
	gda_connection_schema_indexes: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_INDEXES"
      end
	
	gda_connection_schema_languages: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_LANGUAGES"
      end
	
	gda_connection_schema_namespaces: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_NAMESPACES"
      end
	
	gda_connection_schema_parent_tables: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_PARENT_TABLES"
      end
	
	gda_connection_schema_procedures: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_PROCEDURES"
      end
	
	gda_connection_schema_sequences: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_SEQUENCES"
      end
	
	gda_connection_schema_tables: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_TABLES"
      end
	
	gda_connection_schema_triggers: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_TRIGGERS"
      end
	
	gda_connection_schema_types: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_TYPES"
      end
	
	gda_connection_schema_users: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_USERS"
      end
	
	gda_connection_schema_views: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_VIEWS"
      end

	gda_connection_schema_constraints: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_CONSTRAINTS"
      end

	gda_connection_schema_table_contents: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_SCHEMA_TABLE_CONTENTS"
      end
end
