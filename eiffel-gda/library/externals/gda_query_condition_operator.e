indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
					
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

deferred class GDA_QUERY_CONDITION_OPERATOR

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_condition_operator (an_op: INTEGER): BOOLEAN is
		do	
			Result:=((an_op = gda_query_condition_op_left) or else
						(an_op = gda_query_condition_op_right) or else
						(an_op = gda_query_condition_op_right2))
		end

	gda_query_condition_op_left: INTEGER is
			-- GDA_QUERY_CONDITION_OP_LEFT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_OP_LEFT"
		end

	gda_query_condition_op_right: INTEGER is
			-- GDA_QUERY_CONDITION_OP_RIGHT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_OP_RIGHT"
		end

	gda_query_condition_op_right2: INTEGER is
			-- GDA_QUERY_CONDITION_OP_RIGHT2
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_OP_RIGHT2"
		end

end
