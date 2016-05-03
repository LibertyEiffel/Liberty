note
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "2.0.1"

class GTK_SOURCE_STYLE_SCHEME_MANAGER

inherit
	(SHARED_?)C_STRUCT

insert
	GTK_SOURCE_STYLE_SCHEME_MANAGER_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: GtkSourceStyleScheme (previous)
	--   Link: Syntax highlighting reference (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev  Up  Home            GtkSourceView 2 Reference Manual           Next
	--   Top  |  Description  |  Object Hierarchy  |  Properties
	--
	--   GtkSourceStyleSchemeManager
	--
	--   GtkSourceStyleSchemeManager
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourcestyleschememanager.h>
	--
	--
	--                     GtkSourceStyleSchemeManager;
	-- GtkSourceStyleSchemeManager* gtk_source_style_scheme_manager_new
	--                                                         (void);
	-- GtkSourceStyleSchemeManager* gtk_source_style_scheme_manager_get_default
	--                                                         (void);
	-- void                gtk_source_style_scheme_manager_set_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          gchar **path);
	-- void                gtk_source_style_scheme_manager_append_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          const gchar *path);
	-- void                gtk_source_style_scheme_manager_prepend_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          const gchar *path);
	-- const gchar*        gtk_source_style_scheme_manager_get_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager);
	-- const gchar*        gtk_source_style_scheme_manager_get_scheme_ids
	--                                                         (GtkSourceStyleSchemeManager *manager);
	-- GtkSourceStyleScheme* gtk_source_style_scheme_manager_get_scheme
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          const gchar *scheme_id);
	-- void                gtk_source_style_scheme_manager_force_rescan
	--                                                         (GtkSourceStyleSchemeManager *manager);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GtkSourceStyleSchemeManager
	--
	--Properties
	--
	--
	--   "scheme-ids"               GStrv                 : Read
	--   "search-path"              GStrv                 : Read / Write
	--
	--Description
	--
	--Details
	--
	--  GtkSourceStyleSchemeManager
	--
	-- typedef struct _GtkSourceStyleSchemeManager GtkSourceStyleSchemeManager;
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_new ()
	--
	-- GtkSourceStyleSchemeManager* gtk_source_style_scheme_manager_new
	--                                                         (void);
	--
	--   Creates a new style manager. If you do not need more than one style
	--   manager then use gtk_source_style_scheme_manager_get_default() instead.
	--
	--   Returns : a GtkSourceStyleSchemeManager.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_get_default ()
	--
	-- GtkSourceStyleSchemeManager* gtk_source_style_scheme_manager_get_default
	--                                                         (void);
	--
	--   Returns the default GtkSourceStyleSchemeManager instance.
	--
	--   Returns : a GtkSourceStyleSchemeManager. Return value is owned by
	--             GtkSourceView library and must not be unref'ed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_set_search_path ()
	--
	-- void                gtk_source_style_scheme_manager_set_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          gchar **path);
	--
	--   Sets the list of directories where the manager looks for style scheme
	--   files. If dirs is NULL, the search path is reset to default.
	--
	--   manager : a GtkSourceStyleSchemeManager.
	--   path :    a NULL-terminated array of strings or NULL.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_append_search_path ()
	--
	-- void                gtk_source_style_scheme_manager_append_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          const gchar *path);
	--
	--   Appends path to the list of directories where the manager looks for style
	--   scheme files. See gtk_source_style_scheme_manager_set_search_path() for
	--   details.
	--
	--   manager : a GtkSourceStyleSchemeManager.
	--   path :    a directory or a filename.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_prepend_search_path ()
	--
	-- void                gtk_source_style_scheme_manager_prepend_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          const gchar *path);
	--
	--   Prepends path to the list of directories where the manager looks for style
	--   scheme files. See gtk_source_style_scheme_manager_set_search_path() for
	--   details.
	--
	--   manager : a GtkSourceStyleSchemeManager.
	--   path :    a directory or a filename.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_get_search_path ()
	--
	-- const gchar*        gtk_source_style_scheme_manager_get_search_path
	--                                                         (GtkSourceStyleSchemeManager *manager);
	--
	--   Returns the current search path for the manager. See
	--   gtk_source_style_scheme_manager_set_search_path() for details.
	--
	--   manager : a GtkSourceStyleSchemeManager.
	--   Returns : a NULL-terminated array of string containing the search path.
	--             The array is owned by the manager and must not be modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_get_scheme_ids ()
	--
	-- const gchar*        gtk_source_style_scheme_manager_get_scheme_ids
	--                                                         (GtkSourceStyleSchemeManager *manager);
	--
	--   Returns the ids of the available style schemes.
	--
	--   manager : a GtkSourceStyleSchemeManager
	--   Returns : a NULL-terminated array of string containing the ids of the
	--             available style schemes or NULL if no style scheme is available.
	--             The array is owned by the manager and must not be modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_get_scheme ()
	--
	-- GtkSourceStyleScheme* gtk_source_style_scheme_manager_get_scheme
	--                                                         (GtkSourceStyleSchemeManager *manager,
	--                                                          const gchar *scheme_id);
	--
	--   Looks up style scheme by id.
	--
	--   manager :   a GtkSourceStyleSchemeManager
	--   scheme_id : style scheme id to find
	--   Returns :   a GtkSourceStyleScheme object. Returned value is owned by
	--               manager and must not be unref'ed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_manager_force_rescan ()
	--
	-- void                gtk_source_style_scheme_manager_force_rescan
	--                                                         (GtkSourceStyleSchemeManager *manager);
	--
	--   Mark any currently cached information about the available style scehems as
	--   invalid. All the available style schemes will be reloaded next time the
	--   manager is accessed.
	--
	--   manager : a GtkSourceStyleSchemeManager
	--
	--Property Details
	--
	--  The "scheme-ids" property
	--
	--   "scheme-ids"               GStrv                 : Read
	--
	--   List of the ids of the available style schemes.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "search-path" property
	--
	--   "search-path"              GStrv                 : Read / Write
	--
	--   List of directories and files where the style schemes are located.

end -- class GTK_SOURCE_STYLE_SCHEME_MANAGER
