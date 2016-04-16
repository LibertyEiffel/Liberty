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

	wrapped_version: "Unknown"

class GCONF_GCONF_ENGINE

inherit
	(SHARED_?)C_STRUCT

insert
	GCONF_GCONF_ENGINE_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: Using the GConf library (parent)
	--   Link: gconf-backend (previous)
	--   Link: GError (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev Up Home                  GConf Reference Manual                  Next
	--   Top  |  Description
	--
	--   GConfEngine
	--
	--   GConfEngine -- a GConf "database"
	--
	--Synopsis
	--
	--
	--
	--
	--                     GConfEngine;
	-- GConfEngine*        gconf_engine_get_default            (void);
	-- GConfEngine*        gconf_engine_get_for_address        (const gchar *address,
	--                                                          GError **err);
	-- GConfEngine*        gconf_engine_get_for_addresses      (GSList *addresses,
	--                                                          GError **err);
	-- void                gconf_engine_unref                  (GConfEngine *conf);
	-- void                gconf_engine_ref                    (GConfEngine *conf);
	-- GConfEngine*        gconf_engine_get_local              (const char *address,
	--                                                          GError **err);
	-- GConfEngine*        gconf_engine_get_local_for_addresses
	--                                                         (GSList *addresses,
	--                                                          GError **err);
	-- void                gconf_engine_set_user_data          (GConfEngine *engine,
	--                                                          gpointer data,
	--                                                          GDestroyNotify dnotify);
	-- gpointer            gconf_engine_get_user_data          (GConfEngine *engine);
	--
	--Description
	--
	--   A GConfEngine represents a connection to the GConf database. The default
	--   GConfEngine, returned from gconf_engine_get_default(), represents the
	--   user's normal configuration source search path. Configuration-related
	--   utilities, such as a configuration editor tool, might wish to access a
	--   particular configuration source directly; they can obtain a non-default
	--   GConfEngine with gconf_engine_get_for_address().
	--
	--   Once you have a GConfEngine, you can query and manipulate configuration
	--   values.
	--
	--Details
	--
	--  GConfEngine
	--
	-- typedef struct _GConfEngine GConfEngine;
	--
	--   An opaque data type representing one or more configuration sources.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_get_default ()
	--
	-- GConfEngine*        gconf_engine_get_default            (void);
	--
	--   Returns the default GConfEngine. All clients should use this, unless they
	--   are special configuration-related tools. The caller of this function
	--   assumes one reference count, and must call gconf_engine_unref() at some
	--   point. It's fairly important to unref the GConfEngine, to cleanly close
	--   the connection to gconfd. So if possible close the connection before
	--   exiting your application. see ? printf() printf()
	--
	--   Returns : the default GConfEngine.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_get_for_address ()
	--
	-- GConfEngine*        gconf_engine_get_for_address        (const gchar *address,
	--                                                          GError **err);
	--
	--   Obtains a special GConfEngine; mostly useful for specialized GConf-related
	--   tools. Normal clients shouldn't need to use it. As with
	--   gconf_engine_get_default(), the returned GConfEngine should be
	--   unreferenced by the caller of this function.
	--
	--   address : a configuration source address.
	--   err :     the return location for an allocated GError, or NULL to ignore
	--             errors.
	--   Returns : a GConfEngine.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_get_for_addresses ()
	--
	-- GConfEngine*        gconf_engine_get_for_addresses      (GSList *addresses,
	--                                                          GError **err);
	--
	--   Similar to gconf_engine_get_for_address() , but takes a list of addresses
	--   instead of a single address.
	--
	--   addresses : a list of configuration addresses.
	--   err :       the return location for an allocated GError, or NULL to ignore
	--               errors.
	--   Returns :   a GConfEngine.
	--
	--   Since 2.4
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_unref ()
	--
	-- void                gconf_engine_unref                  (GConfEngine *conf);
	--
	--   Decreases the reference count of a GConfEngine by one; if the reference
	--   count reaches 0, destroys the GConfEngine.
	--
	--   conf : a GConfEngine.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_ref ()
	--
	-- void                gconf_engine_ref                    (GConfEngine *conf);
	--
	--   Increases the reference count of a GConfEngine by one.
	--
	--   conf : a GConfEngine.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_get_local ()
	--
	-- GConfEngine*        gconf_engine_get_local              (const char *address,
	--                                                          GError **err);
	--
	--   Obtain a local (non-process-transparent) GConfEngine. Local engines do not
	--   support notification, and can only access config databases directly (they
	--   do not use the multiple sources in a path system supported by nonlocal
	--   engines).
	--
	--   address : address of local database.
	--   err :     return location of an allocated GError.
	--   Returns : a GConfEngine.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_get_local_for_addresses ()
	--
	-- GConfEngine*        gconf_engine_get_local_for_addresses
	--                                                         (GSList *addresses,
	--                                                          GError **err);
	--
	--   Obtains a local GConfEngine similar to gconf_engine_get_local(). Instead
	--   of taking the address of the local database, this function takes the
	--   addresses of the sources and gets the GConfSources using
	--   gconf_sources_new_from_addresses().
	--
	--   addresses : a list of addresses of GConfSources.
	--   err :       the return location for an allocated GError, or NULL to ignore
	--               errors.
	--   Returns :   a GConfEngine.
	--
	--   Since 2.8
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_set_user_data ()
	--
	-- void                gconf_engine_set_user_data          (GConfEngine *engine,
	--                                                          gpointer data,
	--                                                          GDestroyNotify dnotify);
	--
	--   Sets the user_data and the destroy notification function fields of a
	--   GConfEngine.
	--
	--   engine :  a GConfEngine.
	--   data :    a gpointer.
	--   dnotify : a pointer to the function to be called during destroy.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_engine_get_user_data ()
	--
	-- gpointer            gconf_engine_get_user_data          (GConfEngine *engine);
	--
	--   Returns the user_data field of a GConfEngine.
	--
	--   engine :  a GConfEngine.
	--   Returns : a pointer to the user_data.

end -- class GCONF_GCONF_ENGINE
