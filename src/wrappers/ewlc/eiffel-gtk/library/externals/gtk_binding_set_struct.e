note
	description: "Access to GtkBinbdingSet C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BINDING_SET_STRUCT
	--  GtkBindingSet
	--
	-- typedef struct {
	--   gchar                 *set_name;
	--   gint                   priority;
	--   GSList                *widget_path_pspecs;
	--   GSList                *widget_class_pspecs;
	--   GSList                *class_branch_pspecs;
	--   GtkBindingEntry       *entries;
	--   GtkBindingEntry       *current;
	--   guint                  parsed : 1; /* From RC content */
	-- } GtkBindingSet;
	--  GtkBindingSet

feature {} -- Structure getter/setter calls
	get_set_name (a_struct: POINTER): POINTER is
			-- gchar *set_name;
		external "C struct GtkBindingSet get set_name use <gtk/gtk.h>"
		end

	set_set_name (a_struct, a_set_name: POINTER) is
		external "C struct GtkBindingSet set set_name use <gtk/gtk.h>"
		end

	get_priority (a_struct: POINTER): INTEGER is
			-- gint priority;
		external "C struct GtkBindingSet get priority use <gtk/gtk.h>"
		end
	
	set_priority (a_struct: POINTER; a_priority: INTEGER) is
		external "C struct GtkBindingSet set priority use <gtk/gtk.h>"
		end

	get_widget_path_pspecs (a_struct: POINTER): POINTER is
			-- GSList *widget_path_pspecs;
		external "C struct GtkBindingSet get widget_path_pspecs use <gtk/gtk.h>"
		end

	set_widget_path_pspecs (a_struct: POINTER; a_widget_path_pspecs: POINTER) is
		external "C struct GtkBindingSet set widget_path_pspecs use <gtk/gtk.h>"
		end
	
	get_widget_class_pspecs (a_struct: POINTER): POINTER is
			-- GSList *widget_class_pspecs;
		external "C struct GtkBindingSet get widget_class_pspecs use <gtk/gtk.h>"
		end

	set_widget_class_pspecs (a_struct, a_widget_class_pspecs: POINTER) is
		external "C struct GtkBindingSet set widget_class_pspecs use <gtk/gtk.h>"
		end

	get_class_branch_pspecs (a_struct: POINTER): POINTER is
			-- GSList *class_branch_pspecs;
		external "C struct GtkBindingSet get class_branch_pspecs use <gtk/gtk.h>"
		end

	set_class_branch_pspecs (a_struct, a_class_branch_pspecs: POINTER) is
		external "C struct GtkBindingSet set class_branch_pspecs use <gtk/gtk.h>"
		end

	get_entries (a_struct: POINTER): POINTER is
			-- GtkBindingEntry *entries;
		external "C struct GtkBindingSet get entries use <gtk/gtk.h>"
		end

	set_entries (a_struct, some_entries: POINTER) is
		external "C struct GtkBindingSet set entries use <gtk/gtk.h>"
		end
	
	get_current (a_struct: POINTER): POINTER is
			-- GtkBindingEntry *current;
		external "C struct GtkBindingSet get current use <gtk/gtk.h>"
		end

	set_current (a_struct, a_current: POINTER) is
		external "C struct GtkBindingSet set current use <gtk/gtk.h>"
		end

	get_parsed (a_struct: POINTER): BOOLEAN  is
			-- guint parsed : 1; From RC content 

			-- This is really a boolean, infact it is a single bit.
		external "C struct GtkBindingSet get parsed use <gtk/gtk.h>"
		end

	set_parsed (a_struct: POINTER; a_parsed: BOOLEAN) is
		external "C struct GtkBindingSet set parsed use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkBindingSet)"
		end
end
