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

	wrapped_version: "Unknown"

class GCONF_GCONF_SOURCES

inherit
	(SHARED_?)C_STRUCT

insert
	GCONF_GCONF_SOURCES_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: Using the GConf library (parent)
	--   Link: GConfSchema (previous)
	--   Link: GConfValue, GConfEntry, GConfMetaInfo (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev Up Home                  GConf Reference Manual                  Next
	--   Top  |  Description
	--
	--   gconf-sources
	--
	--   gconf-sources
	--
	--Synopsis
	--
	--
	--
	--
	--                     GConfSource;
	-- enum                GConfSourceFlags;
	-- GConfSource*        gconf_resolve_address               (const gchar *address,
	--                                                          GError **err);
	-- void                gconf_source_free                   (GConfSource *source);
	--                     GConfSources;
	-- GConfSources*       gconf_sources_new_from_addresses    (GSList *addresses,
	--                                                          GError **err);
	-- GConfSources*       gconf_sources_new_from_source       (GConfSource *source);
	-- void                gconf_sources_free                  (GConfSources *sources);
	-- GConfValue*         gconf_sources_query_value           (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar **locales,
	--                                                          gboolean use_schema_default,
	--                                                          gboolean *value_is_default,
	--                                                          gboolean *value_is_writable,
	--                                                          gchar **schema_name,
	--                                                          GError **err);
	-- void                gconf_sources_set_value             (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const GConfValue *value,
	--                                                          GConfSources **modified_sources,
	--                                                          GError **err);
	-- void                gconf_sources_unset_value           (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar *locale,
	--                                                          GConfSources **modified_sources,
	--                                                          GError **err);
	-- GSList*             gconf_sources_all_entries           (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          const gchar **locales,
	--                                                          GError **err);
	-- GSList*             gconf_sources_all_dirs              (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          GError **err);
	-- gboolean            gconf_sources_dir_exists            (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          GError **err);
	-- void                gconf_sources_remove_dir            (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          GError **err);
	-- void                gconf_sources_set_schema            (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar *schema_key,
	--                                                          GError **err);
	-- gboolean            gconf_sources_sync_all              (GConfSources *sources,
	--                                                          GError **err);
	-- GConfMetaInfo*      gconf_sources_query_metainfo        (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          GError **err);
	-- GConfValue*         gconf_sources_query_default_value   (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar **locales,
	--                                                          gboolean *is_writable,
	--                                                          GError **err);
	--
	--Description
	--
	--Details
	--
	--  GConfSource
	--
	-- typedef struct {
	--   guint flags;
	--   gchar* address;
	--   GConfBackend* backend;
	-- } GConfSource;
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GConfSourceFlags
	--
	-- typedef enum {
	--   /* These are an optimization to avoid calls to
	--    * the writable/readable methods in the backend
	--    * vtable
	--    */
	--   GCONF_SOURCE_ALL_WRITEABLE = 1 << 0,
	--   GCONF_SOURCE_ALL_READABLE = 1 << 1,
	--   GCONF_SOURCE_NEVER_WRITEABLE = 1 << 2,
	--   GCONF_SOURCE_ALL_FLAGS = ((1 << 0) | (1 << 1))
	-- } GConfSourceFlags;
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_resolve_address ()
	--
	-- GConfSource*        gconf_resolve_address               (const gchar *address,
	--                                                          GError **err);
	--
	--   address :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_source_free ()
	--
	-- void                gconf_source_free                   (GConfSource *source);
	--
	--   source :
	--
	--   --------------------------------------------------------------------------
	--
	--  GConfSources
	--
	-- typedef struct {
	--   GList* sources;
	-- } GConfSources;
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_new_from_addresses ()
	--
	-- GConfSources*       gconf_sources_new_from_addresses    (GSList *addresses,
	--                                                          GError **err);
	--
	--   addresses :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_new_from_source ()
	--
	-- GConfSources*       gconf_sources_new_from_source       (GConfSource *source);
	--
	--   source :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_free ()
	--
	-- void                gconf_sources_free                  (GConfSources *sources);
	--
	--   sources :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_query_value ()
	--
	-- GConfValue*         gconf_sources_query_value           (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar **locales,
	--                                                          gboolean use_schema_default,
	--                                                          gboolean *value_is_default,
	--                                                          gboolean *value_is_writable,
	--                                                          gchar **schema_name,
	--                                                          GError **err);
	--
	--   sources :
	--   key :
	--   locales :
	--   use_schema_default :
	--   value_is_default :
	--   value_is_writable :
	--   schema_name :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_set_value ()
	--
	-- void                gconf_sources_set_value             (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const GConfValue *value,
	--                                                          GConfSources **modified_sources,
	--                                                          GError **err);
	--
	--   sources :
	--   key :
	--   value :
	--   modified_sources :
	--   err :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_unset_value ()
	--
	-- void                gconf_sources_unset_value           (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar *locale,
	--                                                          GConfSources **modified_sources,
	--                                                          GError **err);
	--
	--   sources :
	--   key :
	--   locale :
	--   modified_sources :
	--   err :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_all_entries ()
	--
	-- GSList*             gconf_sources_all_entries           (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          const gchar **locales,
	--                                                          GError **err);
	--
	--   sources :
	--   dir :
	--   locales :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_all_dirs ()
	--
	-- GSList*             gconf_sources_all_dirs              (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          GError **err);
	--
	--   sources :
	--   dir :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_dir_exists ()
	--
	-- gboolean            gconf_sources_dir_exists            (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          GError **err);
	--
	--   sources :
	--   dir :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_remove_dir ()
	--
	-- void                gconf_sources_remove_dir            (GConfSources *sources,
	--                                                          const gchar *dir,
	--                                                          GError **err);
	--
	--   sources :
	--   dir :
	--   err :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_set_schema ()
	--
	-- void                gconf_sources_set_schema            (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar *schema_key,
	--                                                          GError **err);
	--
	--   sources :
	--   key :
	--   schema_key :
	--   err :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_sync_all ()
	--
	-- gboolean            gconf_sources_sync_all              (GConfSources *sources,
	--                                                          GError **err);
	--
	--   sources :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_query_metainfo ()
	--
	-- GConfMetaInfo*      gconf_sources_query_metainfo        (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          GError **err);
	--
	--   sources :
	--   key :
	--   err :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_sources_query_default_value ()
	--
	-- GConfValue*         gconf_sources_query_default_value   (GConfSources *sources,
	--                                                          const gchar *key,
	--                                                          const gchar **locales,
	--                                                          gboolean *is_writable,
	--                                                          GError **err);
	--
	--   sources :
	--   key :
	--   locales :
	--   is_writable :
	--   err :
	--   Returns :

end -- class GCONF_GCONF_SOURCES
