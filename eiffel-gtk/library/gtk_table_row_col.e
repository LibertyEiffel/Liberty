indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TABLE_ROW_COL
inherit

	_EXTERNALS
	C_STRUCT
	
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof()"
		end

feature {NONE} -- Creation
end
--   GtkTableRowCol

--  typedef struct {
--    guint16 requisition;
--    guint16 allocation;
--    guint16 spacing;
--    guint need_expand : 1;
--    guint need_shrink : 1;
--    guint expand : 1;
--    guint shrink : 1;
--    guint empty : 1;
--  } GtkTableRowCol;

--    These fields should be considered read-only and not be modified directly.

--    --------------------------------------------------------------------------
