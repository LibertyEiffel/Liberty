note
	description: "Key bindings for individual widgets."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_BINDING_SET

inherit 
	C_STRUCT
	EIFFEL_OWNED -- TODO: This is temporary

insert GTK_BINDING_SET_EXTERNALS

create {ANY} from_external_pointer --, make

feature {} -- Creation
	--  gtk_binding_set_new ()
	--
	-- GtkBindingSet* gtk_binding_set_new          (const gchar *set_name);
	--
	--   set_name :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_set_by_class ()
	--
	-- GtkBindingSet* gtk_binding_set_by_class     (gpointer object_class);
	--
	--   object_class :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_set_find ()
	--
	-- GtkBindingSet* gtk_binding_set_find         (const gchar *set_name);
	--
	--   set_name :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_bindings_activate ()
	--
	-- gboolean    gtk_bindings_activate           (GtkObject *object,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers);
	--
	--   object :
	--   keyval :
	--   modifiers :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_bindings_activate_event ()
	--
	-- gboolean    gtk_bindings_activate_event     (GtkObject *object,
	--                                              GdkEventKey *event);
	--
	--   Looks up key bindings for object to find one matching event, and if one
	--   was found, activate it.
	--
	--   object :  a GtkObject (generally must be a widget)
	--   event :   a GdkEventKey
	--   Returns : TRUE if a matching key binding was found
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_set_activate ()
	--
	-- gboolean    gtk_binding_set_activate        (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers,
	--                                              GtkObject *object);
	--
	--   binding_set :
	--   keyval :
	--   modifiers :
	--   object :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_entry_add
	--
	-- #define  gtk_binding_entry_add          gtk_binding_entry_clear
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_entry_clear ()
	--
	-- void        gtk_binding_entry_clear         (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers);
	--
	--   binding_set :
	--   keyval :
	--   modifiers :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_entry_add_signal ()
	--
	-- void        gtk_binding_entry_add_signal    (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers,
	--                                              const gchar *signal_name,
	--                                              guint n_args,
	--                                              ...);
	--
	--   binding_set :
	--   keyval :
	--   modifiers :
	--   signal_name :
	--   n_args :
	--   ... :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_set_add_path ()
	--
	-- void        gtk_binding_set_add_path        (GtkBindingSet *binding_set,
	--                                              GtkPathType path_type,
	--                                              const gchar *path_pattern,
	--                                              GtkPathPriorityType priority);
	--
	--   binding_set :
	--   path_type :
	--   path_pattern :
	--   priority :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_entry_remove ()
	--
	-- void        gtk_binding_entry_remove        (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers);
	--
	--   binding_set :
	--   keyval :
	--   modifiers :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_entry_add_signall ()
	--
	-- void        gtk_binding_entry_add_signall   (GtkBindingSet *binding_set,
	--                                              guint keyval,
	--                                              GdkModifierType modifiers,
	--                                              const gchar *signal_name,
	--                                              GSList *binding_args);
	--
	--   binding_set :
	--   keyval :
	--   modifiers :
	--   signal_name :
	--   binding_args :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_binding_parse_binding ()
	--
	-- guint       gtk_binding_parse_binding       (GScanner *scanner);
	--
	--   scanner :
	--   Returns :

end -- class GTK_BINDING_SET

