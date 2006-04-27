indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TABLE_CHILD
inherit SHARED_C_STRUCT
	
creation make, from_external_pointer

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTableChild)"
		end

feature {NONE} -- Creation
end
--   GtkTableChild

--  typedef struct {
--    GtkWidget *widget;
--    guint16 left_attach;
--    guint16 right_attach;
--    guint16 top_attach;
--    guint16 bottom_attach;
--    guint16 xpadding;
--    guint16 ypadding;
--    guint xexpand : 1;
--    guint yexpand : 1;
--    guint xshrink : 1;
--    guint yshrink : 1;
--    guint xfill : 1;
--    guint yfill : 1;
--  } GtkTableChild;

--    The widget field is a pointer to the widget that this GtkTableChild
--    structure is keeping track of. The left_attach, right_attach, top_attach,
--    and bottom_attach fields specify the row and column numbers which make up
--    the invisible rectangle that the child widget is packed into.

--    xpadding and ypadding specify the space between this widget and the
--    surrounding table cells.

end
