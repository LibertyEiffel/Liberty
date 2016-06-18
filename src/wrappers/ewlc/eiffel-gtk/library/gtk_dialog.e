note
	description: "GtkDialog -- Create popup windows."
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

class GTK_DIALOG
	-- Dialog boxes are a convenient way to prompt the user for a small amount of
	-- input, e.g. to display a message, ask a question, or anything else that
	-- does not require extensive effort on the user's part.

	-- GTK+ treats a dialog as a window split vertically. The top section is a
	-- GtkVBox, and is where widgets such as a GtkLabel or a GtkEntry should be
	-- packed. The bottom area is known as the action_area. This is generally
	-- used for packing buttons into the dialog which may perform functions such
	-- as cancel, ok, or apply. The two areas are separated by a GtkHSeparator.

	-- GtkDialog boxes are created with a call to `make' or
	-- gtk_dialog_new_with_buttons(). gtk_dialog_new_with_buttons() is
	-- recommended; it allows you to set the dialog title, some convenient flags,
	-- and add simple buttons.

	-- If 'dialog' is a newly created dialog, the two primary
	-- areas of the window can be accessed as
	-- GTK_DIALOG(dialog)->vbox and
	-- GTK_DIALOG(dialog)->action_area, as can be seen from the
	-- example, below.

	-- A 'modal' dialog (that is, one which freezes the rest of
	-- the application from user input), can be created by
	-- calling gtk_window_set_modal() on the dialog. Use the
	-- GTK_WINDOW() macro to cast the widget returned from
	-- gtk_dialog_new() into a GtkWindow. When using
	-- gtk_dialog_new_with_buttons() you can also pass the
	-- GTK_DIALOG_MODAL flag to make a dialog modal.

	-- If you add buttons to GtkDialog using
	-- gtk_dialog_new_with_buttons(), gtk_dialog_add_button(),
	-- gtk_dialog_add_buttons(), or
	-- gtk_dialog_add_action_widget(), clicking the button will
	-- emit a signal called "response" with a response ID that
	-- you specified. GTK+ will never assign a meaning to
	-- positive response IDs; these are entirely
	-- user-defined. But for convenience, you can use the
	-- response IDs in the GtkResponseType enumeration (these all
	-- have values less than zero). If a dialog receives a delete
	-- event, the "response" signal will be emitted with a
	-- response ID of GTK_RESPONSE_DELETE_EVENT.

	-- If you want to block waiting for a dialog to return before
	-- returning control flow to your code, you can call
	-- gtk_dialog_run(). This function enters a recursive main
	-- loop and waits for the user to respond to the dialog,
	-- returning the response ID corresponding to the button the
	-- user clicked.

	-- For the simple dialog in the following example, in reality
	-- you'd probably use GtkMessageDialog to save yourself some
	-- effort. But you'd need to create the dialog contents
	-- manually if you had more than a simple message in the
	-- dialog.

	-- Example 1. Simple GtkDialog usage.

	-- /* Function to open a dialog box displaying the message provided. */

	-- void quick_message (gchar *message) {
	
	--    GtkWidget *dialog, *label;
	
	--    /* Create the widgets */
	
	-- dialog = gtk_dialog_new_with_buttons ("Message",
	-- main_application_window, GTK_DIALOG_DESTROY_WITH_PARENT,
	-- GTK_STOCK_OK, GTK_RESPONSE_NONE, NULL); -- label =
	-- gtk_label_new (message);
	
	-- /* Ensure that the dialog box is destroyed when the user
	-- responds. */
	
	--    g_signal_connect_swapped (dialog,
	--                              "response", 
	--                              G_CALLBACK (gtk_widget_destroy),
	--                              dialog);

	--    /* Add the label, and show everything we've added to the dialog. */
	
	--    gtk_container_add (GTK_CONTAINER (GTK_DIALOG(dialog)->vbox),
	--                       label);
	--    gtk_widget_show_all (dialog);
	-- }

inherit 
	GTK_WINDOW 
		redefine 
			make, 
			struct_size 
		end
	CLOSE_SIGNAL_RECEIVER

insert
	GTK_DIALOG_EXTERNALS
	GTK_DIALOG_STRUCT
	GTK_STOCK_ITEMS
		-- GtkDialog implements AtkImplementorIface.	

create {ANY} new, make, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new dialog box. Widgets should not be packed
			-- into this GtkWindow directly, but into the vbox and
			-- action_area.
		do
			from_external_pointer (gtk_dialog_new)
		end

	new
		obsolete "use `make' instead."
		do
			make
		end

	
	-- TODO: reimplement gtk_dialog_new_with_buttons () without variadic as with_buttons

	-- GtkWidget* gtk_dialog_new_with_buttons (const gchar *title,
	-- GtkWindow *parent, GtkDialogFlags flags, const gchar
	-- *first_button_text, ...);

	-- Creates a new GtkDialog with title title (or NULL for the
	-- default title; see gtk_window_set_title()) and transient parent
	-- parent (or NULL for none; see
	-- gtk_window_set_transient_for()). The flags argument can be used
	-- to make the dialog modal (GTK_DIALOG_MODAL) and/or to have it
	-- destroyed along with its transient parent
	-- (GTK_DIALOG_DESTROY_WITH_PARENT). After flags, button
	-- text/response ID pairs should be listed, with a NULL pointer
	-- ending the list. Button text can be either a stock ID such as
	-- GTK_STOCK_OK, or some arbitrary text. A response ID can be any
	-- positive number, or one of the values in the GtkResponseType
	-- enumeration. If the user clicks one of these dialog buttons,
	-- GtkDialog will emit the "response" signal with the corresponding
	-- response ID. If a GtkDialog receives the "delete_event" signal,
	-- it will emit "response" with a response ID of
	-- GTK_RESPONSE_DELETE_EVENT. However, destroying a dialog does not
	-- emit the "response" signal; so be careful relying on "response"
	-- when using the GTK_DIALOG_DESTROY_WITH_PARENT flag. Buttons are
	-- from left to right, so the first button in the list will be the
	-- leftmost button in the dialog.

	-- Here's a simple example:

	--  GtkWidget *dialog = gtk_dialog_new_with_buttons ("My dialog",
	--  main_app_window, GTK_DIALOG_MODAL |
	--  GTK_DIALOG_DESTROY_WITH_PARENT, GTK_STOCK_OK, GTK_RESPONSE_ACCEPT,
	--  GTK_STOCK_CANCEL, GTK_RESPONSE_REJECT, NULL);
	
	-- title : 	Title of the dialog, or NULL
	-- parent : 	Transient parent of the dialog, or NULL
	-- flags : 	from GtkDialogFlags
	-- first_button_text : 	stock ID or text to go in first button, or NULL
	-- ... : 	response ID for first button, then additional buttons, ending with NULL
	-- Returns : 	a new GtkDialog

feature {ANY} -- Running dialog
	run: INTEGER
			-- run the dialog until it emits the response signal, or is
			-- destroyed. If the dialog is destroyed during the call to
			-- run, it returns gtk_response_none. Otherwise, it returns
			-- the response ID from the "response" signal
			-- emission. Before entering the recursive main loop, run
			-- calls show on the dialog for you. Note that you still need
			-- to show any children of the dialog yourself. During run,
			-- the default behavior of "delete_event" is disabled; if the
			-- dialog receives "delete_event", it will not be destroyed
			-- as windows usually are, and run will return
			-- gtk_response_delete_event. Also, during run the dialog
			-- will be modal. You can force run to return at any time by
			-- calling emit_response to emit the "response" signal.
		do
			Result := gtk_dialog_run (handle)
			
			-- TODO: eiffelize this description and example
			
			-- Blocks in a recursive main loop until the dialog either
			-- emits the response signal, or is destroyed. If the dialog
			-- is destroyed during the call to gtk_dialog_run(),
			-- gtk_dialog_returns GTK_RESPONSE_NONE. Otherwise, it
			-- returns the response ID from the "response" signal
			-- emission. Before entering the recursive main loop,
			-- gtk_dialog_run() calls gtk_widget_show() on the dialog for
			-- you. Note that you still need to show any children of the
			-- dialog yourself.

			-- During gtk_dialog_run(), the default behavior of
			-- "delete_event" is disabled; if the dialog receives
			-- "delete_event", it will not be destroyed as windows
			-- usually are, and gtk_dialog_run() will return
			-- GTK_RESPONSE_DELETE_EVENT. Also, during gtk_dialog_run()
			-- the dialog will be modal. You can force gtk_dialog_run()
			-- to return at any time by calling gtk_dialog_response() to
			-- emit the "response" signal. Destroying the dialog during
			-- gtk_dialog_run() is a very bad idea, because your post-run
			-- code won't know whether the dialog was destroyed or not.

			-- After gtk_dialog_run() returns, you are responsible for
			-- hiding or destroying the dialog if you wish to do so.

			-- Typical usage of this function might be:

			--   gint result = gtk_dialog_run (GTK_DIALOG (dialog));
			--   switch (result)
			--     {
			--       case GTK_RESPONSE_ACCEPT:
			--          do_application_specific_something ();
			--          break;
			--       default:
			--          do_nothing_since_dialog_was_cancelled ();
			--          break;
			--     }
			--   gtk_widget_destroy (dialog);

			-- Note that even though the recursive main loop gives the
			-- effect of a modal dialog (it prevents the user from
			-- interacting with other windows in the same window group
			-- while the dialog is run), callbacks such as timeouts, IO
			-- channel watches, DND drops, etc, will be triggered during a
			-- gtk_dialog_run() call.
			
			-- dialog : 	a GtkDialog
			-- Returns : 	response ID
		end

	emit_response (a_response_id: INTEGER)
			-- Emits the "response" signal with the given response
			-- ID. Used to indicate that the user has responded to the
			-- dialog in some way; typically either you or `run' be
			-- monitoring the "response" signal and take appropriate
			-- action.
		do
			gtk_dialog_response (handle, a_response_id)
		end

	add_button (a_button_text: STRING; a_response_id: INTEGER)
			-- Adds a button with the given text (or a stock button, if
			-- `a_button_text' is a stock ID) and sets things up so that
			-- clicking the button will emit the "response" signal with
			-- the given `a_response_id'. The button is appended to the
			-- end of the dialog's action area. The button widget is
			-- returned, but usually you don't need it.

			-- `a_button_text': text of button, or stock ID
			
			-- `a_response_id' : response ID for the button

			-- TODO: store the button widget that was added somewhere
		local unused_button_ptr: POINTER
		do
			unused_button_ptr := gtk_dialog_add_button (handle, a_button_text.to_external, a_response_id)
		end

	add_buttons (some_buttons: COLLECTION[TUPLE[STRING, INTEGER]])
			-- Adds more buttons,  calling add_button repeatedly on each tupla of `some_buttons'.
		require
			buttons_not_void: some_buttons /= Void
			-- valid_buttons:  some_buttons.for_all (agent (i:TUPLE[STRING, INTEGER]) i.item_1 /= Void
		local
			iterator: ITERATOR[TUPLE[STRING, INTEGER]];
			a_text: STRING; an_id: INTEGER
			--a_button: GTK_BUTTON
		do
			iterator:=some_buttons.get_new_iterator;
			from iterator.start until iterator.is_off
			loop
				-- a_text:=iterator.item.item_1
				-- an_id:=iterator.item.item_2 add_button (a_text, an_id)
				add_button (iterator.item.item_1, iterator.item.item_2)
				iterator.next
			end
		end

	add_action_widget (a_widget: GTK_WIDGET; a_response_id: INTEGER)
			-- Adds an activatable widget to the action area of a
			-- GtkDialog, connecting a signal handler that will emit the
			-- "response" signal on the dialog when the widget is
			-- activated. The widget is appended to the end of the
			-- dialog's action area. If you want to add a non-activatable
			-- widget, simply pack it into the action_area field of the
			-- GtkDialog struct.
		
			-- `a_widget': an activatable widget
		
			-- `a_response_id' : response ID for child
		require valid_widget: a_widget /= Void
		do
			gtk_dialog_add_action_widget (handle, a_widget.handle, a_response_id)
		end

feature {ANY} -- Separator
	has_separator: BOOLEAN
			-- Has the dialog a separator?
		do
			Result := gtk_dialog_get_has_separator (handle).to_boolean
		end

	set_has_separator
			-- Gives the dialog a separator above the buttons.
		do
			gtk_dialog_set_has_separator (handle, 1)
		ensure has_separator_set: has_separator = True
		end

	unset_has_separator
			-- Remove the separator above the buttons.
		do
			gtk_dialog_set_has_separator (handle, 0)
		ensure has_separator_unset: has_separator = False
		end

feature {ANY} -- default response
	
	set_default_response (a_response_id: INTEGER)
			-- Sets the last widget in the dialog's action area with the
			-- given `a_response_id' as the default widget for the
			-- dialog. Pressing "Enter" normally activates the default
			-- widget.
		do
			gtk_dialog_set_default_response (handle, a_response_id)
		end
	
-- gtk_dialog_set_response_sensitive ()

-- void        gtk_dialog_set_response_sensitive
--                                             (GtkDialog *dialog,
--                                              gint response_id,
--                                              gboolean setting);

-- Calls gtk_widget_set_sensitive (widget, setting) for each widget in
-- the dialog's action area with the given response_id. A convenient way to
-- sensitize/desensitize dialog buttons.

-- dialog : 	a GtkDialog
-- response_id : 	a response ID
-- setting : 	TRUE for sensitive
-- gtk_dialog_get_response_for_widget ()

-- gint        gtk_dialog_get_response_for_widget
--                                             (GtkDialog *dialog,
--                                              GtkWidget *widget);

-- Gets the response id of a widget in the action area of a dialog.

-- dialog : 	a GtkDialog
-- widget : 	a widget in the action area of dialog
-- Returns : 	the response id of widget, or GTK_RESPONSE_NONE if widget doesn't have a response id set.

-- Since 2.8
-- gtk_alternative_dialog_button_order ()

-- gboolean    gtk_alternative_dialog_button_order
--                                             (GdkScreen *screen);

-- Returns TRUE if dialogs are expected to use an alternative button order on the screen screen. See gtk_dialog_set_alternative_button_order() for more details about alternative button order.

-- If you need to use this function, you should probably connect to the ::notify:gtk-alternative-button-order signal on the GtkSettings object associated to screen, in order to be notified if the button order setting changes.

-- screen : 	a GdkScreen, or NULL to use the default screen
-- Returns : 	Whether the alternative button order should be used

-- Since 2.6
-- gtk_dialog_set_alternative_button_order ()

-- void        gtk_dialog_set_alternative_button_order
--                                             (GtkDialog *dialog,
--                                              gint first_response_id,
--                                              ...);

-- Sets an alternative button order. If the gtk-alternative-button-order setting is set to TRUE, the dialog buttons are reordered according to the order of the response ids passed to this function.

-- By default, GTK+ dialogs use the button order advocated by the Gnome Human Interface Guidelines with the affirmative button at the far right, and the cancel button left of it. But the builtin GTK+ dialogs and GtkMessageDialogs do provide an alternative button order, which is more suitable on some platforms, e.g. Windows.

-- Use this function after adding all the buttons to your dialog, as the following example shows:

-- cancel_button = gtk_dialog_add_button (GTK_DIALOG (dialog),
--                                        GTK_STOCK_CANCEL,
--                                        GTK_RESPONSE_CANCEL);
 
-- ok_button = gtk_dialog_add_button (GTK_DIALOG (dialog),
--                                    GTK_STOCK_OK,
--                                    GTK_RESPONSE_OK);
  
-- gtk_widget_grab_default (ok_button);
  
-- help_button = gtk_dialog_add_button (GTK_DIALOG (dialog),
--                                      GTK_STOCK_HELP,
--                                      GTK_RESPONSE_HELP);
 
-- gtk_dialog_set_alternative_button_order (GTK_DIALOG (dialog),
--                                          GTK_RESPONSE_OK,
--                                          GTK_RESPONSE_CANCEL,
--                                          GTK_RESPONSE_HELP,
--                                          -1);

-- dialog : 	a GtkDialog
-- first_response_id : 	a response id used by one dialog's buttons
-- ... : 	a list of more response ids of dialog's buttons, terminated by -1

-- Since 2.6
-- gtk_dialog_set_alternative_button_order_from_array ()

-- void        gtk_dialog_set_alternative_button_order_from_array
--                                             (GtkDialog *dialog,
--                                              gint n_params,
--                                              gint *new_order);

-- Sets an alternative button order. If the gtk-alternative-button-order setting is set to TRUE, the dialog buttons are reordered according to the order of the response ids in new_order.

-- See gtk_dialog_set_alternative_button_order() for more information.

-- This function is for use by language bindings.

-- dialog : 	a GtkDialog
-- n_params : 	the number of response ids in new_order
-- new_order : 	an array of response ids of dialog's buttons

-- Since 2.6
-- Property Details
-- The "has-separator" property

--   "has-separator"        gboolean              : Read / Write

-- The dialog has a separator bar above its buttons.

-- Default value: TRUE
-- Style Property Details
-- The "action-area-border" style property

--   "action-area-border"   gint                  : Read

-- Width of border around the button area at the bottom of the dialog.

-- Allowed values: >= 0

-- Default value: 5
-- The "button-spacing" style property

--   "button-spacing"       gint                  : Read

-- Spacing between buttons.

-- Allowed values: >= 0

-- Default value: 10
-- The "content-area-border" style property

--   "content-area-border"  gint                  : Read

-- Width of border around the main dialog area.

-- Allowed values: >= 0

-- Default value: 2
-- Signal Details
-- The "close" signal

-- void        user_function                  (GtkDialog *dialog,
--                                             gpointer   user_data)      : Run last / Action

-- dialog : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "response" signal

-- void        user_function                  (GtkDialog *dialog,
--                                             gint       arg1,
--                                             gpointer   user_data)      : Run last

-- Emitted when an action widget is clicked, the dialog receives a
-- delete event, or the application programmer calls gtk_dialog_response().
-- On a delete event, the response ID is GTK_RESPONSE_NONE. Otherwise, it
-- depends on which action widget was clicked.

-- dialog : 	the object which received the signal.
-- arg1 : 	the response ID
-- user_data : 	user data set when the signal handler was connected.
-- See Also

-- GtkVBox 	

-- Pack widgets vertically.
-- GtkWindow 	

-- Alter the properties of your dialog box.
-- GtkButton 	

-- Add them to the action_area to get a response from the user.

feature {ANY} -- From ewg implementation
	feature -- Adding stock buttons

	add_reject_button (a_label: STRING)
			-- Add a "reject" button with a_label. Stock response is used
		require label_not_void: a_label /= Void
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, a_label.to_external, gtk_response_reject)
		end

	add_accept_button (a_label: STRING)
			-- Add a "Accept" button. Stock item and response are used
		require label_not_void: a_label /= Void
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, a_label.to_external, gtk_response_accept)
		end

	add_ok_cancel_buttons
			-- Add both 'Ok' and 'Cancel' buttons
		do
			add_ok_button
			add_cancel_button
		end

	add_ok_button
			-- Add a "Ok" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_ok.to_external, gtk_response_ok)
		end

	add_cancel_button
			-- Add a "Cancel" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_cancel.to_external, gtk_response_cancel)
		end

	add_close_button
			-- Add a "Close" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_close.to_external, gtk_response_close)
		end

	add_yes_no_buttons
			-- Add both 'Yes' and 'No' buttons
		do
			add_yes_button
			add_no_button
		end

	add_yes_button
			-- Add a "Yes" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_yes.to_external, gtk_response_yes)
		end

	add_no_button
			-- Add a "No" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_no.to_external, gtk_response_no)
		end

	add_apply_button
			-- Add a "Apply" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_apply.to_external, gtk_response_apply)
		end

	add_help_button
			-- Add a "Help" button. Stock item and response are used
		local a_widget: POINTER
		do
			a_widget := gtk_dialog_add_button (handle, gtk_stock_help.to_external, gtk_response_help)
		end

	-- TODO: wrap gtk_dialog_set_response_sensitive 
	-- TODO: wrap gtk_alternative_dialog_button_order 
	-- TODO: wrap gtk_dialog_set_alternative_button_order

feature {ANY} -- properties
	
	action_area_border: INTEGER
			-- Width of border around the button area at the bottom of
			-- the dialog.
		local value: G_VALUE
		do
			create value.make_integer
			g_object_get_property (handle,action_area_border_property_name.to_external,value.handle)
			Result := value.integer
		ensure positive_result: Result >= 0
		end

	button_spacing: INTEGER
			-- Spacing between buttons.
		local value: G_VALUE
		do
			create value.make_integer
			g_object_get_property (handle, button_spacing_property_name.to_external,value.handle)
			Result := value.integer
		ensure positive_result: Result >= 0
		end

	content_area_border: INTEGER
			-- Width of border around the main dialog area.
		local value: G_VALUE
		do
			create value.make_integer
			g_object_get_property(handle, content_area_border_property_name.to_external,value.handle)
			Result:=value.integer
		ensure positive_result: Result >= 0
		end

feature {ANY} -- Dialog's parts

	vbox: GTK_VBOX
			-- main part of the dialog box
		local
			retriever: G_OBJECT_FACTORY [GTK_VBOX]
		do
			Result := retriever.existant_wrapper (get_vbox (handle))
			if Result=Void then create Result.from_external_pointer (get_vbox(handle)) end
		ensure
			result_not_void: Result /= Void
		end

	action_area: GTK_HBOX
			--  bottom area of the dialog. Generally used for packing
			--  buttons into the dialog which may perform functions such
			--  as cancel, ok, or apply
		local
			retriever: G_OBJECT_EXPANDED_FACTORY [GTK_HBOX]
		do
			Result := retriever.existant_wrapper (get_action_area (handle)) 
			if Result=Void then create Result.from_external_pointer (get_action_area(handle)) end
			ensure result_bot_void: Result /= Void
			end

-- feature -- The "close" signal
-- 	close_signal_name: STRING is "close"

-- 	enable_on_close is
-- 			-- Connects "close" signal to `on_close' feature.
-- 		do
-- 			connect (Current, close_signal_name, $on_close)
-- 		end

-- 	on_close is
-- 			-- Built-in close signal handler; empty by design; redefine it.
-- 		do
-- 		end

-- 	connect_agent_to_close_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_DIALOG]]) is
-- 		require
-- 			valid_procedure: a_procedure /= Void
-- 			wrapper_is_stored: is_eiffel_wrapper_stored
-- 		local close_callback: CLOSE_CALLBACK
-- 		do
-- 			create close_callback.make
-- 			close_callback.connect (Current, a_procedure)
-- 		end

-- 	content_area_border: INTEGER is
-- 			-- Width of border around the main dialog area.
-- 		local
-- 			value: G_VALUE
-- 		do
-- 			create value.make_new_shared
-- 			g_object_get_property (item,
-- 										  content_area_border_property_name,
-- 										  value.item)
-- 			Result := value.integer
-- 		ensure
-- 			positive_result: Result >= 0
-- 		end


-- feature -- TODO: close signal
-- 	-- connect_close_signal_receiver (a_receiver: GTK_CLOSE_SIGNAL_RECEIVER) is
-- 	-- Connect `a_receiver' to the current widget
-- 	--require
-- 	--		a_receiver_not_void: a_receiver /= Void
-- 	--		do
-- 	--	connect_signal_receiver (a_receiver)
-- 	--end

-- feature -- TODO: response signals
	
-- 	-- connect_response_signal_receiver (a_receiver: GTK_RESPONSE_SIGNAL_RECEIVER) is
-- 	-- Connect `a_receiver' to the current widget
-- 	--	require
-- 	-- a_receiver_not_void: a_receiver /= Void
-- 	-- do
-- 	-- connect_signal_receiver (a_receiver)
-- 	-- end
	
-- feature {} -- Signals' names
	
-- 	action_area_border_property_name: STRING is "action-area-border"
	
-- 	button_spacing_property_name: STRING is "button-spacing"

-- 	content_area_border_property_name: STRING is  "content-area-border"
-- end
feature {} -- property names strings
	action_area_border_property_name: STRING is "action-area-border"
	button_spacing_property_name: STRING is "button-spacing"
	content_area_border_property_name: STRING is "content-area-border"
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkDialog)"
		end
end
