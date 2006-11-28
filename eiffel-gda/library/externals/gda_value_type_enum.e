indexing
	description: "Enum GDA_VALUE_TYPE_ENUM"
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

deferred class GDA_VALUE_TYPE_ENUM

inherit ANY undefine is_equal, copy end


feature  {} -- enum
	is_valid_type (a_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_value_type_null) or else
						(a_type = gda_value_type_bigint) or else
						(a_type = gda_value_type_biguint) or else
						(a_type = gda_value_type_binary) or else
						(a_type = gda_value_type_blob) or else
						(a_type = gda_value_type_boolean) or else
						(a_type = gda_value_type_date) or else
						(a_type = gda_value_type_double) or else
						(a_type = gda_value_type_geometric_point) or else
						(a_type = gda_value_type_gobject) or else
						(a_type = gda_value_type_integer) or else
						(a_type = gda_value_type_list) or else
						(a_type = gda_value_type_money) or else
						(a_type = gda_value_type_numeric) or else
						(a_type = gda_value_type_single) or else
						(a_type = gda_value_type_smallint) or else
						(a_type = gda_value_type_smalluint) or else
						(a_type = gda_value_type_string) or else
						(a_type = gda_value_type_time) or else
						(a_type = gda_value_type_timestamp) or else
						(a_type = gda_value_type_tinyint) or else
						(a_type = gda_value_type_tinyuint) or else
						(a_type = gda_value_type_type) or else
						(a_type = gda_value_type_uinteger) or else
						(a_type = gda_value_type_unknown))
		end
	
feature
	gda_value_type_null: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_NULL"
		end

	gda_value_type_bigint: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_BIGINT"
		end

	gda_value_type_biguint: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_BIGUINT"
		end

	gda_value_type_binary: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_BINARY"
		end

	gda_value_type_blob: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_BLOB"
		end

	gda_value_type_boolean: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_BOOLEAN"
		end

	gda_value_type_date: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_DATE"
		end

	gda_value_type_double: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_DOUBLE"
		end

	gda_value_type_geometric_point: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_GEOMETRIC_POINT"
		end

	gda_value_type_gobject: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_GOBJECT"
		end

	gda_value_type_integer: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_INTEGER"
		end

	gda_value_type_list: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_LIST"
		end

	gda_value_type_money: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_MONEY"
		end

	gda_value_type_numeric: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_NUMERIC"
		end

	gda_value_type_single: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_SINGLE"
		end

	gda_value_type_smallint: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_SMALLINT"
		end

	gda_value_type_smalluint: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_SMALLUINT"
		end

	gda_value_type_string: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_STRING"
		end

	gda_value_type_time: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_TIME"
		end

	gda_value_type_timestamp: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_TIMESTAMP"
		end

	gda_value_type_tinyint: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_TINYINT"
		end

	gda_value_type_tinyuint: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_TINYUINT"
		end

	gda_value_type_type: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_TYPE"
		end

	gda_value_type_uinteger: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_UINTEGER"
		end

	gda_value_type_unknown: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_VALUE_TYPE_UNKNOWN"
		end

end
