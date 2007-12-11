indexing
	description: "Enum  GDA_DICT_FIELD_ATTRIBUTE_ENUM"
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

deferred class  GDA_DICT_FIELD_ATTRIBUTE_ENUM

insert ANY undefine is_equal, copy end

feature {} -- enum
	are_valid_attributes (some_attributes: INTEGER): BOOLEAN is
		do	
			Result:=(some_attributes=field_auto_increment)
		end

	field_auto_increment: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "FIELD_AUTO_INCREMENT"
		end
end
