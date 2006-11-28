indexing
	description: "Enum "
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

deferred class GDA_DICT_CONSTRAINT_TYPE_ENUM

inherit ANY undefine is_equal, copy end


feature  -- enum
	is_valid_constraint_type (a_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_type=constraint_primary_key) or else 
						(a_type=constraint_foreign_key) or else 
						(a_type=constraint_unique) or else 
						(a_type=constraint_not_null) or else 
						(a_type=constraint_check_expr) or else 
						(a_type=constraint_check_in_list) or else 
						(a_type=constraint_check_setof_list) or else 
						(a_type=constraint_unknown))
		end

	constraint_primary_key: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end
	
	constraint_foreign_key: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_unique: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_not_null: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_check_expr: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_check_in_list: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_check_setof_list: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_unknown: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end
end
