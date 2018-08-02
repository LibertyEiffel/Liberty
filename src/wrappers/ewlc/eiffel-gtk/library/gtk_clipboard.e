note
	description: "Clipboards - Storing data on clipboards."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTK+ team
					
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

class GTK_CLIPBOARD
	-- The GtkClipboard object represents a clipboard of data shared
	-- between different processes or between different widgets in the
	-- same process. Each clipboard is identified by a name encoded as
	-- a GdkAtom. (Conversion to and from strings can be done with
	-- gdk_atom_intern() and gdk_atom_name().) The default clipboard
	-- corresponds to the "CLIPBOARD" atom; another commonly used
	-- clipboard is the "PRIMARY" clipboard, which, in X, traditionally
	-- contains the currently selected text.

	-- To support having a number of different formats on the clipboard
	-- at the same time, the clipboard mechanism allows providing
	-- callbacks instead of the actual data. When you set the contents
	-- of the clipboard, you can either supply the data directly (via
	-- functions like gtk_clipboard_set_text()), or you can supply a
	-- callback to be called at a later time when the data is needed
	-- (via gtk_clipboard_set_with_data() or
	-- gtk_clipboard_set_with_owner().) Providing a callback also
	-- avoids having to make copies of the data when it is not needed.

	-- gtk_clipboard_set_with_data() and gtk_clipboard_set_with_owner()
	-- are quite similar; the choice between the two depends mostly on
	-- which is more convenient in a particular situation. The former
	-- is most useful when you want to have a blob of data with
	-- callbacks to convert it into the various data types that you
	-- advertise. When the clear_func you provided is called, you
	-- simply free the data blob. The latter is more useful when the
	-- contents of clipboard reflect the internal state of a GObject
	-- (As an example, for the PRIMARY clipboard, when an entry widget
	-- provides the clipboard's contents the contents are simply the
	-- text within the selected region.) If the contents change, the
	-- entry widget can call gtk_clipboard_set_with_owner() to update
	-- the timestamp for clipboard ownership, without having to worry
	-- about clear_func being called.
	
	-- Requesting the data from the clipboard is essentially
	-- asynchronous. If the contents of the clipboard are provided
	-- within the same process, then a direct function call will be
	-- made to retrieve the data, but if they are provided by another
	-- process, then the data needs to be retrieved from the other
	-- process, which may take some time. To avoid blocking the user
	-- interface, the call to request the selection,
	-- gtk_clipboard_request_contents() takes a callback that will be
	-- called when the contents are received (or when the request
	-- fails.) If you don't want to deal with providing a separate
	-- callback, you can also use
	-- gtk_clipboard_wait_for_contents(). What this does is run the
	-- GLib main loop recursively waiting for the contents. This can
	-- simplify the code flow, but you still have to be aware that
	-- other callbacks in your program can be called while this
	-- recursive mainloop is running.

	-- Along with the functions to get the clipboard contents as an
	-- arbitrary data chunk, there are also functions to retrieve it as
	-- text, gtk_clipboard_request_text() and
	-- gtk_clipboard_wait_for_text(). These functions take care of
	-- determining which formats are advertised by the clipboard
	-- provider, asking for the clipboard in the best available format
	-- and converting the results into the UTF-8 encoding. (The
	-- standard form for representing strings in GTK+.)
	
	-- GtkClipboard provides a high-level wrapper around the lower
	-- level routines that deal with X selections. It is also possibly
	-- to directly manipulate the X selections, though it is seldom
	-- necessary to do so.
	
inherit G_OBJECT 

create {ANY}
	make, from_external_pointer

feature {} -- Creation

-- Details
-- GtkClipboard

-- typedef struct _GtkClipboard GtkClipboard;

-- GtkClipboardReceivedFunc ()

-- void        (*GtkClipboardReceivedFunc)     (GtkClipboard *clipboard,
--                                              GtkSelectionData *selection_data,
--                                              gpointer data);

-- A function to be called when the results of gtk_clipboard_request_contents() are received, or when the request fails.
-- clipboard : 	the GtkClipboard
-- selection_data : 	a GtkSelectionData containing the data was received. If retrieving the data failed, then then length field of selection_data will be negative.
-- data : 	the user_data supplied to gtk_clipboard_request_contents().
-- GtkClipboardTextReceivedFunc ()

-- void        (*GtkClipboardTextReceivedFunc) (GtkClipboard *clipboard,
--                                              const gchar *text,
--                                              gpointer data);

-- A function to be called when the results of gtk_clipboard_request_text() are received, or when the request fails.
-- clipboard : 	the GtkClipboard
-- text : 	the text received, as a UTF-8 encoded string, or NULL if retrieving the data failed.
-- data : 	the user_data supplied to gtk_clipboard_request_text().
-- GtkClipboardImageReceivedFunc ()

-- void        (*GtkClipboardImageReceivedFunc)
--                                             (GtkClipboard *clipboard,
--                                              GdkPixbuf *pixbuf,
--                                              gpointer data);

-- A function to be called when the results of gtk_clipboard_request_image() are received, or when the request fails.
-- clipboard : 	the GtkClipboard
-- pixbuf : 	the received image
-- data : 	the user_data supplied to gtk_clipboard_request_image().

-- Since 2.6
-- GtkClipboardTargetsReceivedFunc ()

-- void        (*GtkClipboardTargetsReceivedFunc)
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom *atoms,
--                                              gint n_atoms,
--                                              gpointer data);

-- A function to be called when the results of gtk_clipboard_request_targets() are received, or when the request fails.
-- clipboard : 	the GtkClipboard
-- atoms : 	the supported targets, as array of GdkAtom, or NULL if retrieving the data failed.
-- n_atoms : 	the length of the atoms array.
-- data : 	the user_data supplied to gtk_clipboard_request_targets().

-- Since 2.4
-- GtkClipboardRichTextReceivedFunc ()

-- void        (*GtkClipboardRichTextReceivedFunc)
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom format,
--                                              const guint8 *text,
--                                              gsize length,
--                                              gpointer data);

-- clipboard : 	
-- format : 	
-- text : 	
-- length : 	
-- data : 	
-- GtkClipboardGetFunc ()

-- void        (*GtkClipboardGetFunc)          (GtkClipboard *clipboard,
--                                              GtkSelectionData *selection_data,
--                                              guint info,
--                                              gpointer user_data_or_owner);

-- A function that will be called to provide the contents of the selection. If multiple types of data were advertised, the requested type can be determined from the info parameter or by checking the target field of selection_data. If the data could successfully be converted into then it should be stored into the selection_data object by calling gtk_selection_data_set() (or related functions such as gtk_selection_data_set_text()). If no data is set, the requestor will be informed that the attempt to get the data failed.
-- clipboard : 	the GtkClipboard
-- selection_data : 	a GtkSelectionData argument in which the requested data should be stored.
-- info : 	the info field corresponding to the requested target from the GtkTargetEntry array passed to gtk_clipboard_set_with_data() or gtk_clipboard_set_with_owner().
-- user_data_or_owner : 	the user_data argument passed to gtk_clipboard_set_with_data(), or the owner argument passed to gtk_clipboard_set_with_owner()
-- GtkClipboardClearFunc ()

-- void        (*GtkClipboardClearFunc)        (GtkClipboard *clipboard,
--                                              gpointer user_data_or_owner);

-- A function that will be called when the contents of the clipboard are changed or cleared. Once this has called, the user_data_or_owner argument will not be used again.
-- clipboard : 	the GtkClipboard
-- user_data_or_owner : 	the user_data argument passed to gtk_clipboard_set_with_data(), or the owner argument passed to gtk_clipboard_set_with_owner()
-- gtk_clipboard_get ()


	make (selection: GDK_ATOM)
			-- Returns the clipboard object for the given selection. See
			-- `make_for_display' for complete details.
		do
-- TODO			from_external_pointer (gtk_clipboard_get (selection.handle))
		end

-- selection : 	a GdkAtom which identifies the clipboard to use.
-- Returns : 	the appropriate clipboard object. If no clipboard already exists, a new one will be created. Once a clipboard object has been created, it is persistent and, since it is owned by GTK+, must not be freed or unrefd.
-- gtk_clipboard_get_for_display ()

-- GtkClipboard* gtk_clipboard_get_for_display (GdkDisplay *display,
--                                              GdkAtom selection);

-- Returns the clipboard object for the given selection. Cut/copy/paste menu items and keyboard shortcuts should use the default clipboard, returned by passing GDK_SELECTION_CLIPBOARD for selection. (GDK_NONE is supported as a synonym for GDK_SELECTION_CLIPBOARD for backwards compatibility reasons.) The currently-selected object or text should be provided on the clipboard identified by GDK_SELECTION_PRIMARY. Cut/copy/paste menu items conceptually copy the contents of the GDK_SELECTION_PRIMARY clipboard to the default clipboard, i.e. they copy the selection to what the user sees as the clipboard.

-- (Passing GDK_NONE is the same as using gdk_atom_intern ("CLIPBOARD", FALSE). See http://www.freedesktop.org/Standards/clipboards-spec for a detailed discussion of the "CLIPBOARD" vs. "PRIMARY" selections under the X window system. On Win32 the GDK_SELECTION_PRIMARY clipboard is essentially ignored.)

-- It's possible to have arbitrary named clipboards; if you do invent new clipboards, you should prefix the selection name with an underscore (because the ICCCM requires that nonstandard atoms are underscore-prefixed), and namespace it as well. For example, if your application called "Foo" has a special-purpose clipboard, you might call it "_FOO_SPECIAL_CLIPBOARD".

-- display : 	the display for which the clipboard is to be retrieved or created
-- selection : 	a GdkAtom which identifies the clipboard to use.
-- Returns : 	the appropriate clipboard object. If no clipboard already exists, a new one will be created. Once a clipboard object has been created, it is persistent and, since it is owned by GTK+, must not be freed or unrefd.

-- Since 2.2
-- gtk_clipboard_get_display ()

-- GdkDisplay* gtk_clipboard_get_display       (GtkClipboard *clipboard);

-- Gets the GdkDisplay associated with clipboard

-- clipboard : 	a GtkClipboard
-- Returns : 	the GdkDisplay associated with clipboard

-- Since 2.2
-- gtk_clipboard_set_with_data ()

-- gboolean    gtk_clipboard_set_with_data     (GtkClipboard *clipboard,
--                                              const GtkTargetEntry *targets,
--                                              guint n_targets,
--                                              GtkClipboardGetFunc get_func,
--                                              GtkClipboardClearFunc clear_func,
--                                              gpointer user_data);

-- Virtually sets the contents of the specified clipboard by providing a list of supported formats for the clipboard data and a function to call to get the actual data when it is requested.

-- clipboard : 	a GtkClipboard
-- targets : 	array containing information about the available forms for the clipboard data
-- n_targets : 	number of elements in targets
-- get_func : 	function to call to get the actual clipboard data
-- clear_func : 	when the clipboard contents are set again, this function will be called, and get_func will not be subsequently called.
-- user_data : 	user data to pass to get_func and clear_func.
-- Returns : 	TRUE if setting the clipboard data succeeded. If setting the clipboard data failed the provided callback functions will be ignored.
-- gtk_clipboard_set_with_owner ()

-- gboolean    gtk_clipboard_set_with_owner    (GtkClipboard *clipboard,
--                                              const GtkTargetEntry *targets,
--                                              guint n_targets,
--                                              GtkClipboardGetFunc get_func,
--                                              GtkClipboardClearFunc clear_func,
--                                              GObject *owner);

-- Virtually sets the contents of the specified clipboard by providing a list of supported formats for the clipboard data and a function to call to get the actual data when it is requested.

-- The difference between this function and gtk_clipboard_set_with_data() is that instead of an generic user_data pointer, a GObject is passed in.

-- clipboard : 	a GtkClipboard
-- targets : 	array containing information about the available forms for the clipboard data
-- n_targets : 	number of elements in targets
-- get_func : 	function to call to get the actual clipboard data
-- clear_func : 	when the clipboard contents are set again, this function will be called, and get_func will not be subsequently called.
-- owner : 	an object that "owns" the data. This object will be passed to the callbacks when called.
-- Returns : 	TRUE if setting the clipboard data succeeded. If setting the clipboard data failed the provided callback functions will be ignored.
-- gtk_clipboard_get_owner ()

-- GObject*    gtk_clipboard_get_owner         (GtkClipboard *clipboard);

-- If the clipboard contents callbacks were set with gtk_clipboard_set_with_owner(), and the gtk_clipboard_set_with_data() or gtk_clipboard_clear() has not subsequently called, returns the owner set by gtk_clipboard_set_with_owner().

-- clipboard : 	a GtkClipboard
-- Returns : 	the owner of the clipboard, if any; otherwise NULL.
-- gtk_clipboard_clear ()

-- void        gtk_clipboard_clear             (GtkClipboard *clipboard);

-- Clears the contents of the clipboard. Generally this should only be called between the time you call gtk_clipboard_set_with_owner() or gtk_clipboard_set_with_data(), and when the clear_func you supplied is called. Otherwise, the clipboard may be owned by someone else.

-- clipboard : 	a GtkClipboard
-- gtk_clipboard_set_text ()

feature {ANY}

	set_text (text: STRING)
			-- Sets the contents of the clipboard to the given UTF-8 string. GTK+ will
			-- make a copy of the text and take responsibility for responding for
			-- requests for the text, and for converting the text into the requested
			-- format.
		do
			gtk_clipboard_set_text (handle, text.to_external, text.count)
		end

-- gtk_clipboard_set_image ()

-- void        gtk_clipboard_set_image         (GtkClipboard *clipboard,
--                                              GdkPixbuf *pixbuf);

-- Sets the contents of the clipboard to the given GdkPixbuf. GTK+ will take responsibility for responding for requests for the image, and for converting the image into the requested format.

-- clipboard : 	a GtkClipboard object
-- pixbuf : 	a GdkPixbuf

-- Since 2.6
-- gtk_clipboard_request_contents ()

-- void        gtk_clipboard_request_contents  (GtkClipboard *clipboard,
--                                              GdkAtom target,
--                                              GtkClipboardReceivedFunc callback,
--                                              gpointer user_data);

-- Requests the contents of clipboard as the given target. When the results of the result are later received the supplied callback will be called.

-- clipboard : 	a GtkClipboard
-- target : 	an atom representing the form into which the clipboard owner should convert the selection.
-- callback : 	A function to call when the results are received (or the retrieval fails). If the retrieval fails the length field of selection_data will be negative.
-- user_data : 	user data to pass to callback
-- gtk_clipboard_request_text ()

-- void        gtk_clipboard_request_text      (GtkClipboard *clipboard,
--                                              GtkClipboardTextReceivedFunc callback,
--                                              gpointer user_data);

-- Requests the contents of the clipboard as text. When the text is later received, it will be converted to UTF-8 if necessary, and callback will be called.

-- The text parameter to callback will contain the resulting text if the request succeeded, or NULL if it failed. This could happen for various reasons, in particular if the clipboard was empty or if the contents of the clipboard could not be converted into text form.

-- clipboard : 	a GtkClipboard
-- callback : 	a function to call when the text is received, or the retrieval fails. (It will always be called one way or the other.)
-- user_data : 	user data to pass to callback.
-- gtk_clipboard_request_image ()

-- void        gtk_clipboard_request_image     (GtkClipboard *clipboard,
--                                              GtkClipboardImageReceivedFunc callback,
--                                              gpointer user_data);

-- Requests the contents of the clipboard as image. When the image is later received, it will be converted to a GdkPixbuf, and callback will be called.

-- The pixbuf parameter to callback will contain the resulting GdkPixbuf if the request succeeded, or NULL if it failed. This could happen for various reasons, in particular if the clipboard was empty or if the contents of the clipboard could not be converted into an image.

-- clipboard : 	a GtkClipboard
-- callback : 	a function to call when the image is received, or the retrieval fails. (It will always be called one way or the other.)
-- user_data : 	user data to pass to callback.

-- Since 2.6
-- gtk_clipboard_request_targets ()

-- void        gtk_clipboard_request_targets   (GtkClipboard *clipboard,
--                                              GtkClipboardTargetsReceivedFunc callback,
--                                              gpointer user_data);

-- Requests the contents of the clipboard as list of supported targets. When the list is later received, callback will be called.

-- The targets parameter to callback will contain the resulting targets if the request succeeded, or NULL if it failed.

-- clipboard : 	a GtkClipboard
-- callback : 	a function to call when the targets are received, or the retrieval fails. (It will always be called one way or the other.)
-- user_data : 	user data to pass to callback.

-- Since 2.4
-- gtk_clipboard_request_rich_text ()

-- void        gtk_clipboard_request_rich_text (GtkClipboard *clipboard,
--                                              GtkTextBuffer *buffer,
--                                              GtkClipboardRichTextReceivedFunc callback,
--                                              gpointer user_data);

-- Requests the contents of the clipboard as rich text. When the rich text is later received, callback will be called.

-- The text parameter to callback will contain the resulting rich text if the request succeeded, or NULL if it failed. The length parameter will contain text's length. This function can fail for various reasons, in particular if the clipboard was empty or if the contents of the clipboard could not be converted into rich text form.

-- clipboard : 	a GtkClipboard
-- buffer : 	a GtkTextBuffer
-- callback : 	a function to call when the text is received, or the retrieval fails. (It will always be called one way or the other.)
-- user_data : 	user data to pass to callback.

-- Since 2.10
-- gtk_clipboard_wait_for_contents ()

-- GtkSelectionData* gtk_clipboard_wait_for_contents
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom target);

-- Requests the contents of the clipboard using the given target. This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- clipboard : 	a GtkClipboard
-- target : 	an atom representing the form into which the clipboard owner should convert the selection.
-- Returns : 	a newly-allocated GtkSelectionData object or NULL if retrieving the given target failed. If non-NULL, this value must be freed with gtk_selection_data_free() when you are finished with it.
-- gtk_clipboard_wait_for_text ()


	wait_for_text: STRING
			-- Requests the contents of the clipboard as text and converts the result
			-- to UTF-8 if necessary. This function waits for the data to be received
			-- using the main loop, so events, timeouts, etc, may be dispatched during
			-- the wait.
		local
			r: POINTER
		do
			r := gtk_clipboard_wait_for_text (handle)
			if not r.is_null then
				create Result.from_external (r)
			end
		end

-- GdkPixbuf*  gtk_clipboard_wait_for_image    (GtkClipboard *clipboard);

-- Requests the contents of the clipboard as image and converts the result to a GdkPixbuf. This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- clipboard : 	a GtkClipboard
-- Returns : 	a newly-allocated GdkPixbuf object which must be disposed with g_object_unref(), or NULL if retrieving the selection data failed. (This could happen for various reasons, in particular if the clipboard was empty or if the contents of the clipboard could not be converted into an image.)

-- Since 2.6
-- gtk_clipboard_wait_for_rich_text ()

-- guint8*     gtk_clipboard_wait_for_rich_text
--                                             (GtkClipboard *clipboard,
--                                              GtkTextBuffer *buffer,
--                                              GdkAtom *format,
--                                              gsize *length);

-- Requests the contents of the clipboard as rich text. This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- clipboard : 	a GtkClipboard
-- buffer : 	a GtkTextBuffer
-- format : 	return location for the format of the returned data
-- length : 	return location for the length of the returned data
-- Returns : 	a newly-allocated binary block of data which must be freed with g_free(), or NULL if retrieving the selection data failed. (This could happen for various reasons, in particular if the clipboard was empty or if the contents of the clipboard could not be converted into text form.)

-- Since 2.10
-- gtk_clipboard_wait_is_text_available ()

-- gboolean    gtk_clipboard_wait_is_text_available
--                                             (GtkClipboard *clipboard);

-- Test to see if there is text available to be pasted This is done by requesting the TARGETS atom and checking if it contains any of the supported text targets. This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- This function is a little faster than calling gtk_clipboard_wait_for_text() since it doesn't need to retrieve the actual text.

-- clipboard : 	a GtkClipboard
-- Returns : 	TRUE is there is text available, FALSE otherwise.
-- gtk_clipboard_wait_is_image_available ()

-- gboolean    gtk_clipboard_wait_is_image_available
--                                             (GtkClipboard *clipboard);

-- Test to see if there is an image available to be pasted This is done by requesting the TARGETS atom and checking if it contains any of the supported image targets. This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- This function is a little faster than calling gtk_clipboard_wait_for_image() since it doesn't need to retrieve the actual image data.

-- clipboard : 	a GtkClipboard
-- Returns : 	TRUE is there is an image available, FALSE otherwise.

-- Since 2.6
-- gtk_clipboard_wait_is_rich_text_available ()

-- gboolean    gtk_clipboard_wait_is_rich_text_available
--                                             (GtkClipboard *clipboard,
--                                              GtkTextBuffer *buffer);

-- Test to see if there is rich text available to be pasted This is done by requesting the TARGETS atom and checking if it contains any of the supported rich text targets. This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- This function is a little faster than calling gtk_clipboard_wait_for_rich_text() since it doesn't need to retrieve the actual text.

-- clipboard : 	a GtkClipboard
-- buffer : 	a GtkTextBuffer
-- Returns : 	TRUE is there is rich text available, FALSE otherwise.

-- Since 2.10
-- gtk_clipboard_wait_for_targets ()

-- gboolean    gtk_clipboard_wait_for_targets  (GtkClipboard *clipboard,
--                                              GdkAtom **targets,
--                                              gint *n_targets);

-- Returns a list of targets that are present on the clipboard, or NULL if there aren't any targets available. The returned list must be freed with g_free(). This function waits for the data to be received using the main loop, so events, timeouts, etc, may be dispatched during the wait.

-- clipboard : 	a GtkClipboard
-- targets : 	location to store an array of targets. The result stored here must be freed with g_free().
-- n_targets : 	location to store number of items in targets.
-- Returns : 	TRUE if any targets are present on the clipboard, otherwise FALSE.

-- Since 2.4
-- gtk_clipboard_wait_is_target_available ()

-- gboolean    gtk_clipboard_wait_is_target_available
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom target);

-- Checks if a clipboard supports pasting data of a given type. This function can be used to determine if a "Paste" menu item should be insensitive or not.

-- If you want to see if there's text available on the clipboard, use gtk_clipboard_wait_is_text_available() instead.

-- clipboard : 	a GtkClipboard
-- target : 	A GdkAtom indicating which target to look for.
-- Returns : 	TRUE if the target is available, FALSE otherwise.

-- Since 2.6
-- gtk_clipboard_set_can_store ()

-- void        gtk_clipboard_set_can_store     (GtkClipboard *clipboard,
--                                              const GtkTargetEntry *targets,
--                                              gint n_targets);

-- Hints that the clipboard data should be stored somewhere when the application exits or when gtk_clipboard_store() is called.

-- This value is reset when the clipboard owner changes. Where the clipboard data is stored is platform dependent, see gdk_display_store_clipboard() for more information.

-- clipboard : 	a GtkClipboard
-- targets : 	array containing information about which forms should be stored or NULL to indicate that all forms should be stored.
-- n_targets : 	number of elements in targets

-- Since 2.6
-- gtk_clipboard_store ()

-- void        gtk_clipboard_store             (GtkClipboard *clipboard);

-- Stores the current clipboard data somewhere so that it will stay around after the application has quit.

-- clipboard : 	a GtkClipboard

-- Since 2.6
-- Signals

-- "owner-change"
--             void        user_function      (GtkClipboard *clipboard,
--                                             GdkEvent     *event,
--                                             gpointer      user_data)      : Run first


-- Signal Details
-- The "owner-change" signal

-- void        user_function                  (GtkClipboard *clipboard,
--                                             GdkEvent     *event,
--                                             gpointer      user_data)      : Run first

-- clipboard : 	the object which received the signal.
-- event : 	
-- user_data : 	user data set when the signal handler was connected.
feature {} -- External calls
-- Synopsis

-- #include <gtk/gtk.h>


--             GtkClipboard;
-- void        (*GtkClipboardReceivedFunc)     (GtkClipboard *clipboard,
--                                              GtkSelectionData *selection_data,
--                                              gpointer data);
-- void        (*GtkClipboardTextReceivedFunc) (GtkClipboard *clipboard,
--                                              const gchar *text,
--                                              gpointer data);
-- void        (*GtkClipboardImageReceivedFunc)
--                                             (GtkClipboard *clipboard,
--                                              GdkPixbuf *pixbuf,
--                                              gpointer data);
-- void        (*GtkClipboardTargetsReceivedFunc)
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom *atoms,
--                                              gint n_atoms,
--                                              gpointer data);
-- void        (*GtkClipboardRichTextReceivedFunc)
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom format,
--                                              const guint8 *text,
--                                              gsize length,
--                                              gpointer data);
-- void        (*GtkClipboardGetFunc)          (GtkClipboard *clipboard,
--                                              GtkSelectionData *selection_data,
--                                              guint info,
--                                              gpointer user_data_or_owner);
-- void        (*GtkClipboardClearFunc)        (GtkClipboard *clipboard,
--                                              gpointer user_data_or_owner);
-- GtkClipboard* gtk_clipboard_get             (GdkAtom selection);

	gtk_clipboard_get (selection: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- GtkClipboard* gtk_clipboard_get_for_display (GdkDisplay *display,
--                                              GdkAtom selection);
-- GdkDisplay* gtk_clipboard_get_display       (GtkClipboard *clipboard);
-- gboolean    gtk_clipboard_set_with_data     (GtkClipboard *clipboard,
--                                              const GtkTargetEntry *targets,
--                                              guint n_targets,
--                                              GtkClipboardGetFunc get_func,
--                                              GtkClipboardClearFunc clear_func,
--                                              gpointer user_data);
-- gboolean    gtk_clipboard_set_with_owner    (GtkClipboard *clipboard,
--                                              const GtkTargetEntry *targets,
--                                              guint n_targets,
--                                              GtkClipboardGetFunc get_func,
--                                              GtkClipboardClearFunc clear_func,
--                                              GObject *owner);
-- GObject*    gtk_clipboard_get_owner         (GtkClipboard *clipboard);
-- void        gtk_clipboard_clear             (GtkClipboard *clipboard);

	gtk_clipboard_set_text (clipboard: POINTER; text: POINTER; len: INTEGER)
		external "C use <gtk/gtk.h>"
		end

-- void        gtk_clipboard_set_image         (GtkClipboard *clipboard,
--                                              GdkPixbuf *pixbuf);
-- void        gtk_clipboard_request_contents  (GtkClipboard *clipboard,
--                                              GdkAtom target,
--                                              GtkClipboardReceivedFunc callback,
--                                              gpointer user_data);
-- void        gtk_clipboard_request_text      (GtkClipboard *clipboard,
--                                              GtkClipboardTextReceivedFunc callback,
--                                              gpointer user_data);
-- void        gtk_clipboard_request_image     (GtkClipboard *clipboard,
--                                              GtkClipboardImageReceivedFunc callback,
--                                              gpointer user_data);
-- void        gtk_clipboard_request_targets   (GtkClipboard *clipboard,
--                                              GtkClipboardTargetsReceivedFunc callback,
--                                              gpointer user_data);
-- void        gtk_clipboard_request_rich_text (GtkClipboard *clipboard,
--                                              GtkTextBuffer *buffer,
--                                              GtkClipboardRichTextReceivedFunc callback,
--                                              gpointer user_data);
-- GtkSelectionData* gtk_clipboard_wait_for_contents
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom target);
	gtk_clipboard_wait_for_text (clipboard: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- GdkPixbuf*  gtk_clipboard_wait_for_image    (GtkClipboard *clipboard);
-- guint8*     gtk_clipboard_wait_for_rich_text
--                                             (GtkClipboard *clipboard,
--                                              GtkTextBuffer *buffer,
--                                              GdkAtom *format,
--                                              gsize *length);
-- gboolean    gtk_clipboard_wait_is_text_available
--                                             (GtkClipboard *clipboard);
-- gboolean    gtk_clipboard_wait_is_image_available
--                                             (GtkClipboard *clipboard);
-- gboolean    gtk_clipboard_wait_is_rich_text_available
--                                             (GtkClipboard *clipboard,
--                                              GtkTextBuffer *buffer);
-- gboolean    gtk_clipboard_wait_for_targets  (GtkClipboard *clipboard,
--                                              GdkAtom **targets,
--                                              gint *n_targets);
-- gboolean    gtk_clipboard_wait_is_target_available
--                                             (GtkClipboard *clipboard,
--                                              GdkAtom target);
-- void        gtk_clipboard_set_can_store     (GtkClipboard *clipboard,
--                                              const GtkTargetEntry *targets,
--                                              gint n_targets);
-- void        gtk_clipboard_store             (GtkClipboard *clipboard);

feature {ANY} -- size

	struct_size: INTEGER
		external "C use <gtk/gtk.h>"
		alias "sizeof(GtkClipboard)"
		end
	
end -- class GTK_CLIPBOARD
