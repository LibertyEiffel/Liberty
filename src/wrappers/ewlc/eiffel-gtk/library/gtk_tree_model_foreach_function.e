note
	description: "Callback for GtkTreeModelForeachFunc"
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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
	
class GTK_TREE_MODEL_FOREACH_FUNCTION
	-- GtkTreeModelForeachFunc ()
	
	-- gboolean (*GtkTreeModelForeachFunc) (GtkTreeModel *model,
	-- GtkTreePath *path, GtkTreeIter *iter, gpointer data);
	
inherit WRAPPER_HANDLER -- It wraps a callback function
	
insert
	ANY
	GTK
	
create {ANY} make
	
feature {ANY}
	make (a_function: FUNCTION[TUPLE[GTK_TREE_MODEL, GTK_TREE_PATH, GTK_TREE_ITER], BOOLEAN])
		require gtk_initialized: gtk.is_initialized
		do
			function := a_function
		end
	
feature {} -- 
	low_level_callback (model,path,iter,data: POINTER): INTEGER
			-- Low level callback will be called by GTK; it will call
			-- `callback'.
		external "C use <callbacks.h>"
		alias "EiffelGtkTreeForeachFunc"
		end 

feature {ANY}
	callback (model_ptr, path_ptr, iter_ptr, data: POINTER): INTEGER
		local 
			a_model: GTK_TREE_MODEL; 
			a_path: GTK_TREE_PATH; 
			an_iter: GTK_TREE_ITER
			factory: G_OBJECT_EXPANDED_FACTORY [GTK_TREE_MODEL]
		do
			debug
				print ("Gtk tree select foreach function callback:")
				print (" model=") print(model_ptr.to_string) 
				print (" path=") print(path_ptr.to_string)
				print (" path=") print(iter_ptr.to_string) 				
				print (" data=") print (data.to_string)
				print ("%N")
			end
			
			a_model := factory.wrapper (model_ptr)
			create a_path.from_external_pointer (path_ptr)
			create an_iter.from_external_pointer (iter_ptr)
			Result := (function.item ([a_model,a_path,an_iter]).to_integer)
		end
	
	function: FUNCTION[TUPLE[GTK_TREE_MODEL, GTK_TREE_PATH, GTK_TREE_ITER], BOOLEAN]
end
