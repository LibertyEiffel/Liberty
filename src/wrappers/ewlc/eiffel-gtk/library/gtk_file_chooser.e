note
	description: "GtkFileChooser -- File chooser interface used by GtkFileChooserWidget and GtkFileChooserDialog."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_CHOOSER
	-- GtkFileChooser is an interface that can be implemented by file
	-- selection widgets. In GTK+, the main objects that implement this
	-- interface are GtkFileChooserWidget, GtkFileChooserDialog, and
	-- GtkFileChooserButton. You do not need to write an object that
	-- implements the GtkFileChooser interface unless you are trying to
	-- adapt an existing file selector to expose a standard programming
	-- interface.

	-- GtkFileChooser allows for shortcuts to various places in the
	-- filesystem. In the default implementation these are displayed in
	-- the left pane. It may be a bit confusing at first taht these
	-- shortcuts come from various sources and in various flavours, so
	-- lets explain the terminology here:
	
	-- Bookmarks are created by the user, by dragging folders from the
	-- right pane to the left pane, or by using the "Add". Bookmarks
	-- can be renamed and deleted by the user.

	-- Shortcuts can be provided by the application or by the
	-- underlying filesystem abstraction (e.g. both the gnome-vfs and
	-- the Windows filesystems provide "Desktop" shortcuts). Shortcuts
	-- cannot be modified by the user.

	-- Volumes are provided by the underlying filesystem
	-- abstraction. They are the "roots" of the filesystem.
	
	-- File Names and Encodings: When the user is finished selecting
	-- files in a GtkFileChooser, your program can get the selected
	-- names either as filenames or as URIs. For URIs, the normal
	-- escaping rules are applied if the URI contains non-ASCII
	-- characters. However, filenames are always returned in the
	-- character set specified by the G_FILENAME_ENCODING environment
	-- variable. Please see the Glib documentation for more details
	-- about this variable.

	-- Important: This means that while you can pass the result of
	-- gtk_file_chooser_get_filename() to open(2) or fopen(3), you may
	-- not be able to directly set it as the text of a GtkLabel widget
	-- unless you convert it first to UTF-8, which all GTK+ widgets
	-- expect. You should use g_filename_to_utf8() to convert filenames
	-- into strings that can be passed to GTK+ widgets.

	-- Adding a Preview Widget: You can add a custom preview widget to
	-- a file chooser and then get notification about when the preview
	-- needs to be updated. To install a preview widget, use
	-- gtk_file_chooser_set_preview_widget(). Then, connect to the
	-- GtkFileChooser::update-preview signal to get notified when you
	-- need to update the contents of the preview.

	-- Your callback should use gtk_file_chooser_get_preview_filename()
	-- to see what needs previewing. Once you have generated the
	-- preview for the corresponding file, you must call
	-- gtk_file_chooser_set_preview_widget_active() with a boolean flag
	-- that indicates whether your callback could successfully generate
	-- a preview.

	-- TODO: Eiffellize Example 2. Sample Usage
	
	-- {
	--   GtkImage *preview;

	--   ...

	--   preview = gtk_image_new ();

	--   gtk_file_chooser_set_preview_widget (my_file_chooser, preview);
	--   g_signal_connect (my_file_chooser, "update-preview",
	-- 		    G_CALLBACK (update_preview_cb), preview);
	-- }

	-- static void
	-- update_preview_cb (GtkFileChooser *file_chooser, gpointer data)
	-- {
	--   GtkWidget *preview;
	--   char *filename;
	--   GdkPixbuf *pixbuf;
	--   gboolean have_preview;

	--   preview = GTK_WIDGET (data);
	--   filename = gtk_file_chooser_get_preview_filename (file_chooser);

	--   pixbuf = gdk_pixbuf_new_from_file_at_size (filename, 128, 128, NULL);
	--   have_preview = (pixbuf != NULL);
	--   g_free (filename);

	--   gtk_image_set_from_pixbuf (GTK_IMAGE (preview), pixbuf);
	--   if (pixbuf)
	--     gdk_pixbuf_unref (pixbuf);

	--   gtk_file_chooser_set_preview_widget_active (file_chooser, have_preview);
	-- }
	

	-- Adding Extra Widgets

	-- You can add extra widgets to a file chooser to provide options that are not present in the default design. For example, you can add a toggle button to give the user the option to open a file in read-only mode. You can use gtk_file_chooser_set_extra_widget() to insert additional widgets in a file chooser.

	-- TODO: Eiffelize Example 3. Sample Usage

	-- {
	--   GtkWidget *toggle;

	--   ...

	--   toggle = gtk_check_button_new_with_label ("Open file read-only");
	--   gtk_widget_show (toggle);
	--   gtk_file_chooser_set_extra_widget (my_file_chooser, toggle);
	-- }
	

	-- Note

	-- If you want to set more than one extra widget in the file chooser, you can a container such as a GtkVBox or a GtkTable and include your widgets in it. Then, set the container as the whole extra widget.
	-- Key Bindings

	-- Internally, GTK+ implements a file chooser's graphical user interface with the private GtkFileChooserDefaultClass. This widget has several key bindings and their associated signals. This section describes the available key binding signals.

	-- TODO: Eiffellize Example 4. GtkFileChooser key binding example

	-- The default keys that activate the key-binding signals in GtkFileChooserDefaultClass are as follows:
	-- Signal name 	Default key combinations
	-- location-popup 	Control-L; /
	-- up-folder 	Alt-Up[a] ; Backspace
	-- down-folder 	Alt-Down
	-- home-folder 	Alt-Home

	-- [a] Both the individual Up key and the numeric keypad's Up key are supported.

	-- You can change these defaults to something else. For example, to add a Shift modifier to a few of the default bindings, you can include the following fragment in your .gtkrc-2.0 file:

	-- binding "my-own-gtkfilechooser-bindings" {
	-- 	bind "<Alt><Shift>Up" {
	-- 		"up-folder" ()
	-- 	}
	-- 	bind "<Alt><Shift>Down" {
	-- 		"down-folder" ()
	-- 	}
	-- 	bind "<Alt><Shift>Home" {
	-- 		"home-folder" ()
	-- 	}
	-- }
	
	-- class "GtkFileChooserDefault" binding "my-own-gtkfilechooser-bindings"
	
	
	-- The "GtkFileChooserDefault::location-popup" signal
	
	--           void user_function (GtkFileChooserDefault
	--           *chooser, const char *path, gpointer user_data);
	
	
	-- This is used to make the file chooser show a "Location" dialog which the user can use to manually type the name of the file he wishes to select. The path argument is a string that gets put in the text entry for the file name. By default this is bound to Control-L with a path string of "" (the empty string); it is also bound to / with a path string of "/" (a slash): this lets you type / and immediately type a path name.
	-- chooser : 	the object which received the signal.
	-- path : 	default contents for the text entry for the file name
	-- user_data : 	user data set when the signal handler was connected.
	-- Tip
	
	-- You can create your own bindings for the location-popup
	-- signal with custom path strings, and have a crude form of
	-- easily-to-type bookmarks. For example, say you access the
	-- path /home/username/misc very frequently. You could then
	-- create an Alt-M shortcut by including the following in
	-- your .gtkrc-2.0:

	-- binding "misc-shortcut" {
	-- 	bind "<Alt>M" {
	-- 		"location-popup" ("/home/username/misc")
	-- 	}
	-- }
	
	-- class "GtkFileChooserDefault" binding "misc-shortcut"
	

	-- The "GtkFileChooserDefault::up-folder" signal
	
	--           void user_function (GtkFileChooserDefault
	--           *chooser, gpointer user_data);
	
	
	-- This is used to make the file chooser go to the parent of the current folder in the file hierarchy. By default this is bound to Backspace and Alt-Up (the Up key in the numeric keypad also works).
	-- chooser : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "GtkFileChooserDefault::down-folder" signal
	
	--           void user_function (GtkFileChooserDefault *chooser,
	--                               gpointer user_data);
	
	
	-- This is used to make the file chooser go to a child of the current folder in the file hierarchy. The subfolder that will be used is displayed in the path bar widget of the file chooser. For example, if the path bar is showing "/foo/bar/baz", then this will cause the file chooser to switch to the "baz" subfolder. By default this is bound to Alt-Down (the Down key in the numeric keypad also works).
	-- chooser : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "GtkFileChooserDefault::home-folder" signal
	
	--           void user_function (GtkFileChooserDefault *chooser,
	--                               gpointer user_data);
	
	
	-- This is used to make the file chooser show the user's home folder in the file list. By default this is bound to Alt-Home (the Home key in the numeric keypad also works).
	-- chooser : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.

inherit
	-- "Prerequisites: GtkFileChooser requires GtkWidget." IMHO this
	-- means that GTK_FILE_CHOOSER is a
	GTK_WIDGET 
		-- Known Implementations: GtkFileChooser is implemented by
		-- GtkFileChooserWidget, GtkFileChooserButton and
		-- GtkFileChooserDialog.
insert
	GTK_FILE_CHOOSER_EXTERNALS
	GTK_FILE_CHOOSER_CONFIRMATION
	GTK_FILE_CHOOSER_ERROR
	GTK_FILE_CHOOSER_ACTION
		-- Here this renaming is not useful; BTW, it produce incorrect code into GTK_FILE_CHOOSER's heirs
		-- 		rename
		-- 			gtk_file_chooser_action_open as open_action,
		-- 			gtk_file_chooser_action_save as save_action,
		-- 			gtk_file_chooser_action_select_folder as select_folder_action,
		-- 			gtk_file_chooser_action_create_folder as create_folder_action,
		-- 			is_valid_gtk_file_chooser_action	as is_valid_gtk_action
		-- 		end

feature {ANY} -- Actions

	set_open_action
			-- Set open mode. The file chooser will only let the user
			-- pick an existing file.
		do
			gtk_file_chooser_set_action (handle,gtk_file_chooser_action_open)
		end

	set_save_action
			-- Set save mode. The file chooser will let the user pick an
			-- existing file, or type in a new filename.
		do
			gtk_file_chooser_set_action (handle,gtk_file_chooser_action_save)
		end

	set_select_folder_action
			-- Select open mode for selecting folders. The file chooser
			-- will let the user pick an existing folder.
		do
			gtk_file_chooser_set_action (handle,gtk_file_chooser_action_select_folder)
		end

	set_create_folder_action
			-- Select a mode to create a new folder. The file chooser
			-- will let the user name an existing or new folder.
		do
			gtk_file_chooser_set_action (handle,gtk_file_chooser_action_create_folder)
		end

	-- GETTERS
	is_action_open: BOOLEAN
			-- Set open mode. The file chooser will only let the user
			-- pick an existing file.
		do
			Result := (gtk_file_chooser_get_action(handle)=gtk_file_chooser_action_open)
		end

	is_action_save: BOOLEAN
			-- Set save mode. The file chooser will let the user pick an
			-- existing file, or type in a new filename.
		do
			Result := (gtk_file_chooser_get_action(handle)=gtk_file_chooser_action_save)
		end

	is_action_select_folder: BOOLEAN
			-- Select open mode for selecting folders. The file chooser
			-- will let the user pick an existing folder.
		do
			Result := (gtk_file_chooser_get_action(handle)=gtk_file_chooser_action_select_folder)
		end

	is_action_create_folder: BOOLEAN
			-- Select a mode to create a new folder. The file chooser
			-- will let the user name an existing or new folder.
		do
			Result := (gtk_file_chooser_get_action(handle)=gtk_file_chooser_action_create_folder)
		end
	
feature {ANY} -- Locality
	set_local_only
			-- Makes only local files selectable in the file
			-- selector. The selected file are files are guaranteed to be
			-- accessible through the operating systems native file file
			-- system and therefore the application only needs to worry
			-- about the filename functions in GTK_FILE_CHOOSER, like
			-- GTK_FILE_CHOOSER.filename, rather than the URI functions
			-- like GTK_FILE_CHOOSER.uri
		do
			gtk_file_chooser_set_local_only (handle,1)
		ensure is_local_only
		end

	unset_local_only
			-- Makes non-local files selectable in the file selector.
		do
			gtk_file_chooser_set_local_only (handle,0)
		ensure not is_local_only
		end

	is_local_only: BOOLEAN
			-- Are only local files selectable in the file selector?. See `set_local_only'
		do
			Result:=(gtk_file_chooser_get_local_only (handle)).to_boolean
		end
	
feature {ANY} -- Multiple selections
	allow_multiple_selections
			-- Makes multiple files selectable in the file selector. This
			-- is only relevant if `is_open_action' or
			-- `is_save_action'. It cannot be set with either of the
			-- folder actions (i.e.: if either `is_action_select_folder'
			-- or `is_action_create_folder' are True)
		require no_folder_actions: not (is_action_select_folder or is_action_create_folder)
		do
			gtk_file_chooser_set_select_multiple (handle, 1)
		ensure are_multiple_selection_allowed
		end

	forbid_multiple_selections
			-- Makes multiple files not selectable in the file selector.
		do
			gtk_file_chooser_set_select_multiple (handle, 0)
		ensure not are_multiple_selection_allowed
		end

	are_multiple_selection_allowed: BOOLEAN
			-- Are multiple files can be selected in the file selector?
		do
			Result := (gtk_file_chooser_get_select_multiple(handle)).to_boolean
		end

feature {ANY} -- Hidden files handling
	show_hidden
			-- Make hidden files and folders displayed in the file
			-- selector.
		do
			gtk_file_chooser_set_show_hidden (handle,1)
		end

	hide_hidden
			-- Make hidden files and folders not displayed in the file
			-- selector.
		do
			gtk_file_chooser_set_show_hidden (handle,0)
		end

	are_hidden_shown: BOOLEAN
			-- Are hidden files and folders displayed in the file
			-- selector? See `GTK_FILE_CHOOSER.show_hidden'.
		do
			Result:=(gtk_file_chooser_get_show_hidden(handle)).to_boolean
		end

feature {ANY} -- Overwrite confirmation
	set_overwrite_confirmation
			-- Makes a file chooser in GTK_FILE_CHOOSER_ACTION_SAVE mode
			-- present a confirmation dialog if the user types a file
			-- name that already exists.  Regardless of this setting, the
			-- chooser will emit the "confirm-overwrite" signal when
			-- appropriate. If all you need is the stock confirmation
			-- dialog, set this property. You can override the way
			-- confirmation is done by actually handling the
			-- "confirm-overwrite" signal; please refer to its
			-- documentation for the details.
		do
			gtk_file_chooser_set_do_overwrite_confirmation (handle, 1)
		ensure shall_overwrite_be_confirmed
		end

	unset_overwrite_confirmation
			-- Makes a file chooser in GTK_FILE_CHOOSER_ACTION_SAVE mode
			-- present a confirmation dialog if the user types a file
			-- name that already exists.  Regardless of this setting, the
			-- chooser will emit the "confirm-overwrite" signal when
			-- appropriate. If all you need is the stock confirmation
			-- dialog, set this property. You can override the way
			-- confirmation is done by actually handling the
			-- "confirm-overwrite" signal; please refer to its
			-- documentation for the details.
		do
			gtk_file_chooser_set_do_overwrite_confirmation (handle, 0)
		ensure not shall_overwrite_be_confirmed
		end
	
	shall_overwrite_be_confirmed: BOOLEAN
			-- Is a file chooser set to confirm for overwriting when the
			-- user types a file name that already exists? Note: this
			-- query wraps C's
			-- `gtk_file_chooser_get_do_overwrite_confirmation' 
		do
			Result:=(gtk_file_chooser_get_do_overwrite_confirmation (handle)).to_boolean
		end

feature {ANY} -- Name, filenames and uris
	filename: STRING
			-- The filename for the currently selected file in the file
			-- selector. If multiple files are selected, one of the
			-- filenames will be returned at random. If the file chooser
			-- is in folder mode, this function returns the selected
			-- folder.
		local ptr: POINTER
		do
			ptr := gtk_file_chooser_get_filename(handle)
			-- Returns : The currently selected filename, or NULL if no
			-- file is selected, or the selected file can't be
			-- represented with a local filename. Free with g_free().
			if ptr.is_not_null
			then create Result.from_external(ptr)
			-- else check Result=Void end
			end
		end

	set_current_name (a_name: STRING)
			-- Sets the current name in the file selector, as if entered
			-- by the user. Note that the name passed in here is a UTF-8
			-- string rather than a filename. This function is meant for
			-- such uses as a suggested name in a "Save As..." dialog.
			
			-- If you want to preselect a particular existing file, you
			-- should use `GTK_FILE_CHOOSER.set_filename' or
			-- `GTK_FILE_CHOOSER.set_uri' instead. Please see the
			-- documentation for those functions for an example of using
			-- gtk_file_chooser_set_current_name() as well.
			
			-- TODO: `a_name' should be UNICODE_STRING: the filename to
			-- use, as a UTF-8 string
		require a_name /= Void
		do
			gtk_file_chooser_set_current_name (handle, a_name.to_external)
		end

	is_last_action_successful: BOOLEAN
			-- Returns : 	TRUE if both the folder could be changed and the file was selected successfully, FALSE otherwise.

	set_filename (a_filename: STRING)
			-- Sets filename as the current filename for the file
			-- chooser, by changing to the file's parent folder and
			-- actually selecting the file in list. If the chooser is in
			-- GTK_FILE_CHOOSER_ACTION_SAVE mode, the file's base name
			-- will also appear in the dialog's file name entry.

			-- If the file name isn't in the current folder of chooser,
			-- then the current folder of chooser will be changed to the
			-- folder containing filename. This is equivalent to a
			-- sequence of `unselect_all' followed by `select_filename'.

			-- Note that the file must exist, or nothing will be done
			-- except for the directory change.

			-- If you are implementing a File/Save As... dialog, you
			-- should use this function if you already have a file name
			-- to which the user may save; for example, when the user
			-- opens an existing file and then does File/Save As... on
			-- it. If you don't have a file name already -- for example,
			-- if the user just created a new file and is saving it for
			-- the first time, do not call this function. Instead, use
			-- something similar to this: TODO Eiffelize this

			-- if (document_is_new) -- { /* the user just created a new
			-- document */ gtk_file_chooser_set_current_folder (chooser,
			-- default_folder_for_saving);
			-- gtk_file_chooser_set_current_name (chooser, "Untitled
			-- document"); -- } -- else -- { /* the user edited an
			-- existing document */ gtk_file_chooser_set_filename
			-- (chooser, existing_filename); -- }

			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise.
		require valid_filename: a_filename/=Void
		do
			is_last_action_successful := (gtk_file_chooser_set_filename (handle, a_filename.to_external)).to_boolean
		end

	select_filename (a_filename: STRING)
			-- Selects `a_filename'. If the file name isn't in the
			-- current folder of chooser, then the current folder of
			-- chooser will be changed to the folder containing filename.
			
			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise.
		require valid_filename: a_filename/=Void
		do
			is_last_action_successful := (gtk_file_chooser_select_filename (handle, a_filename.to_external)).to_boolean
		end

	unselect_filename (a_filename: STRING)
			-- Unselects a currently selected filename. If the `a_filename'
			-- is not in the current directory, does not exist, or is
			-- otherwise not currently selected, does nothing.
		require valid_filename: a_filename/=Void
		do
			gtk_file_chooser_unselect_filename (handle, a_filename.to_external)
		end

	select_all
			-- Selects all the files in the current folder of a file
			-- chooser.
		do
			gtk_file_chooser_select_all (handle)
		end

	unselect_all
			-- Unselects all the files in the current folder of a file
			-- chooser.
		do
			gtk_file_chooser_unselect_all (handle)
		end

	filenames: G_SLIST_STRING
			-- all the selected files and subfolders in the current
			-- folder of chooser. The names are full absolute paths. If
			-- files in the current folder cannot be represented as local
			-- filenames they will be ignored. (See `uris')
		do
			create Result.from_external_pointer (gtk_file_chooser_get_filenames (handle))
			-- TODO: the GSList returned contains the filenames of all
			-- selected files and subfolders in the current folder. Free
			-- the returned list with g_slist_free(), and the filenames
			-- with g_free().
		end

	set_current_folder (a_folder_name: STRING)
			-- Sets the current folder for chooser from a local
			-- filename. The user will be shown the full contents of the
			-- current folder, plus user interface elements for
			-- navigating to other folders. `a_folder_name' is the full
			-- path of the new current folder.

			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise.
		require valid_folder_name: a_folder_name/=Void
		do
			is_last_action_successful := (gtk_file_chooser_set_current_folder(handle,
													a_folder_name.to_external)).to_boolean
		end

	current_folder: STRING
			-- the current folder of chooser as a local filename. See
			-- `set_current_folder'. Void if the current path cannot be
			-- represented as a local filename
		local ptr: POINTER
		do
			ptr := gtk_file_chooser_get_current_folder (handle)
			-- ptr is the (gchar *) the full path of the current folder,
			-- or NULL if the current path cannot be represented as a
			-- local filename. Free with g_free().
			if ptr.is_not_null
			then create Result.from_external (ptr)
			--else check Result=Void end
			end
		end

	uri: STRING
			-- the URI for the currently selected file in the file
			-- selector. If multiple files are selected, one of the
			-- filenames will be returned at random. If the file chooser
			-- is in folder mode, this function returns the selected
			-- folder. Void if no file is selected
		local ptr: POINTER
		do
			ptr := gtk_file_chooser_get_uri (handle)
			if ptr.is_not_null
			then create Result.from_external (ptr)
			--else check Result=Void end
			end
		end

	set_uri (an_uri: STRING)
			-- Sets the file referred to by `an_uri' as the current file
			-- for the file chooser, by changing to the URI's parent
			-- folder and actually selecting the URI in the list. If the
			-- chooser `is_action_save' mode, the URI's base name will
			-- also appear in the dialog's file name entry.

			-- If `an_uri' isn't in the current folder of chooser, then
			-- the current folder of chooser will be changed to the
			-- folder containing uri. This is equivalent to a sequence of
			-- `unselect_all' followed by `select_uri'.

			-- Note that the URI must exist, or nothing will be done
			-- except for the directory change. If you are implementing a
			-- File/Save As... dialog, you should use this function if
			-- you already have a file name to which the user may save;
			-- for example, when the user opens an existing file and then
			-- does File/Save As... on it. If you don't have a file name
			-- already -- for example, if the user just created a new
			-- file and is saving it for the first time, do not call this
			-- function. Instead, use something similar to this:

			-- if (document_is_new) { /* the user just created a new
			-- document */ gtk_file_chooser_set_current_folder_uri
			-- (chooser, default_folder_for_saving);
			-- gtk_file_chooser_set_current_name (chooser, "Untitled
			-- document"); } else { /* the user edited an existing
			-- document */ gtk_file_chooser_set_uri (chooser,
			-- existing_uri); }

			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise.
		require valid_uri: an_uri/=Void
		do
			is_last_action_successful := (gtk_file_chooser_set_uri (handle,an_uri.to_external)).to_boolean
		end

	select_uri (an_uri: STRING)
			-- Selects the file to by `an_uri'. If `an_uri' doesn't refer
			-- to a file in the current folder of chooser, then the
			-- current folder of chooser will be changed to the folder
			-- containing filename.
			
			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise.
		require valid_uri: an_uri/=Void
		do
			is_last_action_successful:=(gtk_file_chooser_select_uri(handle,an_uri.to_external)).to_boolean
		end

	unselect_uri (an_uri: STRING)
			-- Unselects the file referred to by `an_uri'. If the file is
			-- not in the current directory, does not exist, or is
			-- otherwise not currently selected, does nothing.
		require valid_uri: an_uri/=Void
		do
			gtk_file_chooser_unselect_uri (handle, an_uri.to_external)
		end

	uris: G_SLIST_STRING
			-- selected files and subfolders in the current folder of
			-- chooser. The names are full absolute URIs.
		do
			create Result.from_external_pointer (gtk_file_chooser_get_uris (handle))
		ensure uri_not_void: Result/=Void
		end

	set_current_folder_uri (an_uri: STRING)
			-- Sets the current folder for chooser from `an_uri'. The user
			-- will be shown the full contents of the current folder, plus
			-- user interface elements for navigating to other folders.

			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise.
		require valid_uri: an_uri /= Void
		do
			is_last_action_successful:=(gtk_file_chooser_set_current_folder_uri (handle, an_uri.to_external)).to_boolean
		end

	get_current_folder_uri: STRING
			-- the current folder of chooser as an
			-- URI. `set_current_folder_uri'. Can be Void if the file
			-- chooser was unable to load the last folder that was
			-- requested from it; for example, as would be for calling
			-- `set_current_folder_uri' on a nonexistent folder.
		local ptr: POINTER
		do
			-- TODO: when creating a string shall we use from_external or from_external_copy
			ptr := gtk_file_chooser_get_current_folder_uri(handle)
			if ptr.is_not_null
			then create Result.from_external (ptr) -- TODO: this assumes that STRING calls g_free
			end
		end

feature {ANY} -- Preview
	set_preview_widget (a_widget: GTK_WIDGET)
			-- Sets an application-supplied widget to use to display a
			-- custom preview of the currently selected file. To
			-- implement a preview, after setting the preview widget, you
			-- connect to the `::update-preview' signal, and call
			-- `preview_filename' or `preview_uri' on each change. If you
			-- can display a preview of the new file, update your widget
			-- and set the preview active using
			-- `set_preview_widget_active'. Otherwise, set the preview
			-- inactive.

			-- When there is no application-supplied preview widget, or
			-- the application-supplied preview widget is not active, the
			-- file chooser may display an internally generated preview
			-- of the current file or it may display no preview at all.
		require valid_widget: a_widget/=Void
		do
			gtk_file_chooser_set_preview_widget (handle, a_widget.handle)
		end

	preview_widget: GTK_WIDGET
			-- the current preview widget; can be Void; see `set_preview_widget'.
		local factory: G_OBJECT_FACTORY [GTK_WIDGET]
		do
			Result := factory.wrapper_or_void (gtk_file_chooser_get_preview_widget(handle))
		end

	set_preview_widget_active
			-- Show the preview widget set by `set_preview_widget'. See
			-- `set_preview_widget' for more details.
		do
			gtk_file_chooser_set_preview_widget_active (handle,1)
		end

	set_preview_widget_inactive
			-- Hide the preview widget set by `set_preview_widget'. The
			-- file chooser may display an internally generated preview
			-- of the current file or it may display no preview at
			-- all. See `set_preview_widget' for more details.
		do
			gtk_file_chooser_set_preview_widget_active (handle,1)
		end

	is_preview_widget_active: BOOLEAN
			-- Is the preview widget set by `set_preview_widget' shown
			-- for the current filename. See `set_preview_widget_active'.
		do
			Result:=(gtk_file_chooser_get_preview_widget_active(handle)).to_boolean
		end

	use_preview_label
			-- Makes the file chooser display a stock label with the name
			-- of the file that is being previewed; the default is
			-- True. Applications that want to draw the whole preview
			-- area themselves should set this to False and display the
			-- name themselves in their preview widget.

			-- See also: `set_preview_widget'
		do
			gtk_file_chooser_set_use_preview_label (handle,1)
		ensure is_preview_label_used
		end
	
	use_no_preview_label
			-- Remove from the file chooser the stock label with the name
			-- of the file that is being previewed; applications that want to draw the whole preview
			-- area themselves should call this feature and display the
			-- name themselves in their preview widget.

			-- See also: `set_preview_widget'
		do
			gtk_file_chooser_set_use_preview_label (handle,0)
		ensure not is_preview_label_used
		end
	
	is_preview_label_used: BOOLEAN
			-- Is a stock label drawn with the name of the previewed
			-- file? See `use_preview_label'.
		do
			Result:=gtk_file_chooser_get_use_preview_label(handle).to_boolean
		end

	preview_filename: STRING
			-- the filename that should be previewed in a custom preview
			-- widget. See `set_preview_widget'. Can be Void if no file
			-- is selected, or if the selected file cannot be represented
			-- as a local filename.
		local cstr: POINTER
		do
			cstr:=gtk_file_chooser_get_preview_filename (handle)
			if cstr.is_not_null then
				create Result.from_external (cstr)
				-- Free with g_free()
			end
		end

	preview_uri: STRING
			-- the URI that should be previewed in a custom preview
			-- widget. See `set_preview_widget'. Can be Void if no file
			-- is selected.
		
		local cstr: POINTER
		do
			cstr:=gtk_file_chooser_get_preview_uri(handle)
			if cstr.is_not_null then
				create Result.from_external (cstr)
				-- TODO: Free with g_free()
			end
		end

feature {ANY} -- Extra widget
	set_extra_widget (a_widget: GTK_WIDGET)
			-- Sets an application-supplied widget to provide extra
			-- options to the user.
		require valid_widget: a_widget/=Void
		do
			gtk_file_chooser_set_extra_widget (handle, a_widget.handle)
		end

	extra_widget: GTK_WIDGET
			-- the current preview widget; see `set_extra_widget'. Can be Void
		local widget_ptr: POINTER
		do
			widget_ptr := gtk_file_chooser_get_extra_widget(handle)
			if widget_ptr.is_not_null
			then
				-- retrieve the Eiffel object stored as a pointer with the key `eiffel_key_label'
				not_yet_implemented
			end
		end

feature {ANY} -- Filters
	add_filter (a_filter: GTK_FILE_FILTER)
			-- Adds `a_filter' to the list of filters that the user can
			-- select between. When a filter is selected, only files that
			-- are passed by that filter are displayed.

			-- TODO: Eiffelize this: Note that the chooser takes ownership of the filter, so
			-- you have to ref and sink it if you want to keep a
			-- reference.
		require valid_filter: a_filter /= Void
		do
			gtk_file_chooser_add_filter (handle, a_filter.handle)
		end

	remove_filter (a_filter: GTK_FILE_FILTER)
			-- Removes `a_filter' from the list of filters that the user
			-- can select between.
		require valid_filter: a_filter /= Void
		do
			gtk_file_chooser_remove_filter  (handle, a_filter.handle)
		end

	filters: G_SLIST [GTK_FILE_FILTER]
			-- The current set of user-selectable filters; see `add_filter', `remove_filter'.		
		do
			create {G_OBJECT_SLIST [GTK_FILE_FILTER]} 
			Result.from_external_pointer (gtk_file_chooser_list_filters (handle))
		end

	set_filter  (a_filter: GTK_FILE_FILTER)
			-- Sets the current filter; only the files that pass the
			-- filter will be displayed. If the user-selectable list of
			-- filters is non-empty, then the filter should be one of the
			-- filters in that list. Setting the current filter when the
			-- list of filters is empty is useful if you want to restrict
			-- the displayed set of files without letting the user change
			-- it.
		require
			valid_filter: a_filter /= Void
			-- TODO: The following should implement the manifest
			-- precondition "If the user-selectable list of filters is
			-- non-empty, then the filter should be one of the filters in
			-- that list."
			filter_is_in_filters: (not filters.is_empty) implies filters.has (a_filter)
		do
			gtk_file_chooser_set_filter (handle, a_filter.handle)
		end


	filter: GTK_FILE_FILTER
			-- The current filter; can be Void
		local filter_ptr: POINTER
		do
			filter_ptr := gtk_file_chooser_get_filter (handle)
			if filter_ptr.is_not_null
			then create Result.from_external_pointer (filter_ptr)
			end
		end

feature {ANY} -- Shortcuts folders
	add_shortcut_folder (a_folder: STRING)
			-- Adds a folder to be displayed with the shortcut folders in
			-- a file chooser. Note that shortcut folders do not get
			-- saved, as they are provided by the application. For
			-- example, you can use this to add a
			-- "/usr/share/mydrawprogram/Clipart" folder to the volume
			-- list.

			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise. In that case (TODO)
			-- `last_error' will be filled with the cause
		require valid_folder: a_folder /= Void
		do
			-- chooser : 	a GtkFileChooser
			-- folder : 	filename of the folder to add
			-- error : 	location to store error, or NULL
			-- Returns : 	TRUE if the folder could be added successfully, FALSE otherwise. In the latter case, the error will be set as appropriate.

			-- TODO: Create G_ERROR
			is_last_action_successful := gtk_file_chooser_add_shortcut_folder (handle,
																									 a_folder.to_external,
																									 default_pointer -- TODO: it will be last_error.handle when G_ERROR exists
																									).to_boolean
		end

	remove_shortcut_folder (a_folder: STRING)
			-- Removes `a_folder' from a file chooser's list of shortcut
			-- folders.
			
			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise. In that case (TODO)
			-- `last_error' will be filled with the cause
		require valid_folder: a_folder /= Void
		do
			is_last_action_successful := gtk_file_chooser_remove_shortcut_folder (handle,
																										 a_folder.to_external,
																										 default_pointer -- TODO: it will be last_error.handle when G_ERROR exists
																										 ).to_boolean
		end

	shortcut_folders: G_SLIST_STRING
			-- The list of shortcut folders in the file chooser, as set
			-- by `add_shortcut_folder'.

			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise. In that case (TODO)
			-- `last_error' will be filled with the cause
		local folders_ptr: POINTER
		do
			folders_ptr := gtk_file_chooser_list_shortcut_folders (handle)
			if folders_ptr.is_not_null
			then create Result.from_external_pointer (folders_ptr)
				-- TODO: handle this peculiar memory management: . Free
				-- the returned list with g_slist_free(), and the
				-- filenames with g_free().
			end
		end

	add_shortcut_folder_uri (an_uri: STRING)
			-- Adds a folder URI to be displayed with the shortcut
			-- folders in a file chooser. Note that shortcut folders do
			-- not get saved, as they are provided by the
			-- application. For example, you can use this to add a
			-- "file:///usr/share/mydrawprogram/Clipart" folder to the
			-- volume list.
			
			-- `is_last_action_successful' will be True if both the
			-- folder could be changed and the file was selected
			-- successfully, False otherwise. In that case (TODO)
			-- `last_error' will be filled with the cause
		require valid_uri: an_uri /= Void
		do
			is_last_action_successful := ( gtk_file_chooser_add_shortcut_folder_uri
													 (handle, an_uri.to_external,
													  default_pointer -- TODO: it will be last_error.handle when G_ERROR exists
													  ).to_boolean )
		end

	remove_shortcut_folder_uri  (an_uri: STRING)
			-- Removes a folder URI from a file chooser's list of
			-- shortcut folders.
		require valid_uri: an_uri /= Void
		do
			is_last_action_successful := ( gtk_file_chooser_remove_shortcut_folder_uri
													 (handle, an_uri.to_external,
													  default_pointer -- TODO: it will be last_error.handle when G_ERROR exists
													  ).to_boolean )
		end

	shortcut_folder_uris: G_SLIST_STRING
			--  The list of shortcut folders in the file chooser, as set by `add_shortcut_folder_uri'.
		local a_gslist: POINTER
		do
			a_gslist := gtk_file_chooser_list_shortcut_folder_uris (handle)
			if a_gslist.is_not_null
			then create Result.from_external_pointer (a_gslist)
				-- TODO: handle this peculiar memory management: Free the
				-- returned list with g_slist_free(), and the URIs with
				-- g_free().
			end
		end
	
-- Property Details
-- The "action" property

--   "action"               GtkFileChooserAction  : Read / Write

-- The type of operation that the file selector is performing.

-- Default value: GTK_FILE_CHOOSER_ACTION_OPEN
-- The "do-overwrite-confirmation" property

--   "do-overwrite-confirmation" gboolean              : Read / Write

-- Whether a file chooser in GTK_FILE_CHOOSER_ACTION_SAVE will present an overwrite confirmation dialog if the user selects a file name that already exists.

-- Default value: FALSE

-- Since 2.8
-- The "extra-widget" property

--   "extra-widget"         GtkWidget             : Read / Write

-- Application supplied widget for extra options.
-- The "file-system-backend" property

--   "file-system-backend"  gchararray            : Write / Construct Only

-- Name of file system backend to use.

-- Default value: NULL
-- The "filter" property

--   "filter"               GtkFileFilter         : Read / Write

-- The current filter for selecting which files are displayed.
-- The "local-only" property

--   "local-only"           gboolean              : Read / Write

-- Whether the selected file(s) should be limited to local file: URLs.

-- Default value: TRUE
-- The "preview-widget" property

--   "preview-widget"       GtkWidget             : Read / Write

-- Application supplied widget for custom previews.
-- The "preview-widget-active" property

--   "preview-widget-active" gboolean              : Read / Write

-- Whether the application supplied widget for custom previews should be shown.

-- Default value: TRUE
-- The "select-multiple" property

--   "select-multiple"      gboolean              : Read / Write

-- Whether to allow multiple files to be selected.

-- Default value: FALSE
-- The "show-hidden" property

--   "show-hidden"          gboolean              : Read / Write

-- Whether the hidden files and folders should be displayed.

-- Default value: FALSE
-- The "use-preview-label" property

--   "use-preview-label"    gboolean              : Read / Write

-- Whether to display a stock label with the name of the previewed file.

-- Default value: TRUE
-- Signal Details
-- The "confirm-overwrite" signal

-- GtkFileChooserConfirmationuser_function                  (GtkFileChooser *filechooser,
--                                             gpointer user_data);

-- This signal gets emitted whenever it is appropriate to present a confirmation dialog when the user has selected a file name that already exists. The signal only gets emitted when the file chooser is in GTK_FILE_CHOOSER_ACTION_SAVE mode.

-- Most applications just need to turn on the do-overwrite-confirmation property (or call the gtk_file_chooser_set_do_overwrite_confirmation() function), and they will automatically get a stock confirmation dialog. Applications which need to customize this behavior should do that, and also connect to the confirm-overwrite signal.

-- A signal handler for this signal must return a GtkFileChooserConfirmation value, which indicates the action to take. If the handler determines that the user wants to select a different filename, it should return GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN. If it determines that the user is satisfied with his choice of file name, it should return GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME. On the other hand, if it determines that the stock confirmation dialog should be used, it should return GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM. The following example illustrates this.

-- Example 5. Custom confirmation

-- static GtkFileChooserConfirmation
-- confirm_overwrite_callback (GtkFileChooser *chooser, gpointer data)
-- {
--   char *uri;

--   uri = gtk_file_chooser_get_uri (chooser);

--   if (is_uri_read_only (uri))
--     {
--       if (user_wants_to_replace_read_only_file (uri))
--         return GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME;
--       else
--         return GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN;
--     } else
--       return GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM; /* fall back to the default dialog */
-- }

-- ...

-- chooser = gtk_file_chooser_dialog_new (...);

-- gtk_file_chooser_set_do_overwrite_confirmation (GTK_FILE_CHOOSER (dialog), TRUE);
-- g_signal_connect (chooser, "confirm-overwrite",
--                   G_CALLBACK (confirm_overwrite_callback), NULL);

-- if (gtk_dialog_run (chooser) == GTK_RESPONSE_ACCEPT)
--         save_to_file (gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (chooser));

-- gtk_widget_destroy (chooser);


-- filechooser : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	GtkFileChooserConfirmation value that indicates which action to take after emitting the signal.

-- Since 2.8
-- The "current-folder-changed" signal

-- void        user_function                  (GtkFileChooser *chooser,
--                                             gpointer user_data);

-- This signal is emitted when the current folder in a GtkFileChooser changes. This can happen due to the user performing some action that changes folders, such as selecting a bookmark or visiting a folder on the file list. It can also happen as a result of calling a function to explicitly change the current folder in a file chooser.

-- Normally you do not need to connect to this signal, unless you need to keep track of which folder a file chooser is showing.

-- See also: gtk_file_chooser_set_current_folder(), gtk_file_chooser_get_current_folder(), gtk_file_chooser_set_current_folder_uri(), gtk_file_chooser_get_current_folder_uri().

-- chooser : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.

feature {ANY} -- The "file-activated" signal

		-- This signal is emitted when the user "activates" a file in
		-- the file chooser. This can happen by double-clicking on a file
		-- in the file list, or by pressing Enter.

		-- Normally you do not need to connect to this signal. It is
		-- used internally by GtkFileChooserDialog to know when to activate
		-- the default button in the dialog.

	file_activated_signal_name: STRING is "file-activated"
		-- void        user_function                  (GtkFileChooser *chooser,
		--                                             gpointer user_data);

	enable_on_file_activated
			-- Connects "file-activated" signal to `on_file_activated' feature.
		do
			connect (Current, file_activated_signal_name, $on_file_activated)
		end

	on_file_activated
		do
		end

	connect_agent_to_file_activated_signal (a_procedure: PROCEDURE [ANY, TUPLE [GTK_FILE_CHOOSER]])
			-- chooser : 	the object which received the signal.
		require
			valid_procedure: a_procedure /= Void
		local
			file_activated_callback: FILE_ACTIVATED_CALLBACK
		do
			create file_activated_callback.make
			file_activated_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "selection-changed" signal

			-- This signal is emitted when there is a change in the set of selected
			-- files in a GtkFileChooser. This can happen when the user modifies the
			-- selection with the mouse or the keyboard, or when explicitly calling
			-- functions to change the selection.

			-- Normally you do not need to connect to this signal, as it is easier
			-- to wait for the file chooser to finish running, and then to get the list
			-- of selected files using the functions mentioned below.

			-- See also: gtk_file_chooser_select_filename(),
			-- gtk_file_chooser_unselect_filename(), gtk_file_chooser_get_filename(),
			-- gtk_file_chooser_get_filenames(), gtk_file_chooser_select_uri(),
			-- gtk_file_chooser_unselect_uri(), gtk_file_chooser_get_uri(),
			-- gtk_file_chooser_get_uris().

	selection_changed_signal_name: STRING is "selection-changed"

	enable_on_selection_changed
			-- Connects "selection-changed" signal to `on_selection_changed' feature.
		do
			connect (Current, selection_changed_signal_name, $on_selection_changed)
		end

	on_selection_changed
		do
		end

	connect_agent_to_selection_changed_signal (a_procedure: PROCEDURE [ANY, TUPLE [GTK_FILE_CHOOSER]])
			-- chooser : 	the object which received the signal.
		require
			valid_procedure: a_procedure /= Void
		local
			selection_changed_callback: SELECTION_CHANGED_CALLBACK
		do
			create selection_changed_callback.make
			selection_changed_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "update-preview" signal

		-- This signal is emitted when the preview in a file chooser should be
		-- regenerated. For example, this can happen when the currently selected
		-- file changes. You should use this signal if you want your file chooser
		-- to have a preview widget.
		
		-- Once you have installed a preview widget with
		-- gtk_file_chooser_set_preview_widget(), you should update it when this
		-- signal is emitted. You can use the functions
		-- gtk_file_chooser_get_preview_filename() or
		-- gtk_file_chooser_get_preview_uri() to get the name of the file to
		-- preview. Your widget may not be able to preview all kinds of files;
		-- your callback must call gtk_file_chooser_set_preview_wiget_active()
		-- to inform the file chooser about whether the preview was generated
		-- successfully or not.
		
		-- See also: gtk_file_chooser_set_preview_widget(),
		-- gtk_file_chooser_set_preview_widget_active(),
		-- gtk_file_chooser_set_use_preview_label(),
		-- gtk_file_chooser_get_preview_filename(),
		-- gtk_file_chooser_get_preview_uri().

	update_preview_signal_name: STRING is "update-preview"
		-- void user_function (GtkFileChooser *chooser, gpointer user_data);

	enable_on_update_preview
			-- Connects "update-preview" signal to `on_update_preview' feature.
		do
			connect (Current, update_preview_signal_name, $on_update_preview)
		end

	on_update_preview
		do
		end

	connect_agent_to_update_preview_signal (a_procedure: PROCEDURE [ANY, TUPLE [GTK_FILE_CHOOSER]])
			-- chooser: the object which received the signal.
		require
			valid_procedure: a_procedure /= Void
		local
			update_preview_callback: UPDATE_PREVIEW_CALLBACK
		do
			create update_preview_callback.make
			update_preview_callback.connect (Current, a_procedure)
		end

end
