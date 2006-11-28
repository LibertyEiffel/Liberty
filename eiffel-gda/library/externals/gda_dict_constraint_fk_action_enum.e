indexing
	description: "enum GdaDictConstraintFkAction"
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

deferred class GDA_DICT_CONSTRAINT_FK_ACTION_ENUM

inherit ANY undefine is_equal, copy end


feature  -- enum
	is_valid_fk_action (an_action :INTEGER): BOOLEAN is
		do	
			Result:=((an_action=constraint_fk_action_cascade) or else 
						(an_action=constraint_fk_action_set_null) or else 
						(an_action=constraint_fk_action_set_default) or else 
						(an_action=constraint_fk_action_set_value) or else 
						(an_action=constraint_fk_action_no_action))
		end
	
	constraint_fk_action_cascade: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end
	
	constraint_fk_action_set_null: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_fk_action_set_default: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end
	
	constraint_fk_action_set_value: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end

	constraint_fk_action_no_action: INTEGER is
		external "C macro use <libgda/libgda.h>"
		end
end
