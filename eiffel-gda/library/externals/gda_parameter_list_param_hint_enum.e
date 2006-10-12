indexing
	description: "enum GdaParameterListParamHint"
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

deferred class GDA_PARAMETER_LIST_PARAM_HINT_ENUM

insert ANY undefine copy, is_equal end

feature {} -- enum
	is_valid_param_hint (an_hint :INTEGER): BOOLEAN is
		do	
			Result:=((an_hint = gda_parameter_list_param_read_only) or else 
						(an_hint = gda_parameter_list_param_hide))
		end
	
	gda_parameter_list_param_read_only: INTEGER is
			-- param should not be affected by user modifications 
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_PARAM_READ_ONLY"
		end
	
	gda_parameter_list_param_hide: INTEGER is
			-- param should not be shown to the user 
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_PARAM_HIDE"
		end
end



