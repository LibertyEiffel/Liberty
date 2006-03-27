indexing
	description: "External calls for GtkTreeIter struct. Just commented C docs for now"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_ITER_EXTERNALS
feature {NONE} -- External calls
	get_stamp (iter: POINTER): INTEGER is
		external "C struct GtkTreeIter get stamp use <gtk/gtk.h>"
		end

	set_stamp (iter: POINTER; a_stamp: INTEGER) is
		external "C struct GtkTreeIter set stamp use <gtk/gtk.h>"
		end

-- typedef struct {
--   gint stamp;
--   gpointer user_data;
--   gpointer user_data2;
--   gpointer user_data3;
-- } GtkTreeIter;


-- gint stamp; 	A unique stamp to catch invalid iterators
-- gpointer user_data; 	Model specific data
-- gpointer user_data2; 	Model specific data
-- gpointer user_data3; 	Model specific data
end
