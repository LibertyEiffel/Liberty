note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "2.0.1"

class GTK_SOURCE_LANGUAGE_MANAGER

inherit
	(SHARED_?)C_STRUCT

insert
	GTK_SOURCE_LANGUAGE_MANAGER_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: GtkSourceLanguage (previous)
	--   Link: GtkSourceStyle (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev  Up  Home            GtkSourceView 2 Reference Manual           Next
	--   Top  |  Description  |  Object Hierarchy  |  Properties
	--
	--   GtkSourceLanguageManager
	--
	--   GtkSourceLanguageManager
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourcelanguagemanager.h>
	--
	--
	--                     GtkSourceLanguageManager;
	-- GtkSourceLanguageManager* gtk_source_language_manager_new
	--                                                         (void);
	-- GtkSourceLanguageManager* gtk_source_language_manager_get_default
	--                                                         (void);
	-- void                gtk_source_language_manager_set_search_path
	--                                                         (GtkSourceLanguageManager *lm,
	--                                                          gchar **dirs);
	-- const gchar*        gtk_source_language_manager_get_search_path
	--                                                         (GtkSourceLanguageManager *lm);
	-- const gchar*        gtk_source_language_manager_get_language_ids
	--                                                         (GtkSourceLanguageManager *lm);
	-- GtkSourceLanguage*  gtk_source_language_manager_get_language
	--                                                         (GtkSourceLanguageManager *lm,
	--                                                          const gchar *id);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GtkSourceLanguageManager
	--
	--Properties
	--
	--
	--   "language-ids"             GStrv                 : Read
	--   "search-path"              GStrv                 : Read / Write
	--
	--Description
	--
	--Details
	--
	--  GtkSourceLanguageManager
	--
	-- typedef struct _GtkSourceLanguageManager GtkSourceLanguageManager;
	--
	--   GtkSourceLanguageManager structure contains only private members and
	--   should not be accessed directly.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_manager_new ()
	--
	-- GtkSourceLanguageManager* gtk_source_language_manager_new
	--                                                         (void);
	--
	--   Creates a new language manager. If you do not need more than one language
	--   manager or a private language manager instance then use
	--   gtk_source_language_manager_get_default() instead.
	--
	--   Returns : a GtkSourceLanguageManager.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_manager_get_default ()
	--
	-- GtkSourceLanguageManager* gtk_source_language_manager_get_default
	--                                                         (void);
	--
	--   Returns the default GtkSourceLanguageManager instance.
	--
	--   Returns : a GtkSourceLanguageManager. Return value is owned by
	--             GtkSourceView library and must not be unref'ed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_manager_set_search_path ()
	--
	-- void                gtk_source_language_manager_set_search_path
	--                                                         (GtkSourceLanguageManager *lm,
	--                                                          gchar **dirs);
	--
	--   Sets the list of directories where the lm looks for language files. If
	--   dirs is NULL, the search path is reset to default.
	--
	--  Note
	--
	--   At the moment this function can be called only before the language files
	--   are loaded for the first time. In practice to set a custom search path for
	--   a GtkSourceLanguageManager, you have to call this function right after
	--   creating it.
	--
	--   lm :   a GtkSourceLanguageManager.
	--   dirs : a NULL-terminated array of strings or NULL.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_manager_get_search_path ()
	--
	-- const gchar*        gtk_source_language_manager_get_search_path
	--                                                         (GtkSourceLanguageManager *lm);
	--
	--   Gets the list directories where lm looks for language files.
	--
	--   lm :      a GtkSourceLanguageManager.
	--   Returns : NULL-terminated array containg a list of language files
	--             directories. The array is owned by lm and must not be modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_manager_get_language_ids ()
	--
	-- const gchar*        gtk_source_language_manager_get_language_ids
	--                                                         (GtkSourceLanguageManager *lm);
	--
	--   Returns the ids of the available languages.
	--
	--   lm :      a GtkSourceLanguageManager
	--   Returns : a NULL-terminated array of string containing the ids of the
	--             available languages or NULL if no language is available. The
	--             array is owned by lm and must not be modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_manager_get_language ()
	--
	-- GtkSourceLanguage*  gtk_source_language_manager_get_language
	--                                                         (GtkSourceLanguageManager *lm,
	--                                                          const gchar *id);
	--
	--   Gets the GtkSourceLanguage identified by the given id in the language
	--   manager.
	--
	--   lm :      a GtkSourceLanguageManager.
	--   id :      a language id.
	--   Returns : a GtkSourceLanguage, or NULL if there is no language identified
	--             by the given id. Return value is owned by lm and should not be
	--             freed.
	--
	--Property Details
	--
	--  The "language-ids" property
	--
	--   "language-ids"             GStrv                 : Read
	--
	--   List of the ids of the available languages.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "search-path" property
	--
	--   "search-path"              GStrv                 : Read / Write
	--
	--   List of directories where the language specification files (.lang) are
	--   located.
	--
	--See Also
	--
	--   GtkSourceLanguage

end -- class GTK_SOURCE_LANGUAGE_MANAGER
