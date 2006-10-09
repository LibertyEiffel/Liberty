indexing
	description: "Enum GdaCommandType"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GDA team
					
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

deferred class GDA_COMMAND_TYPE_ENUM

insert ANY undefine copy, is_equal end

feature  -- enum
	is_valid_command_type (a_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_command_type_sql) or else
						(a_type = gda_command_type_xml) or else
						(a_type = gda_command_type_procedure) or else
						(a_type = gda_command_type_table) or else
						(a_type = gda_command_type_schema) or else
						(a_type = gda_command_type_invalid))
		end

	gda_command_type_sql: INTEGER is
			-- the text of the command is composed of zero or more SQL sentences.
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_TYPE_SQL"
		end

	gda_command_type_xml: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_TYPE_XML"
		end

	gda_command_type_procedure: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_TYPE_PROCEDURE"
		end

	gda_command_type_table: INTEGER is
			-- the text of the command is composed of zero or more table names.
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_TYPE_TABLE"
		end

	gda_command_type_schema: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_TYPE_SCHEMA"
		end

	gda_command_type_invalid: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_TYPE_INVALID"
		end
end
