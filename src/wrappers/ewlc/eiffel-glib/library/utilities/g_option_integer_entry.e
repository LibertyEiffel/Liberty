note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, Glib developers
					
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

class G_OPTION_INTEGER_ENTRY
	-- A boolean GOptionEntry.

inherit 
	G_OPTION_ENTRY redefine make, fill_tagged_out_memory end 

	-- REFERENCE[INTEGER]

create {ANY} make

feature {ANY}
	make (a_long_name: STRING; a_short_name: CHARACTER; a_description: STRING)
		do
			Precursor (a_long_name,a_short_name, a_description)
			set_arg(handle, g_option_arg_int)
			set_arg_data(handle, $item) 
		end

feature {ANY} -- Queries
	-- GOptionArg arg; The type of the option, as a GOptionArg.
   
	--gpointer arg_data; If the arg type is G_OPTION_ARG_CALLBACK, then
	--arg_data must point to a GOptionArgFunc callback function, which
	--will be called to handle the extra argument. Otherwise, arg_data
	--is a pointer to a location to store the value, the required type
	--of the location depends on the arg type:
	
	-- G_OPTION_ARG_NONE           gboolean
	-- G_OPTION_ARG_STRING         gchar*
	-- G_OPTION_ARG_INT            gint
	-- G_OPTION_ARG_FILENAME       gchar*
	-- G_OPTION_ARG_STRING_ARRAY   gchar**
	-- G_OPTION_ARG_FILENAME_ARRAY gchar**
	-- G_OPTION_ARG_DOUBLE         gdouble

	item: INTEGER

	set_item (a_value: INTEGER)
		do
			item:=a_value
		end

	fill_tagged_out_memory
		do
			Precursor
			item.append_in(tagged_out_memory)
		end
end -- class G_OPTION_INTEGER_ENTRY

