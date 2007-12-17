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

deferred class GDA_QUERY_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_query_type (a_type: INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_query_type_select) or else
						(a_type = gda_query_type_insert) or else
						(a_type = gda_query_type_update) or else
						(a_type = gda_query_type_delete) or else
						(a_type = gda_query_type_union) or else
						(a_type = gda_query_type_intersect) or else
						(a_type = gda_query_type_except) or else
						(a_type = gda_query_type_non_parsed_sql))
		end

	gda_query_type_select: INTEGER is
			-- GDA_QUERY_TYPE_SELECT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_SELECT"
		end

	gda_query_type_insert: INTEGER is
			-- GDA_QUERY_TYPE_INSERT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_INSERT"
		end

	gda_query_type_update: INTEGER is
			-- GDA_QUERY_TYPE_UPDATE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_UPDATE"
		end

	gda_query_type_delete: INTEGER is
			-- GDA_QUERY_TYPE_DELETE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_DELETE"
		end

	gda_query_type_union: INTEGER is
			-- GDA_QUERY_TYPE_UNION
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_UNION"
		end

	gda_query_type_intersect: INTEGER is
			-- GDA_QUERY_TYPE_INTERSECT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_INTERSECT"
		end

	gda_query_type_except: INTEGER is
			-- GDA_QUERY_TYPE_EXCEPT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_EXCEPT"
		end

	gda_query_type_non_parsed_sql: INTEGER is
			-- GDA_QUERY_TYPE_NON_PARSED_SQL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_NON_PARSED_SQL"
		end

end
