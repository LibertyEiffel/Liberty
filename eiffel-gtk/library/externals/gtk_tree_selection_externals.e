indexing
	description: "External calls for gtk tree selection"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_SELECTION_EXTERNALS
inherit GTK_SELECTION_MODE
feature {NONE}
	gtk_tree_selection_set_mode (a_gtktreeselection: POINTER; a_gtkselectionmode: INTEGER) is
		require is_valid_mode: is_valid_gtk_selection_mode (a_gtkselectionmode)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_mode (a_gtktreeselection: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		ensure is_valid_mode: is_valid_gtk_selection_mode (Result)
		end
	
	gtk_tree_selection_set_select_function (a_gtktreeselection, a_gtktreeselectionfunc, some_data, a_gtkdestroynotify : POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_user_data (a_gtktreeselection: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_tree_view (a_gtktreeselection: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_get_selected (a_gtktreeselection a_gtktreemodel_ptr, a_gtktreeiter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_selected_foreach (a_gtktreeselection, a_gtktreeselectionforeachfunc, some_data: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_selected_rows (a_gtktreeselection, a_gtktreemodel_ptr: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_count_selected_rows (a_gtktreeselection: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_select_path  (a_gtktreeselection, a_gtktreepath: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_unselect_path (a_gtktreeselection, a_gtktreepath: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_path_is_selected (a_gtktreeselection, a_gtktreepath: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_select_iter  (a_gtktreeselection, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_unselect_iter (a_gtktreeselection, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_iter_is_selected (a_gtktreeselection, a_gtktreeiter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_select_all   (a_gtktreeselection: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_unselect_all (a_gtktreeselection: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_select_range (a_gtktreeselection, a_start_gtk_tree_path, an_end_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_unselect_range (a_gtktreeselection, a_start_gtk_tree_path, an_end_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end


end
