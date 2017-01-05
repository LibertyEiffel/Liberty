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

	wrapped_version: "Unknown"

class GCONF_GCONF_LISTENERS

inherit
	(SHARED_?)C_STRUCT

insert
	GCONF_GCONF_LISTENERS_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: Using the GConf library (parent)
	--   Link: gconf-internals (previous)
	--   Link: GConfSchema (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev Up Home                  GConf Reference Manual                  Next
	--   Top  |  Description
	--
	--   gconf-listeners
	--
	--   gconf-listeners
	--
	--Synopsis
	--
	--
	--
	--
	--                     GConfListeners;
	-- void                (*GConfListenersCallback)           (GConfListeners *listeners,
	--                                                          const gchar *all_above_key,
	--                                                          guint cnxn_id,
	--                                                          gpointer listener_data,
	--                                                          gpointer user_data);
	-- GConfListeners*     gconf_listeners_new                 (void);
	-- void                gconf_listeners_free                (GConfListeners *listeners);
	-- guint               gconf_listeners_add                 (GConfListeners *listeners,
	--                                                          const gchar *listen_point,
	--                                                          gpointer listener_data,
	--                                                          GFreeFunc destroy_notify);
	-- void                gconf_listeners_remove              (GConfListeners *listeners,
	--                                                          guint cnxn_id);
	-- void                gconf_listeners_notify              (GConfListeners *listeners,
	--                                                          const gchar *all_above,
	--                                                          GConfListenersCallback callback,
	--                                                          gpointer user_data);
	-- guint               gconf_listeners_count               (GConfListeners *listeners);
	-- void                gconf_listeners_foreach             (GConfListeners *listeners,
	--                                                          GConfListenersForeach callback,
	--                                                          gpointer user_data);
	-- gboolean            gconf_listeners_get_data            (GConfListeners *listeners,
	--                                                          guint cnxn_id,
	--                                                          gpointer *listener_data_p,
	--                                                          const gchar **location_p);
	-- void                gconf_listeners_remove_if           (GConfListeners *listeners,
	--                                                          GConfListenersPredicate predicate,
	--                                                          gpointer user_data);
	--
	--Description
	--
	--   A GConfListeners object is used to store listeners who want notification
	--   of changes in a namespace section. It is a public API shared between
	--   gconfd and the GObject convenience wrapper.
	--
	--Details
	--
	--  GConfListeners
	--
	-- typedef struct _GConfListeners GConfListeners;
	--
	--   The GConfListeners structure contains nothing other than a dummy pointer.
	--   Internally the data about listeners is maintained through a listener table
	--   structure, LTable which contains data like the namespace, an array to hold
	--   the listeners, count of active listeners,value to be given to the next
	--   connection and the list of connection indices to be recycled. There is
	--   also a Listener structure maintaining data pertaining to listeners.
	--
	--   --------------------------------------------------------------------------
	--
	--  GConfListenersCallback ()
	--
	-- void                (*GConfListenersCallback)           (GConfListeners *listeners,
	--                                                          const gchar *all_above_key,
	--                                                          guint cnxn_id,
	--                                                          gpointer listener_data,
	--                                                          gpointer user_data);
	--
	--   This is the signature of a user function added with
	--   gconf_listeners_notify(). This function is called whenever the value of a
	--   key changes.
	--
	--   listeners :     a GConfListeners.
	--   all_above_key : the key that has changed.
	--   cnxn_id :       the connection id got from gconf_listeners_add().
	--   listener_data : the data field associated with each listener.
	--   user_data :     the user data to be passed to the callback.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_new ()
	--
	-- GConfListeners*     gconf_listeners_new                 (void);
	--
	--   Creates a new listener table and typecasts it to a GConfListeners.
	--
	--   Returns : the newly allocated GConfListeners.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_free ()
	--
	-- void                gconf_listeners_free                (GConfListeners *listeners);
	--
	--   Destroys the listener table.
	--
	--   listeners : a GConfListeners.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_add ()
	--
	-- guint               gconf_listeners_add                 (GConfListeners *listeners,
	--                                                          const gchar *listen_point,
	--                                                          gpointer listener_data,
	--                                                          GFreeFunc destroy_notify);
	--
	--   Creates a new Listener with the next available connection id and inserts
	--   it into the listener table. The newly created listener listens for changes
	--   below and including the listen_point.Returns the newly assigned connection
	--   id.
	--
	--   listeners :      a GConfListeners.
	--   listen_point :   where to listen for changes.
	--   listener_data :  data to pass to function.
	--   destroy_notify : pointer to the function to be called when the listener is
	--                    destroyed.
	--   Returns :        the newly assigned connection id, a guint value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_remove ()
	--
	-- void                gconf_listeners_remove              (GConfListeners *listeners,
	--                                                          guint cnxn_id);
	--
	--   Removes the listener from the listener table.
	--
	--   listeners : a GConfListeners.
	--   cnxn_id :   the connection id returned during gconf_listeners_add().
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_notify ()
	--
	-- void                gconf_listeners_notify              (GConfListeners *listeners,
	--                                                          const gchar *all_above,
	--                                                          GConfListenersCallback callback,
	--                                                          gpointer user_data);
	--
	--   Notifies all the associated listeners that a key has changed.
	--
	--   listeners : a GConfListeners.
	--   all_above : the key that has changed.
	--   callback :  a GConfListenersCallback to be called.
	--   user_data : data to be passed to the callback.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_count ()
	--
	-- guint               gconf_listeners_count               (GConfListeners *listeners);
	--
	--   Returns the number of alive listeners in the listener table.
	--
	--   listeners : a GConfListeners
	--   Returns :   the number of active listeners.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_foreach ()
	--
	-- void                gconf_listeners_foreach             (GConfListeners *listeners,
	--                                                          GConfListenersForeach callback,
	--                                                          gpointer user_data);
	--
	--   Execute a function for each of the GConfListeners.
	--
	--   listeners : a GConfListeners.
	--   callback :  the function to be called.
	--   user_data : a gpointer.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_get_data ()
	--
	-- gboolean            gconf_listeners_get_data            (GConfListeners *listeners,
	--                                                          guint cnxn_id,
	--                                                          gpointer *listener_data_p,
	--                                                          const gchar **location_p);
	--
	--   Obtains the data particular to a GConfListener.
	--
	--   listeners :       a GConfListeners.
	--   cnxn_id :         the connection id, an integer.
	--   listener_data_p : the address for getting the listener data.
	--   location_p :      a pointer to the address for getting the name.
	--   Returns :         TRUE if the data could be obtained successfully, FALSE
	--                     if an error occurs while retrieving the data.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_listeners_remove_if ()
	--
	-- void                gconf_listeners_remove_if           (GConfListeners *listeners,
	--                                                          GConfListenersPredicate predicate,
	--                                                          gpointer user_data);
	--
	--   Remove the listener if a predicate is satisfied.
	--
	--   listeners : a GConfListeners.
	--   predicate : the predicate checked for removal.
	--   user_data : a gpointer.

end -- class GCONF_GCONF_LISTENERS
