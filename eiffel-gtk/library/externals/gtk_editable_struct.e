indexing
	description: "Access to GTK_EDITABLE struct."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_EDITABLE_STRUCT
feature {NONE} -- Access calls
	-- The GtkEditable structure contains the following fields. (These
	-- fields should be considered read-only. They should never be set
	-- by an application.)
	
	get_selection_start (an_editable: POINTER): INTEGER is
			--	(guint) the starting position of the selected characters
			--	in the widget.
		external "C macro get GtkEditable <gtk/gtk.h>"
		end
	
	get_selection_end (an_editable: POINTER): INTEGER is
			-- (guint) the end position of the selected characters in the
			-- widget.
		external "C macro get GtkEditable <gtk/gtk.h>"
		end
	
	get_editable  (an_editable: POINTER): INTEGER is
			-- (guint) a flag indicating whether or not the widget is
			-- editable by the user.
		external "C macro get GtkEditable <gtk/gtk.h>"
		end
end

