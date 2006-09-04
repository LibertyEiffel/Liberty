indexing
	description: "Main loop and Events -  Library initialization, main event loop, and events"
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
	revision "$REvision:$"

	
class GTK_MAIN

inherit
	ANY redefine default_create end
	WRAPPER_HANDLER  redefine default_create end
insert
	ARGUMENTS redefine default_create end 
	GTK_MAIN_EXTERNALS redefine default_create end
	POINTER_HANDLING redefine default_create end
	
creation default_create

feature -- Creation
	default_create is
		do
			create error.empty
			initialize
		end
feature
	disable_setlocale is
			-- Prevents initilize_gtk and similar call (wrappers of
			-- gtk_init(), gtk_init_check(), gtk_init_with_args() and
			-- gtk_parse_args() from automatically calling setlocale
			-- (LC_ALL, ""). You would want to use this function if you
			-- wanted to set the locale for your program to something
			-- other than the user's locale, or if you wanted to set
			-- different values for different locale categories.

			-- Most programs should not need to call this function.
		do
			gtk_disable_setlocale
		end
	
	-- TODO: wrap gtk_get_default_language ()

	-- TODO: wrap gtk_parse_args ()

	initialize, initialize_gtk is
			-- Initialize everything needed to operate the GTK toolkit and parses
			-- some standard command line options. argc and argv are adjusted
			-- accordingly so your own code will never see those standard
			-- arguments.

			-- Note that there are some alternative ways to initialize GTK+: if you
			-- are calling gtk_parse_args(), gtk_init_check(), gtk_init_with_args()
			-- or g_option_context_parse() with the option group returned by
			-- gtk_get_option_group(), you don't have to call gtk_init().

			-- Note: This function will terminate your program if it was unable to
			-- initialize the GUI for some reason. If you want your program to fall
			-- back to a textual interface you want to call gtk_init_check()
			-- instead.
		local argc: INTEGER; argv: POINTER
		do
			if not is_initialized then 
				argc := argument_count
				argv := command_arguments.to_external
				gtk_init ($argc, $argv)
				is_initialized := True
			end
		ensure initialized: is_initialized = True
		end

	is_initialized: BOOLEAN
			-- Have gtk been successfully initilized?
	
	try_initilizing_gtk is
		-- Try initiliazing GTK toolkit. If successful
		-- `is_gtk_initialized' will be True.
		local argc: INTEGER; argv: POINTER
		do
			argc := argument_count
			argv := command_arguments.to_external
			is_initialized := gtk_init_check ($argc, $argv).to_boolean
		end
	
	-- TODO: wrap gtk_init_with_args ()

	are_events_pending: BOOLEAN is
			-- Are there any events pending? This can be used to update
			-- the GUI and invoke timeouts etc. while doing some time
			-- intensive computation.

			-- TODO: Eiffelize this example Updating the GUI during a
			-- long computation.

			-- computation going on
			-- ...
			--     from until not are_events_pendind
			-- 	 loop gtk_main_iteration 
			-- ...
			-- 	computation continued 
		do
			Result:=gtk_events_pending.to_boolean
		end

	run_main_loop, run_gtk_main_loop is
			-- Runs the main loop until (C function) gtk_main_quit() is
			-- called. You can nest calls to gtk_main(). In that case
			-- gtk_main_quit() will make the innermost invocation of the
			-- main loop return.
		require gtk_initialized: is_initialized
		do
			gtk_main
		end

	
	gtk_nesting_level: INTEGER is
		obsolete "use nesting level instead"
		do
			Result := nesting_level
		end
	
	nesting_level: INTEGER is
			-- the nesting level of the current invocation of the main
			-- loop. This can be useful when calling gtk_quit_add().
		do
			Result := gtk_main_level
		end

	gtk_quit is
		obsolete "use quit instead"
		do
			quit
		end
	
	quit is
			-- Makes the innermost invocation of the main loop return
			-- when it regains control.
		do
			gtk_main_quit
		end

	
	gtk_main_iteration is
		obsolete "use main_iteration"
		do
			main_iteration
		end
	
	main_iteration is
		-- Runs a single iteration of the mainloop. If no events are
		-- waiting to be processed GTK+ will block until the next event
		-- is noticed. If you don't want to block look at
		-- gtk_main_iteration_not_blocking or check if any events are pending
		-- with are_events_pending first.
		local called_on_innermost_mainloop: INTEGER
		do
			-- TODO: expose called_on_innermost_mainloop in an intelligent way
			called_on_innermost_mainloop:=gtk_main_iteration_external
		end

	gtk_main_iteration_not_blocking is
		obsolete "use not_blocking_main_iteration"
		do
			not_blocking_main_iteration
		end
	
	not_blocking_main_iteration is
		local called_on_innermost_mainloop: INTEGER
		do
			-- TODO: expose called_on_innermost_mainloop in an intelligent way
			called_on_innermost_mainloop:=gtk_main_iteration_do (0)
		end
	

	-- TODO: wrap gtk_main_do_event in a release distant in the
	-- future. Infact GTK documentation says "This is public only to
	-- allow filtering of events between GDK and GTK+. You will not
	-- usually need to call this function directly."
	
	-- GtkModuleInitFunc ()

	-- void        (*GtkModuleInitFunc)            (gint *argc,
	--                                              gchar ***argv);
	
	-- Each GTK+ module must have a function gtk_module_init() with this prototype. This function is called after loading the module with the argc and argv cleaned from any arguments that GTK+ handles itself.
	-- argc : 	Pointer to the number of arguments remaining after gtk_init().
	-- argv : 	Points to the argument vector.

	-- GtkModuleDisplayInitFunc ()
	
	-- void        (*GtkModuleDisplayInitFunc)     (GdkDisplay *display);
	


	-- void        gtk_grab_add                    (GtkWidget *widget);

	-- Makes widget the current grabbed widget. This means that interaction with other widgets in the same application is blocked and mouse as well as keyboard events are delivered to this widget.
	-- widget : 	The widget that grabs keyboard and pointer events.
	-- gtk_grab_get_current ()
	
	-- GtkWidget*  gtk_grab_get_current            (void);
	
	-- Queries the current grab of the default window group.
	-- Returns : 	The widget which currently has the grab or NULL if no grab is active.
	-- gtk_grab_remove ()
	
	-- void        gtk_grab_remove                 (GtkWidget *widget);

-- Removes the grab from the given widget. You have to pair calls to gtk_grab_add() and gtk_grab_remove().
-- widget : 	The widget which gives up the grab.
-- gtk_init_add ()

-- void        gtk_init_add                    (GtkFunction function,
--                                              gpointer data);

-- Registers a function to be called when the mainloop is started.
-- function : 	Function to invoke when gtk_main() is called next.
-- data : 	Data to pass to that function.
-- gtk_quit_add_destroy ()

-- void        gtk_quit_add_destroy            (guint main_level,
--                                              GtkObject *object);

-- Trigger destruction of object in case the mainloop at level main_level is quit.
-- main_level : 	Level of the mainloop which shall trigger the destruction.
-- object : 	Object to be destroyed.
-- gtk_quit_add ()

-- guint       gtk_quit_add                    (guint main_level,
--                                              GtkFunction function,
--                                              gpointer data);

-- Registers a function to be called when an instance of the mainloop is left.
-- main_level : 	Level at which termination the function shall be called. You can pass 0 here to have the function run at the termination of the current mainloop.
-- function : 	The function to call. This should return 0 to be removed from the list of quit handlers. Otherwise the function might be called again.
-- data : 	Pointer to pass when calling function.
-- Returns : 	A handle for this quit handler (you need this for gtk_quit_remove()) or 0 if you passed a NULL pointer in function.
-- gtk_quit_add_full ()

-- guint       gtk_quit_add_full               (guint main_level,
--                                              GtkFunction function,
--                                              GtkCallbackMarshal marshal,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy);

-- Registers a function to be called when an instance of the mainloop is left. In comparison to gtk_quit_add() this function adds the possibility to pass a marshaller and a function to be called when the quit handler is freed.

-- The former can be used to run interpreted code instead of a compilxfed function while the latter can be used to free the information stored in data (while you can do this in function as well)... So this function will mostly be used by GTK+ wrappers for languages other than C.
-- main_level : 	Level at which termination the function shall be called. You can pass 0 here to have the function run at the termination of the current mainloop.
-- function : 	The function to call. This should return 0 to be removed from the list of quit handlers. Otherwise the function might be called again.
-- marshal : 	The marshaller to be used. If this is non-NULL, function is ignored.
-- data : 	Pointer to pass when calling function.
-- destroy : 	Function to call to destruct data. Gets data as argument.
-- Returns : 	A handle for this quit handler (you need this for gtk_quit_remove()) or 0 if you passed a NULL pointer in function.
-- gtk_quit_remove ()

-- void        gtk_quit_remove                 (guint quit_handler_id);

-- Removes a quit handler by its identifier.
-- quit_handler_id : 	Identifier for the handler returned when installing it.
-- gtk_quit_remove_by_data ()

-- void        gtk_quit_remove_by_data         (gpointer data);

-- Removes a quit handler identified by its data field.
-- data : 	The pointer passed as data to gtk_quit_add() or gtk_quit_add_full().
-- gtk_timeout_add_full ()


-- gtk_key_snooper_install ()

-- guint       gtk_key_snooper_install         (GtkKeySnoopFunc snooper,
--                                              gpointer func_data);

-- Installs a key snooper function, which will get called on all key events before delivering them normally.
-- snooper : 	a GtkKeySnoopFunc.
-- func_data : 	data to pass to snooper.
-- Returns : 	a unique id for this key snooper for use with gtk_key_snooper_remove().

	-- GtkKeySnoopFunc ()

-- gint        (*GtkKeySnoopFunc)              (GtkWidget *grab_widget,
--                                              GdkEventKey *event,
--                                              gpointer func_data);

-- Key snooper functions are called before normal event delivery. They can be used to implement custom key event handling.
-- grab_widget : 	the widget to which the event will be delivered.
-- event : 	the key event.
-- func_data : 	the func_data supplied to gtk_key_snooper_install().
-- Returns : 	TRUE to stop further processing of event, FALSE to continue.
-- gtk_key_snooper_remove ()

-- void        gtk_key_snooper_remove          (guint snooper_handler_id);

-- Removes the key snooper function with the given id.
-- snooper_handler_id : 	Identifies the key snooper to remove.
-- gtk_get_current_event ()

-- GdkEvent*   gtk_get_current_event           (void);

-- Obtains a copy of the event currently being processed by GTK+. For example, if you get a "clicked" signal from GtkButton, the current event will be the GdkEventButton that triggered the "clicked" signal. The returned event must be freed with gdk_event_free(). If there is no current event, the function returns NULL.

-- Returns : 	a copy of the current event, or NULL if no current event.
-- gtk_get_current_event_time ()

-- guint32     gtk_get_current_event_time      (void);

-- If there is a current event and it has a timestamp, return that timestamp, otherwise return GDK_CURRENT_TIME.

-- Returns : 	the timestamp from the current event, or GDK_CURRENT_TIME.
-- gtk_get_current_event_state ()

-- gboolean    gtk_get_current_event_state     (GdkModifierType *state);

-- If there is a current event and it has a state field, place that state field in state and return TRUE, otherwise return FALSE.

-- state : 	a location to store the state of the current event
-- Returns : 	TRUE if there was a current event and it had a state field
-- gtk_get_event_widget ()

-- GtkWidget*  gtk_get_event_widget            (GdkEvent *event);

-- If event is NULL or the event was not associated with any widget, returns NULL, otherwise returns the widget that received the event originally.

-- event : 	a GdkEvent
-- Returns : 	the widget that originally received event, or NULL
-- gtk_propagate_event ()

-- void        gtk_propagate_event             (GtkWidget *widget,
--                                              GdkEvent *event);

-- Sends an event to a widget, propagating the event to parent widgets if the event remains unhandled. Events received by GTK+ from GDK normally begin in gtk_main_do_event(). Depending on the type of event, existence of modal dialogs, grabs, etc., the event may be propagated; if so, this function is used. gtk_propagate_event() calls gtk_widget_event() on each widget it decides to send the event to. So gtk_widget_event() is the lowest-level function; it simply emits the "event" and possibly an event-specific signal on a widget. gtk_propagate_event() is a bit higher-level, and gtk_main_do_event() is the highest level.

-- All that said, you most likely don't want to use any of these functions; synthesizing events is rarely needed. Consider asking on the mailing list for better ways to achieve your goals. For example, use gdk_window_invalidate_rect() or gtk_widget_queue_draw() instead of making up expose events.

-- widget : 	a GtkWidget
-- event : 	an event
-- See Also

-- See the GLib manual, especially GMainLoop and signal-related functions such as g_signal_connect().

feature -- global windows features
	toplevels: G_LIST [GTK_WINDOW] is
			-- A list of all existing toplevel windows.
		do
			create Result.from_external_pointer (gtk_window_list_toplevels)
			-- Note: (adapted from original documentation)
			-- `gtk_window_list_toplevels' returns a list in which the
			-- widgets are not individually referenced. Therefore before
			-- performing actions involving callbacks that might destroy
			-- the widgets, we call "g_list_foreach (result,
			-- (GFunc)g_object_ref, NULL)" (implemented in
			-- `ref_all_toplevels') first, and then unref all the widgets
			-- afterwards.
			ref_all_toplevels (Result.handle)
		end


	default_icon_list: G_LIST[GDK_PIXBUF] is
			-- an icon list to be used as fallback for windows that
			-- haven't had `icon_list' called on them to set up a
			-- window-specific icon list.
		do
			create Result.from_external_pointer (gtk_window_get_default_icon_list)
			-- Gets the value set by
			-- gtk_window_set_default_icon_list(). The list is a copy and
			-- should be freed with g_list_free(), but the pixbufs in the
			-- list have not had their reference count incremented.
		end

	set_default_icon_list (some_pixbuffers: G_LIST[GDK_PIXBUF]) is
			-- Sets an icon list to be used as fallback for windows that
			-- haven't had gtk_window_set_icon_list() called on them to
			-- set up a window-specific icon list. This function allows
			-- you to set up the icon for all windows in your app at
			-- once.  See `GTK_WINDOW.set_icon_list' for more details.
		require
			list_not_void: some_pixbuffers /= Void
		do
			gtk_window_set_default_icon_list(some_pixbuffers.handle)
		end


	set_default_icon (an_icon: GDK_PIXBUF) is
			-- Sets an icon to be used as fallback for windows that
			-- haven't had `GTK_WINDOW.set_icon' called on them from a
			-- pixbuf.
		do
			gtk_window_set_default_icon (an_icon.handle)
		end

	set_default_icon_from_file (a_filename: STRING) is
			-- Sets an icon to be used as fallback for windows that
			-- haven't had gtk_window_set_icon_list() called on them from
			-- a file on disk. Errors are stored in `error' feature
		require
			filename_not_void: a_filename /= Void
		do
			is_default_icon_set := (gtk_window_set_default_icon_from_file
											(a_filename.to_external,
											 address_of (error.handle))).to_boolean
			-- Sets an icon to be used as fallback for windows that
			-- haven't had gtk_window_set_icon_list() called on them from
			-- a file on disk. Warns on failure if err is NULL.
		end

	is_default_icon_set: BOOLEAN
			-- Has last call to `set_default_icon_from_file' actually 
			-- set up the default icon?

	set_default_icon_name (a_name: STRING) is
			-- Sets an icon to be used as fallback for windows that
			-- haven't had `GTK_WINDOW.set_icon_list' called on them from
			-- a named themed icon, see `GTK_WINDOW.set_icon_name'.
		do
			gtk_window_set_default_icon_name (a_name.to_external)
		end 

	set_auto_startup_notification is
			-- By default, after showing the first GtkWindow for each
			-- GdkScreen, GTK+ calls gdk_notify_startup_complete(). Call
			-- this function to disable the automatic startup
			-- notification. You might do this if your first window is a
			-- splash screen, and you want to delay notification until
			-- after your real main window has been shown, for example.

			-- In that example, you would disable startup notification
			-- temporarily, show your splash screen, then re-enable it so
			-- that showing the main window would automatically result in
			-- notification.
		do
			gtk_window_set_auto_startup_notification (1)
		end	

	unset_auto_startup_notification is
			-- Disable auto startup notification. Useful when dealing 
			-- with splash-screens. See `set_auto_startup_notification' 
			-- for further informations.
		do
			gtk_window_set_auto_startup_notification (0)
		end	

feature -- Global error
	error: G_ERROR
			-- The error eventually set up by a GTK+ call.
	
feature {} -- External calls for global windows features
	ref_all_toplevels (toplevel_list: POINTER) is
		external "C use <gtk/gtk.h>"
		alias "g_list_foreach ($toplevel_list, (GFunc)g_object_ref, NULL)"
		end

	gtk_window_list_toplevels: POINTER is -- GList* 
		external "C use <gtk/gtk.h>"
		end

	gtk_window_get_default_icon_list: POINTER is -- GList* 
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon_list(a_glist: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon (a_gdkpixbuf_icon: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon_from_file (filename_str, gerror_handle: POINTER): INTEGER is 	-- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon_name (name_str: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_auto_startup_notification (gboolean_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
invariant
	error_not_void: error /= Void
end
	
