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

deferred class GDA_PARAMETER_LIST_PARAM_HINT_ENUM
feature  -- enum
	is_valid_ (a_ :INTEGER): BOOLEAN is
		do	
			Result:=()
		end
enum 

typedef enum {
	GDA_PARAMETER_LIST_PARAM_READ_ONLY = 1 << 0, /* param should not be affected by user modifications */
	GDA_PARAMETER_LIST_PARAM_HIDE      = 1 << 1  /* param should not be shown to the user */
} GdaParameterListParamHint;

end
