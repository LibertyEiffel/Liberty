indexing
	description: "Enum  GtkSelectionMode Used to control what selections users are allowed to make."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_SELECTION_MODE
feature  -- enum
	is_valid_gtk_selection_mode (a_mode: INTEGER): BOOLEAN is
		do	
			Result:=((a_mode = gtk_selection_none) or else
						(a_mode = gtk_selection_single) or else
						(a_mode = gtk_selection_browse) or else
						(a_mode = gtk_selection_multiple))
		end

	gtk_selection_none: INTEGER is
			-- 	No selection is possible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_NONE"
		end

	gtk_selection_single: INTEGER is
			-- 	Zero or one element may be selected.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_SINGLE"
		end

	gtk_selection_browse: INTEGER is
			-- Exactly one element is selected. In some circumstances,
			-- such as initially or during a search operation, it's
			-- possible for no element to be selected with
			-- GTK_SELECTION_BROWSE. What is really enforced is that the
			-- user can't deselect a currently selected element except by
			-- selecting another element.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_BROWSE"
		end
	
	gtk_selection_multiple: INTEGER is
			-- Any number of elements may be selected. Clicks toggle the
			-- state of an item. Any number of elements may be
			-- selected. The Ctrl key may be used to enlarge the
			-- selection, and Shift key to select between the focus and
			-- the child pointed to. Some widgets may also allow
			-- Click-drag to select a range of elements.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_MULTIPLE"
		end
	
end
