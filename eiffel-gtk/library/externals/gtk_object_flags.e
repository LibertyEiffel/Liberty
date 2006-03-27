indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_OBJECT_FLAGS

feature {NONE} -- Enum definitions
	gtk_in_destruction: INTEGER is
			-- the object is currently being destroyed. This is used internally by
			-- GTK+ to prevent reinvokations during destruction.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IN_DESTRUCTION"
		end
	
	gtk_floating: INTEGER is
			-- the object is orphaned. Objects that take strong hold of an object
			-- may gtk_object_sink() it, after obtaining their own references, if
			-- they believe they are nearly primary ownership of the object.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FLOATING"
		end
	
	gtk_connected: INTEGER is
			-- signals are connected to this object.
		external "C macro use <gtk/gtk.h>"
		alias " GTK_CONNECTED"
		end
end
								 
