indexing
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
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

class GTK_TREE_PATH_LIST

inherit 	G_LIST[GTK_TREE_PATH] redefine dispose end

insert GTK_TREE_MODEL_EXTERNALS undefine fill_tagged_out_memory end

creation make, from_external_pointer

feature -- Disposing
	dispose is 
		do
			g_list_foreach(handle, $gtk_tree_path_free, default_pointer)
			g_list_free(handle)
			handle:=default_pointer
		end

	wrapper (a_pointer: POINTER): GTK_TREE_PATH is
		do
			create Result.from_external_pointer(a_pointer)
		end
end -- class GTK_TREE_PATH_LIST
