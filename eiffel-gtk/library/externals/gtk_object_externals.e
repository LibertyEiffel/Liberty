indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GTK_OBJECT_EXTERNALS
feature {NONE}
	gtk_object_flags (obj: POINTER): INTEGER is
			-- Gets the GtkObjectFlags for an object without directly accessing its members.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_OBJECT_FLAGS"
		end 


	gtk_object_floating (obj: POINTER): INTEGER is
			-- Evaluates to TRUE if the object still has its floating reference
			-- count. See the overview documentation for GtkObject.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_OBJECT_FLOATING"
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
				 
