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

deferred class GDA_SERVER_OPERATION_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_operation_type (a_type: INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_server_operation_create_db) or else
						(a_type = gda_server_operation_drop_db) or else
						(a_type = gda_server_operation_create_table) or else
						(a_type = gda_server_operation_drop_table) or else
						(a_type = gda_server_operation_rename_table) or else
						(a_type = gda_server_operation_add_column) or else
						(a_type = gda_server_operation_drop_column) or else
						(a_type = gda_server_operation_create_index) or else
						(a_type = gda_server_operation_drop_index) or else
						(a_type = gda_server_operation_nb))
		end

	gda_server_operation_create_db: INTEGER is
			-- GDA_SERVER_OPERATION_CREATE_DB
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_CREATE_DB"
		end

	gda_server_operation_drop_db: INTEGER is
			-- GDA_SERVER_OPERATION_DROP_DB
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_DROP_DB"
		end

	gda_server_operation_create_table: INTEGER is
			-- GDA_SERVER_OPERATION_CREATE_TABLE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_CREATE_TABLE"
		end

	gda_server_operation_drop_table: INTEGER is
			-- GDA_SERVER_OPERATION_DROP_TABLE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_DROP_TABLE"
		end

	gda_server_operation_rename_table: INTEGER is
			-- GDA_SERVER_OPERATION_RENAME_TABLE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_RENAME_TABLE"
		end

	gda_server_operation_add_column: INTEGER is
			-- GDA_SERVER_OPERATION_ADD_COLUMN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_ADD_COLUMN"
		end

	gda_server_operation_drop_column: INTEGER is
			-- GDA_SERVER_OPERATION_DROP_COLUMN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_DROP_COLUMN"
		end

	gda_server_operation_create_index: INTEGER is
			-- GDA_SERVER_OPERATION_CREATE_INDEX
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_CREATE_INDEX"
		end

	gda_server_operation_drop_index: INTEGER is
			-- GDA_SERVER_OPERATION_DROP_INDEX
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_DROP_INDEX"
		end

	gda_server_operation_nb: INTEGER is
			-- GDA_SERVER_OPERATION_NB
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NB"
		end
end
