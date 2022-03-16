note
	description: "A structure which contains a single enum value, it's name, and it's nickname.."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

class G_ENUM_VALUE

inherit 
	C_STRUCT
	SHARED

create {ANY} from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib-object.h>"
		alias "sizeof(GEnumValue)"
		end

feature {ANY} 

	value: INTEGER
		-- the enum value
		do
			Result:=get_value (handle)
		end

	name: STRING
			-- the name of the value
		do
			create Result.from_external_copy (get_name(handle))
		end

	nick: STRING
			-- the nickname of the value
		do
			create Result.from_external_copy (get_nick(handle))
		end

feature {} -- External call
	-- GEnumValue
	
	-- typedef struct {
	--   gint	 value;
	--   gchar *value_name;
	--   gchar *value_nick;
	--} ;

	get_value (a_genum_value: POINTER): INTEGER
		external "C struct GEnumValue get value use <glib-object.h>"
		end

	get_name (a_genum_value: POINTER): POINTER
		external "C struct GEnumValue get value_name use <glib-object.h>"
		end

	get_nick (a_genum_value: POINTER): POINTER
		external "C struct GEnumValue get value_nick use <glib-object.h>"
		end
end
