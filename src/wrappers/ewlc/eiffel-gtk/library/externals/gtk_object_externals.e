note
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
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_OBJECT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- enum

	gtk_object_flags (obj: POINTER): INTEGER is
			-- Gets the GtkObjectFlags for an object without directly accessing its members.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_OBJECT_FLAGS"
		end

	gtk_object_sink (object: POINTER) is
			-- Removes the floating reference from a GtkObject, if it exists;
			-- otherwise does nothing. See the GtkObject overview documentation at
			-- the top of the page.  object : the object to sink.  --
		external "C use <gtk/gtk.h>"
		end

	gtk_object_destroy (object: POINTER) is
			-- Emits the "destroy" signal notifying all reference holders that they
			-- should release the GtkObject. See the overview documentation at the
			-- top of the page for more details.
			
			-- The memory for the object itself won't be deleted until its
			-- reference count actually drops to 0; gtk_object_destroy() merely
			-- asks reference holders to release their references, it does not free
			-- the object.  -- object : the object to destroy.
		external "C use <gtk/gtk.h>"
		end


-- Signals
-- The "destroy" signal

-- void        user_function                  (GtkObject *object,
--                                             gpointer user_data);

-- Signals that all holders of a reference to the GtkObject should release the reference that they hold. May result in finalization of the object if all references are released.
-- object : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- See Also

-- GObject
-- 				 << GtkMisc 	GtkPaned >>

end

