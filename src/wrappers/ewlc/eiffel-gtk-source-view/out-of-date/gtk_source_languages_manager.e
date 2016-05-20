note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GtkSourceView developers
					
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

	wrapped_version: "1.8.5"

class GTK_SOURCE_LANGUAGES_MANAGER

inherit G_OBJECT

create {ANY} dummy, make, from_external_pointer

feature {} -- Creation
	make is
			--   Creates a new language manager.
		do
			from_external_pointer(gtk_source_languages_manager_new)
		end

feature {ANY}
	available_languages: G_SLIST[GTK_SOURCE_LANGUAGE] is
			-- A list of available languages.
		do
			create Result.from_external_pointer(gtk_source_languages_manager_get_available_languages(handle))
			-- Note: gtk_source_languages_manager_get_available_languages gets a
			-- list of available languages for the given language manager. This
			-- function returns a pointer to a internal list, so there is no need
			-- to free it after usage. So the Result must be shared
			Result.set_shared
		end

	language_from_mime_type (a_mime_type: STRING): GTK_SOURCE_LANGUAGE is
			-- the GtkSourceLanguage associated with `a_mime_type' in the language
			-- manager. Void if there is no language associated with the given
			-- `a_mime_type'.
		require mime_type_not_void: a_mime_type/=Void
		local p: POINTER
		do
			p:=(gtk_source_languages_manager_get_language_from_mime_type
				 (handle, a_mime_type.to_external))
			if p.is_not_null then
				create Result.from_external_pointer(p)
			end
		end

	lang_files_dirs: G_SLIST_STRING is
			-- List of directories where the language specification files (.lang)
			-- are located.

			-- TODO: the property associated to this feature is "lang-files-dirs"
			-- which is labelled as "Read / Write / Construct Only"; provide the
			-- eventual Eiffel equivalent.
		
		do
			create Result.from_external_pointer(gtk_source_languages_manager_get_lang_files_dirs(handle))
		end

feature {} -- External calls
	gtk_source_languages_manager_new: POINTER is
			-- GtkSourceLanguagesManager* gtk_source_languages_manager_new (void);
		external "C use  <gtksourceview/gtksourcelanguagesmanager.h>"
		end

	gtk_source_languages_manager_get_available_languages (a_lm: POINTER): POINTER is
			-- 	const GSList* gtk_source_languages_manager_get_available_languages (GtkSourceLanguagesManager *lm);
		external "C use  <gtksourceview/gtksourcelanguagesmanager.h>"
		end

 gtk_source_languages_manager_get_language_from_mime_type (a_lm, a_mime_type: POINTER): POINTER is
			-- GtkSourceLanguage*
			-- gtk_source_languages_manager_get_language_from_mime_type
			-- (GtkSourceLanguagesManager *lm, const gchar *mime_type);
		external "C use  <gtksourceview/gtksourcelanguagesmanager.h>"
		end

	gtk_source_languages_manager_get_lang_files_dirs (a_lm: POINTER): POINTER is
			-- const GSList* gtk_source_languages_manager_get_lang_files_dirs
			-- (GtkSourceLanguagesManager *lm);
		external "C use  <gtksourceview/gtksourcelanguagesmanager.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtksourceview/gtksourcelanguagesmanager.h>"
		alias "sizeof(GtkSourceLanguagesManager)"
		end
end -- class GTK_SOURCE_LANGUAGES_MANAGER
