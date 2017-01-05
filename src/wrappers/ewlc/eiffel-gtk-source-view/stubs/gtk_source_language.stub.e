note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder
					
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

class GTK_SOURCE_LANGUAGE

inherit
	(SHARED_?)C_STRUCT

insert
	GTK_SOURCE_LANGUAGE_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: GtkSourceView (previous)
	--   Link: GtkSourceLanguageManager (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev  Up  Home            GtkSourceView 2 Reference Manual           Next
	--   Top  |  Description  |  Object Hierarchy  |  Properties
	--
	--   GtkSourceLanguage
	--
	--   GtkSourceLanguage
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourcelanguage.h>
	--
	--
	--                     GtkSourceLanguage;
	-- const gchar*        gtk_source_language_get_id          (GtkSourceLanguage *language);
	-- const gchar*        gtk_source_language_get_name        (GtkSourceLanguage *language);
	-- const gchar*        gtk_source_language_get_section     (GtkSourceLanguage *language);
	-- gboolean            gtk_source_language_get_hidden      (GtkSourceLanguage *language);
	-- const gchar*        gtk_source_language_get_metadata    (GtkSourceLanguage *language,
	--                                                          const gchar *name);
	-- gchar**             gtk_source_language_get_mime_types  (GtkSourceLanguage *language);
	-- gchar**             gtk_source_language_get_globs       (GtkSourceLanguage *language);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GtkSourceLanguage
	--
	--Properties
	--
	--
	--   "hidden"                   gboolean              : Read
	--   "id"                       gchararray            : Read
	--   "name"                     gchararray            : Read
	--   "section"                  gchararray            : Read
	--
	--Description
	--
	--Details
	--
	--  GtkSourceLanguage
	--
	-- typedef struct _GtkSourceLanguage GtkSourceLanguage;
	--
	--   GtkSourceLanguage structure contains only private members and should not
	--   be accessed directly.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_id ()
	--
	-- const gchar*        gtk_source_language_get_id          (GtkSourceLanguage *language);
	--
	--   Returns the ID of the language. The ID is not locale-dependent.
	--
	--   language : a GtkSourceLanguage.
	--   Returns :  the ID of language. The returned string is owned by language
	--              and should not be freed or modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_name ()
	--
	-- const gchar*        gtk_source_language_get_name        (GtkSourceLanguage *language);
	--
	--   Returns the localized name of the language.
	--
	--   language : a GtkSourceLanguage.
	--   Returns :  the name of language. The returned string is owned by language
	--              and should not be freed or modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_section ()
	--
	-- const gchar*        gtk_source_language_get_section     (GtkSourceLanguage *language);
	--
	--   Returns the localized section of the language. Each language belong to a
	--   section (ex. HTML belogs to the Markup section).
	--
	--   language : a GtkSourceLanguage.
	--   Returns :  the section of language. The returned string is owned by
	--              language and should not be freed or modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_hidden ()
	--
	-- gboolean            gtk_source_language_get_hidden      (GtkSourceLanguage *language);
	--
	--   Returns whether the language should be hidden from the user.
	--
	--   language : a GtkSourceLanguage
	--   Returns :  TRUE if the language should be hidden, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_metadata ()
	--
	-- const gchar*        gtk_source_language_get_metadata    (GtkSourceLanguage *language,
	--                                                          const gchar *name);
	--
	--   language : a GtkSourceLanguage.
	--   name :     metadata property name.
	--   Returns :  value of property name stored in the metadata of language or
	--              NULL if language doesn't contain that metadata property. The
	--              returned string is owned by language and should not be freed or
	--              modified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_mime_types ()
	--
	-- gchar**             gtk_source_language_get_mime_types  (GtkSourceLanguage *language);
	--
	--   language: a GtkSourceLanguage.
	--
	--   Returns the mime types associated to this language. This is just an
	--   utility wrapper around gtk_source_language_get_metadata() to retrieve the
	--   "mimetypes" metadata property and split it into an array.
	--
	--   language :
	--   Returns :  a newly-allocated NULL terminated array containing the mime
	--              types or NULL if no mime types are found. The returned array
	--              must be freed with g_strfreev().
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_language_get_globs ()
	--
	-- gchar**             gtk_source_language_get_globs       (GtkSourceLanguage *language);
	--
	--   language: a GtkSourceLanguage.
	--
	--   Returns the globs associated to this language. This is just an utility
	--   wrapper around gtk_source_language_get_metadata() to retrieve the "globs"
	--   metadata property and split it into an array.
	--
	--   language :
	--   Returns :  a newly-allocated NULL terminated array containing the globs or
	--              NULL if no globs are found. The returned array must be freed
	--              with g_strfreev().
	--
	--Property Details
	--
	--  The "hidden" property
	--
	--   "hidden"                   gboolean              : Read
	--
	--   Whether the language should be hidden from the user.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "id" property
	--
	--   "id"                       gchararray            : Read
	--
	--   Language id.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "name" property
	--
	--   "name"                     gchararray            : Read
	--
	--   Language name.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "section" property
	--
	--   "section"                  gchararray            : Read
	--
	--   Language section.
	--
	--   Default value: NULL
	--
	--See Also
	--
	--   GtkSourceLanguageManager

end -- class GTK_SOURCE_LANGUAGE
