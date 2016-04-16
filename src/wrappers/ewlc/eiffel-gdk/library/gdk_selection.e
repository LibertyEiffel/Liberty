note
	description: "GDK_SELECTION - Functions for transfering data via the X selection mechanism."
	copyright: "[
					Copyright (C) 2008 eiffel-libraries team, GTK+ team
					
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

deferred class GDK_SELECTION
	-- The X selection mechanism provides a way to transfer arbitrary
	-- chunks of data between programs. A selection is a essentially a
	-- named clipboard, identified by a string interned as a
	-- GdkAtom. By claiming ownership of a selection, an application
	-- indicates that it will be responsible for supplying its
	-- contents. The most common selections are PRIMARY and CLIPBOARD.

	-- The contents of a selection can be represented in a number of
	-- formats, called targets. Each target is identified by an atom. A
	-- list of all possible targets supported by the selection owner
	-- can be retrieved by requesting the special target TARGETS. When
	-- a selection is retrieved, the data is accompanied by a type (an
	-- atom), and a format (an integer, representing the number of bits
	-- per item). See Properties and Atoms for more information.

	-- The functions in this section only contain the lowlevel parts of
	-- the selection protocol. A considerably more complicated
	-- implementation is needed on top of this. GTK+ contains such an
	-- implementation in the functions in gtkselection.h and
	-- programmers should use those functions instead of the ones
	-- presented here. If you plan to implement selection handling
	-- directly on top of the functions here, you should refer to the X
	-- Inter-client Communication Conventions Manual (ICCCM).

insert
	WRAPPER_HANDLER

feature {ANY} -- Constants

	primary: GDK_ATOM is
			-- A GdkAtom representing the PRIMARY selection.
		do
			Result.from_external_pointer (gdk_selection_primary)
		end

-- GDK_SELECTION_SECONDARY
-- 
-- #define GDK_SELECTION_SECONDARY 	_GDK_MAKE_ATOM (2)
-- 
-- A GdkAtom representing the SECONDARY selection.

	clipboard: GDK_ATOM is
			-- A GdkAtom representing the CLIPBOARD selection.
		do
			Result.from_external_pointer (gdk_selection_clipboard)
		end

-- GDK_TARGET_BITMAP
-- 
-- #define GDK_TARGET_BITMAP 		_GDK_MAKE_ATOM (5)
-- 
-- A GdkAtom representing the BITMAP selection target.
-- GDK_TARGET_COLORMAP
-- 
-- #define GDK_TARGET_COLORMAP 		_GDK_MAKE_ATOM (7)
-- 
-- A GdkAtom representing the COLORMAP selection target.
-- GDK_TARGET_DRAWABLE
-- 
-- #define GDK_TARGET_DRAWABLE 		_GDK_MAKE_ATOM (17)
-- 
-- A GdkAtom representing the DRAWABLE selection target.
-- GDK_TARGET_PIXMAP
-- 
-- #define GDK_TARGET_PIXMAP 		_GDK_MAKE_ATOM (20)
-- 
-- A GdkAtom representing the PIXMAP selection target.
-- GDK_TARGET_STRING
-- 
-- #define GDK_TARGET_STRING 		_GDK_MAKE_ATOM (31)
-- 
-- A GdkAtom representing the STRING selection target.
-- GDK_SELECTION_TYPE_ATOM
-- 
-- #define GDK_SELECTION_TYPE_ATOM 	_GDK_MAKE_ATOM (4)
-- 
-- A GdkAtom representing the ATOM selection type.
-- GDK_SELECTION_TYPE_BITMAP
-- 
-- #define GDK_SELECTION_TYPE_BITMAP 	_GDK_MAKE_ATOM (5)
-- 
-- A GdkAtom representing the BITMAP selection type.
-- GDK_SELECTION_TYPE_COLORMAP
-- 
-- #define GDK_SELECTION_TYPE_COLORMAP 	_GDK_MAKE_ATOM (7)
-- 
-- A GdkAtom representing the COLORMAP selection type.
-- GDK_SELECTION_TYPE_DRAWABLE
-- 
-- #define GDK_SELECTION_TYPE_DRAWABLE 	_GDK_MAKE_ATOM (17)
-- 
-- A GdkAtom representing the DRAWABLE selection type.
-- GDK_SELECTION_TYPE_INTEGER
-- 
-- #define GDK_SELECTION_TYPE_INTEGER 	_GDK_MAKE_ATOM (19)
-- 
-- A GdkAtom representing the INTEGER selection type.
-- GDK_SELECTION_TYPE_PIXMAP
-- 
-- #define GDK_SELECTION_TYPE_PIXMAP 	_GDK_MAKE_ATOM (20)
-- 
-- A GdkAtom representing the PIXMAP selection type.
-- GDK_SELECTION_TYPE_WINDOW
-- 
-- #define GDK_SELECTION_TYPE_WINDOW 	_GDK_MAKE_ATOM (33)
-- 
-- A GdkAtom representing the WINDOW selection type.
-- GDK_SELECTION_TYPE_STRING
-- 
-- #define GDK_SELECTION_TYPE_STRING 	_GDK_MAKE_ATOM (31)
-- 
-- A GdkAtom representing the STRING selection type.
-- gdk_selection_owner_set ()
-- 
-- gboolean            gdk_selection_owner_set             (GdkWindow *owner,
--                                                          GdkAtom selection,
--                                                          guint32 time_,
--                                                          gboolean send_event);
-- 
-- Sets the owner of the given selection.
-- 
-- owner :
-- 	a GdkWindow or NULL to indicate that the the owner for the given should be unset.
-- 
-- selection :
-- 	an atom identifying a selection.
-- 
-- time_ :
-- 	timestamp to use when setting the selection. If this is older than the timestamp given last time the owner was set for the given selection, the request will be ignored.
-- 
-- send_event :
-- 	if TRUE, and the new owner is different from the current owner, the current owner will be sent a SelectionClear event.
-- 
-- Returns :
-- 	TRUE if the selection owner was successfully changed to owner, otherwise FALSE.
-- gdk_selection_owner_set_for_display ()
-- 
-- gboolean            gdk_selection_owner_set_for_display (GdkDisplay *display,
--                                                          GdkWindow *owner,
--                                                          GdkAtom selection,
--                                                          guint32 time_,
--                                                          gboolean send_event);
-- 
-- Sets the GdkWindow owner as the current owner of the selection selection.
-- 
-- display :
-- 	the GdkDisplay.
-- 
-- owner :
-- 	a GdkWindow or NULL to indicate that the owner for the given should be unset.
-- 
-- selection :
-- 	an atom identifying a selection.
-- 
-- time_ :
-- 	timestamp to use when setting the selection. If this is older than the timestamp given last time the owner was set for the given selection, the request will be ignored.
-- 
-- send_event :
-- 	if TRUE, and the new owner is different from the current owner, the current owner will be sent a SelectionClear event.
-- 
-- Returns :
-- 	TRUE if the selection owner was successfully changed to owner, otherwise FALSE.
-- 
-- Since 2.2
-- gdk_selection_owner_get ()
-- 
-- GdkWindow*          gdk_selection_owner_get             (GdkAtom selection);
-- 
-- Determines the owner of the given selection.
-- 
-- selection :
-- 	an atom indentifying a selection.
-- 
-- Returns :
-- 	if there is a selection owner for this window, and it is a window known to the current process, the GdkWindow that owns the selection, otherwise NULL. Note that the return value may be owned by a different process if a foreign window was previously created for that window, but a new foreign window will never be created by this call.
-- gdk_selection_owner_get_for_display ()
-- 
-- GdkWindow*          gdk_selection_owner_get_for_display (GdkDisplay *display,
--                                                          GdkAtom selection);
-- 
-- Determine the owner of the given selection.
-- 
-- Note that the return value may be owned by a different process if a foreign window was previously created for that window, but a new foreign window will never be created by this call.
-- 
-- display :
-- 	a GdkDisplay.
-- 
-- selection :
-- 	an atom indentifying a selection.
-- 
-- Returns :
-- 	if there is a selection owner for this window, and it is a window known to the current process, the GdkWindow that owns the selection, otherwise NULL.
-- 
-- Since 2.2
-- gdk_selection_convert ()
-- 
-- void                gdk_selection_convert               (GdkWindow *requestor,
--                                                          GdkAtom selection,
--                                                          GdkAtom target,
--                                                          guint32 time_);
-- 
-- Retrieves the contents of a selection in a given form.
-- 
-- requestor :
-- 	a GdkWindow.
-- 
-- selection :
-- 	an atom identifying the selection to get the contents of.
-- 
-- target :
-- 	the form in which to retrieve the selection.
-- 
-- time_ :
-- 	the timestamp to use when retrieving the selection. The selection owner may refuse the request if it did not own the selection at the time indicated by the timestamp.
-- gdk_selection_property_get ()
-- 
-- gboolean            gdk_selection_property_get          (GdkWindow *requestor,
--                                                          guchar **data,
--                                                          GdkAtom *prop_type,
--                                                          gint *prop_format);
-- 
-- Retrieves selection data that was stored by the selection data in response to a call to gdk_selection_convert(). This function will not be used by applications, who should use the GtkClipboard API instead.
-- 
-- requestor :
-- 	the window on which the data is stored
-- 
-- data :
-- 	location to store a pointer to the retrieved data. If the retrieval failed, NULL we be stored here, otherwise, it will be non-NULL and the returned data should be freed with g_free() when you are finished using it. The length of the allocated memory is one more than the length of the returned data, and the final byte will always be zero, to ensure nul-termination of strings.
-- 
-- prop_type :
-- 	location to store the type of the property.
-- 
-- prop_format :
-- 	location to store the format of the property.
-- 
-- Returns :
-- 	the length of the retrieved data.
-- gdk_selection_send_notify ()
-- 
-- void                gdk_selection_send_notify           (guint32 requestor,
--                                                          GdkAtom selection,
--                                                          GdkAtom target,
--                                                          GdkAtom property,
--                                                          guint32 time_);
-- 
-- Sends a response to SelectionRequest event.
-- 
-- requestor :
-- 	window to which to deliver response.
-- 
-- selection :
-- 	selection that was requested.
-- 
-- target :
-- 	target that was selected.
-- 
-- property :
-- 	property in which the selection owner stored the data, or GDK_NONE to indicate that the request was rejected.
-- 
-- time_ :
-- 	timestamp.
-- gdk_selection_send_notify_for_display ()
-- 
-- void                gdk_selection_send_notify_for_display
--                                                         (GdkDisplay *display,
--                                                          guint32 requestor,
--                                                          GdkAtom selection,
--                                                          GdkAtom target,
--                                                          GdkAtom property,
--                                                          guint32 time_);
-- 
-- Send a response to SelectionRequest event.
-- 
-- display :
-- 	the GdkDisplay where requestor is realized
-- 
-- requestor :
-- 	window to which to deliver response.
-- 
-- selection :
-- 	selection that was requested.
-- 
-- target :
-- 	target that was selected.
-- 
-- property :
-- 	property in which the selection owner stored the data, or GDK_NONE to indicate that the request was rejected.
-- 
-- time_ :
-- 	timestamp.
-- 
-- Since 2.2
feature {} -- Externals

-- typedef             GdkSelection;
-- typedef             GdkSelectionType;
-- typedef             GdkTarget;

	gdk_selection_primary: POINTER is
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SELECTION_PRIMARY"
		end

-- #define             GDK_SELECTION_SECONDARY

	gdk_selection_clipboard: POINTER is
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SELECTION_CLIPBOARD"
		end

-- #define             GDK_TARGET_BITMAP
-- #define             GDK_TARGET_COLORMAP
-- #define             GDK_TARGET_DRAWABLE
-- #define             GDK_TARGET_PIXMAP
-- #define             GDK_TARGET_STRING
-- #define             GDK_SELECTION_TYPE_ATOM
-- #define             GDK_SELECTION_TYPE_BITMAP
-- #define             GDK_SELECTION_TYPE_COLORMAP
-- #define             GDK_SELECTION_TYPE_DRAWABLE
-- #define             GDK_SELECTION_TYPE_INTEGER
-- #define             GDK_SELECTION_TYPE_PIXMAP
-- #define             GDK_SELECTION_TYPE_WINDOW
-- #define             GDK_SELECTION_TYPE_STRING
-- gboolean            gdk_selection_owner_set             (GdkWindow *owner,
--                                                          GdkAtom selection,
--                                                          guint32 time_,
--                                                          gboolean send_event);
-- gboolean            gdk_selection_owner_set_for_display (GdkDisplay *display,
--                                                          GdkWindow *owner,
--                                                          GdkAtom selection,
--                                                          guint32 time_,
--                                                          gboolean send_event);
-- GdkWindow*          gdk_selection_owner_get             (GdkAtom selection);
-- GdkWindow*          gdk_selection_owner_get_for_display (GdkDisplay *display,
--                                                          GdkAtom selection);
-- void                gdk_selection_convert               (GdkWindow *requestor,
--                                                          GdkAtom selection,
--                                                          GdkAtom target,
--                                                          guint32 time_);
-- gboolean            gdk_selection_property_get          (GdkWindow *requestor,
--                                                          guchar **data,
--                                                          GdkAtom *prop_type,
--                                                          gint *prop_format);
-- void                gdk_selection_send_notify           (guint32 requestor,
--                                                          GdkAtom selection,
--                                                          GdkAtom target,
--                                                          GdkAtom property,
--                                                          guint32 time_);
-- void                gdk_selection_send_notify_for_display
--                                                         (GdkDisplay *display,
--                                                          guint32 requestor,
--                                                          GdkAtom selection,
--                                                          GdkAtom target,
--                                                          GdkAtom property,
--                                                          guint32 time_);


end
