note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK-Source
					
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

	wrapped_version: "1.8.5"

class GTK_SOURCE_LANGUAGE

inherit G_OBJECT
	
insert GLIB_UNICODE_MANIPULATION_EXTERNALS

create {ANY} dummy, from_external_pointer

feature {ANY} 
	name: STRING
			-- the localized name of the language.
		do
			create Result.from_external(gtk_source_language_get_name(handle))
		ensure not_void: Result/=Void
		end

	section: STRING
			-- the localized section of the language. Each language belong to a
			-- section (ex. HTML belogs to the Markup section).
		do
			create Result.from_external(gtk_source_language_get_section(handle))
		ensure not_void: Result/=Void
		end

	tags: G_SLIST[GTK_SOURCE_LANGUAGE]
			-- the tags for the given language. 		
		do
			print ("GTK_SOURCE_LANGUAGE: we must provide a G_OBJECT_SLIST[ITEM->G_OBJECT] inherit G_SLIST[ITEM] that offers the possibility to get a wrapped gobject without referring it, becasue the original documentation says: 'You should unref the tags and free the list after usage.'%N")
			create Result.from_external_pointer(gtk_source_language_get_tags(handle))
		ensure not_void: Result/=Void
		end

	escape_char: like gunichar
			-- the value of the ESC character in the given language.
		do
			Result:=gtk_source_language_get_escape_char (handle)
		end

	mime_types: G_SLIST_STRING
		do
			create Result.from_external_pointer
			(gtk_source_language_get_mime_types (handle))
			-- gtk_source_language_get_mime_types returns a list of mime
			-- types (strings) for the given language. After usage you
			-- should free each element of the list as well as the list
			-- itself
		end

	set_mime_types (some_mime_types: G_SLIST_STRING)
			-- Sets a list of mime types for the given language. If
			-- `some_mime_types' is Void the default mime types from the
			-- language file will be used.
		do
			gtk_source_language_set_mime_types(handle, null_or(some_mime_types))
		end

	style_scheme: GTK_SOURCE_STYLE_SCHEME
			-- the style scheme associated with the given language.
		do
			create Result.from_external_pointer(gtk_source_language_get_style_scheme(handle))
		ensure not_void: Result/=Void
		end

	set_style_scheme (a_scheme: GTK_SOURCE_STYLE_SCHEME)
			--   Sets the style scheme of the given language.
		do
			gtk_source_language_set_style_scheme(handle,a_scheme.handle)
		end

	tag_style (a_tag_id: STRING): GTK_SOURCE_TAG_STYLE
			-- the style of the tag whose ID is `a_tag_id'. If the style
			-- is not defined then returns the default style.
		require id_not_void: a_tag_id/=Void
		do
			create Result.from_external_pointer(gtk_source_language_get_tag_style
															(handle, a_tag_id.to_external))
		ensure not_void: Result/=Void
		end

	set_tag_style (a_tag_id: STRING; a_style: GTK_SOURCE_TAG_STYLE)
			-- Sets the style of the tag whose ID is `a_tag_id'. If
			-- `a_style' is Void restore the default style.
		do
			gtk_source_language_set_tag_style(handle, a_tag_id.handl, null_or(a_style))
		ensure set: a_style/=Void implies a_style.is_equal(tag_style(a_tag_id))
		end

	tag_default_style (a_tag_id: STRING): GTK_SOURCE_TAG_STYLE
			-- The default style of the tag whose ID is `a_tag_id'.
		do
			create Result.from_external_pointer(gtk_source_language_get_tag_default_style
															(handle, a_tag_id.to_external))
		ensure not_void: Result /= Void
		end

feature {} -- TODO: Signals
	--  The "tag-style-changed" signal
	--
	-- void                user_function                      (GtkSourceLanguage *sourcelanguage,
	--                                                         gchar             *arg1,
	--                                                         gpointer           user_data)           : Run Last
	--
	--   sourcelanguage : the object which received the signal.
	--   arg1 :
	--   user_data :      user data set when the signal handler was connected.

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSourceLanguage)"
		end

feature {} -- External calls

	-- #include <gtksourceview/gtksourcelanguage.h>
 
	gtk_source_language_get_name (a_language: POINTER): POINTER
			--  gchar* gtk_source_language_get_name (GtkSourceLanguage *language);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end
	
	gtk_source_language_get_section (a_language: POINTER): POINTER
			--  gchar* gtk_source_language_get_section (GtkSourceLanguage *language);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_get_tags (a_language: POINTER): POINTER
			--  GSList* gtk_source_language_get_tags (GtkSourceLanguage *language);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_get_escape_char (a_language: POINTER): like gunichar
			-- gunichar gtk_source_language_get_escape_char (GtkSourceLanguage
			-- *language);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_get_mime_types (a_language: POINTER): POINTER
			-- GSList* gtk_source_language_get_mime_types (GtkSourceLanguage
			-- *language);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_set_mime_types (a_language, some_mime_types: POINTER)
			-- void gtk_source_language_set_mime_types (GtkSourceLanguage
			-- *language, const GSList *mime_types);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_get_style_scheme (a_language: POINTER): POINTER
			-- GtkSourceStyleScheme* gtk_source_language_get_style_scheme
			-- (GtkSourceLanguage *language);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_set_style_scheme (a_language, a_gtk_source_style_scheme: POINTER)
			-- void gtk_source_language_set_style_scheme (GtkSourceLanguage
			-- *language, GtkSourceStyleScheme *scheme);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_get_tag_style (a_language, a_tag_id: POINTER): POINTER
			-- GtkSourceTagStyle* gtk_source_language_get_tag_style
			-- (GtkSourceLanguage *language, const gchar *tag_id);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_set_tag_style (a_language, a_tag_id, a_style: POINTER)
			-- void gtk_source_language_set_tag_style (GtkSourceLanguage *language,
			-- const gchar *tag_id, const GtkSourceTagStyle *style);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end

	gtk_source_language_get_tag_default_style (a_language, a_tag_id: POINTER): POINTER
			-- GtkSourceTagStyle* gtk_source_language_get_tag_default_style
			-- (GtkSourceLanguage *language, const gchar *tag_id);
		external "C use <gtksourceview/gtksourcelanguage.h>"
		end
end -- class GTK_SOURCE_LANGUAGE
