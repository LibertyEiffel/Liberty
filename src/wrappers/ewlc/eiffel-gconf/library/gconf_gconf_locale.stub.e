note
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "Unknown"

class GCONF_GCONF_LOCALE

inherit
	(SHARED_?)C_STRUCT

insert
	GCONF_GCONF_LOCALE_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: Using the GConf library (parent)
	--   Link: GConf Core Interfaces (previous)
	--   Link: GConfChangeSet (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev Up Home                  GConf Reference Manual                  Next
	--   Top  |  Description
	--
	--   gconf-locale
	--
	--   gconf-locale
	--
	--Synopsis
	--
	--
	--
	--
	--                     GConfLocaleCache;
	-- GConfLocaleCache*   gconf_locale_cache_new              (void);
	-- void                gconf_locale_cache_free             (GConfLocaleCache *cache);
	-- void                gconf_locale_cache_expire           (GConfLocaleCache *cache,
	--                                                          guint max_age_exclusive_in_seconds);
	--                     GConfLocaleList;
	-- void                gconf_locale_list_ref               (GConfLocaleList *list);
	-- void                gconf_locale_list_unref             (GConfLocaleList *list);
	-- GConfLocaleList*    gconf_locale_cache_get_list         (GConfLocaleCache *cache,
	--                                                          const gchar *locale);
	-- gchar**             gconf_split_locale                  (const gchar *locale);
	--
	--Description
	--
	--Details
	--
	--  GConfLocaleCache
	--
	-- typedef struct _GConfLocaleCache GConfLocaleCache;
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_locale_cache_new ()
	--
	-- GConfLocaleCache*   gconf_locale_cache_new              (void);
	--
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_locale_cache_free ()
	--
	-- void                gconf_locale_cache_free             (GConfLocaleCache *cache);
	--
	--   cache :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_locale_cache_expire ()
	--
	-- void                gconf_locale_cache_expire           (GConfLocaleCache *cache,
	--                                                          guint max_age_exclusive_in_seconds);
	--
	--   cache :
	--   max_age_exclusive_in_seconds :
	--
	--   --------------------------------------------------------------------------
	--
	--  GConfLocaleList
	--
	-- typedef struct {
	--   const gchar** list;
	-- } GConfLocaleList;
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_locale_list_ref ()
	--
	-- void                gconf_locale_list_ref               (GConfLocaleList *list);
	--
	--   list :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_locale_list_unref ()
	--
	-- void                gconf_locale_list_unref             (GConfLocaleList *list);
	--
	--   list :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_locale_cache_get_list ()
	--
	-- GConfLocaleList*    gconf_locale_cache_get_list         (GConfLocaleCache *cache,
	--                                                          const gchar *locale);
	--
	--   cache :
	--   locale :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_split_locale ()
	--
	-- gchar**             gconf_split_locale                  (const gchar *locale);
	--
	--   locale :
	--   Returns :

end -- class GCONF_GCONF_LOCALE
