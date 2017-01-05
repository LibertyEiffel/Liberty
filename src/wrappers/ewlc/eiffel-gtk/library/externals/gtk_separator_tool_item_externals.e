note
	description: "External calls for "
	copyright: "Copyright (C) 2007-2017: Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_SEPARATOR_TOOL_ITEM_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_separator_tool_item_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_separator_tool_item_set_draw(a_separator: POINTER; a_draw_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_separator_tool_item_get_draw (an_item: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
end
