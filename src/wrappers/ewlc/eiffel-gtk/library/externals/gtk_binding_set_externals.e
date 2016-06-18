note
	description: "External calls for GTK_BINDING_SET"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BINDING_SET_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	-- #include <gtk/gtk.h>
	--
	--
	--             GtkBindingSet;
	--             GtkBindingEntry;
	--             GtkBindingSignal;
	--             GtkBindingArg;
	-- GtkBindingSet* gtk_binding_set_new          (const gchar *set_name);
	-- GtkBindingSet* gtk_binding_set_by_class     (gpointer object_class);
	-- GtkBindingSet* gtk_binding_set_find         (const gchar *set_name);
	-- gboolean    gtk_bindings_activate           (GtkObject *object,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers);
	-- gboolean    gtk_bindings_activate_event     (GtkObject *object,
	--                                              GdkEventKey *event);
	-- gboolean    gtk_binding_set_activate        (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers,
	--                                              GtkObject *object);
	-- #define     gtk_binding_entry_add
	-- void        gtk_binding_entry_clear         (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers);
	-- void        gtk_binding_entry_add_signal    (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers,
	--                                              const gchar *signal_name,
	--                                              guint n_args,
	--                                              ...);
	-- void        gtk_binding_set_add_path        (GtkBindingSet *binding_set,
	--                                              GtkPathType path_type,
	--                                              const gchar *path_pattern,
	--                                              GtkPathPriorityType priority);
	-- void        gtk_binding_entry_remove        (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers);
	-- void        gtk_binding_entry_add_signall   (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers,
	--                                              const gchar *signal_name,
	--                                              GSList *binding_args);
	-- guint       gtk_binding_parse_binding       (GScanner *scanner);


feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkBindingSet)"
		end
end
