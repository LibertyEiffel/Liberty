indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_SELECTION_DATA
inherit C_STRUCT -- TODO: check if SHARED_C_STRUCT is a better choice
creation make, from_external_pointer

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSelectionData)"
		end

feature {NONE} -- Creation

--   GtkSelectionData

-- typedef struct {
--   GdkAtom       selection;
--   GdkAtom       target;
--   GdkAtom       type;
--   gint          format;
--   guchar       *data;
--   gint          length;
--   GdkDisplay   *display;
-- } GtkSelectionData;
end
