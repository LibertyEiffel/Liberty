note
	description: "External calls for gtk tree selection"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
					]"					
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_SELECTION_EXTERNALS
inherit ANY undefine is_equal, copy end
insert GTK_SELECTION_MODE
	
feature {}
	gtk_tree_selection_set_mode (a_gtktreeselection: POINTER; a_gtkselectionmode: INTEGER)
		require is_valid_mode: is_valid_gtk_selection_mode (a_gtkselectionmode)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_mode (a_gtktreeselection: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure is_valid_mode: is_valid_gtk_selection_mode (Result)
		end
	
	gtk_tree_selection_set_select_function (a_gtktreeselection, a_gtktreeselectionfunc, some_data, a_gtkdestroynotify : POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_user_data (a_gtktreeselection: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_tree_view (a_gtktreeselection: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_get_selected (a_gtktreeselection, a_gtktreemodel_ptr, a_gtktreeiter: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_selected_foreach (a_gtktreeselection, a_gtktreeselectionforeachfunc, some_data: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_get_selected_rows (a_gtktreeselection, a_gtktreemodel_ptr: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_count_selected_rows (a_gtktreeselection: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_select_path  (a_gtktreeselection, a_gtktreepath: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_unselect_path (a_gtktreeselection, a_gtktreepath: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_path_is_selected (a_gtktreeselection, a_gtktreepath: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_select_iter  (a_gtktreeselection, a_gtktreeiter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_unselect_iter (a_gtktreeselection, a_gtktreeiter: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_iter_is_selected (a_gtktreeselection, a_gtktreeiter: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_select_all   (a_gtktreeselection: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_unselect_all (a_gtktreeselection: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_selection_select_range (a_gtktreeselection, a_start_gtk_tree_path, an_end_gtk_tree_path: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_selection_unselect_range (a_gtktreeselection, a_start_gtk_tree_path, an_end_gtk_tree_path: POINTER)
		external "C use <gtk/gtk.h>"
		end


end
