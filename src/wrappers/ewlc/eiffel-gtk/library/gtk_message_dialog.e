note
	description: "GtkMessageDialog -- A convenient message window."
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

class GTK_MESSAGE_DIALOG
	-- GtkMessageDialog presents a dialog with an image representing
	-- the type of message (Error, Question, etc.) alongside some
	-- message text. It's simply a convenience widget; you could
	-- construct the equivalent of GTK_MESSAGE_DIALOG from GTK_DIALOG
	-- without too much effort, but GTK_MESSAGE_DIALOG saves typing.

	-- The easiest way to do a modal message dialog is to use `run',
	-- though you can also pass in the `gtk_dialog_modal' flag, `run'
	-- automatically makes the dialog modal and waits for the user to
	-- respond to it. `run' returns when any dialog button is clicked.

	-- TODO: Eiffellize Example 2. A modal dialog.
	
	--  dialog = gtk_message_dialog_new (main_application_window,
	--                                   GTK_DIALOG_DESTROY_WITH_PARENT,
	--                                   GTK_MESSAGE_ERROR,
	--                                   GTK_BUTTONS_CLOSE,
	--                                   "Error loading file '%s': %s",
	--                                   filename, g_strerror (errno));
	--  gtk_dialog_run (GTK_DIALOG (dialog));
	--  gtk_widget_destroy (dialog);
	
	-- You might do a non-modal GtkMessageDialog as follows:
	
	-- TODO Eifelize Example 3. A non-modal dialog.
	
	--  dialog = gtk_message_dialog_new (main_application_window,
	--                                   GTK_DIALOG_DESTROY_WITH_PARENT,
	--                                   GTK_MESSAGE_ERROR,
	--                                   GTK_BUTTONS_CLOSE,
	--                                   "Error loading file '%s': %s",
	--                                   filename, g_strerror (errno));
	
	--  /* Destroy the dialog when the user responds to it (e.g. clicks a button) */
	--  g_signal_connect_swapped (dialog, "response",
	--                            G_CALLBACK (gtk_widget_destroy),
	--                            dialog);

inherit
	GTK_DIALOG
		rename
			new as new_dialog -- redefine new end
			make as make_dialog -- redefine make end
		redefine struct_size
		end
		-- Implemented Interfaces: GtkMessageDialog implements
		-- AtkImplementorIface.

insert
	GTK_MESSAGE_DIALOG_EXTERNALS

create {ANY} new, make, with_markup, from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMessageDialog)"
		end

feature {} -- Creation

	make (a_parent: GTK_WINDOW; some_flags, a_type, some_buttons: INTEGER; a_message: STRING) is
			-- Creates a new message dialog, which is a simple dialog
			-- with an icon indicating the dialog `a_type' (error,
			-- warning, etc.) and some text the user may want to
			-- see. When the user clicks a button a "response" signal is
			-- emitted with response IDs from GTK_RESPONSE_TYPE. See
			-- GTK_DIALOG for more details.
			
			-- `a_parent': transient parent, or Void for none
		require
			gtk_initialized: gtk.is_initialized
			valid_dialog_flags: are_valid_dialog_flags (some_flags)
			valid_message_type: is_valid_gtk_message_type (a_type)
			valid_buttons_type: is_valid_gtk_buttons_type (some_buttons)
		do
			if a_parent=Void then
				from_external_pointer (gtk_message_dialog_new (default_pointer, some_flags, a_type, some_buttons, a_message.to_external))
			else
				from_external_pointer (gtk_message_dialog_new (a_parent.handle, some_flags, a_type, some_buttons, a_message.to_external))
			end
		end

	new (a_parent: GTK_WINDOW; some_flags, a_type, some_buttons: INTEGER; a_message: STRING) is
		obsolete "use `make' instead."
		do
			make (a_parent, some_flags, a_type, some_buttons, a_message)
		end

	with_markup (a_parent: GTK_WINDOW; some_flags, a_type, some_buttons: INTEGER; a_message: STRING) is
			-- Creates a new message dialog, which is a simple dialog
			-- with an icon indicating the dialog type (error, warning,
			-- etc.) and some text which is marked up with the Pango text
			-- markup language. When the user clicks a button a
			-- "response" signal is emitted with response IDs from
			-- GtkResponseType. See GtkDialog for more details.

			-- Special XML characters in the printf() arguments passed to
			-- this function will automatically be escaped as
			-- necessary. (See g_markup_printf_escaped() for how this is
			-- implemented.) Usually this is what you want, but if you
			-- have an existing Pango markup string that you want to use
			-- literally as the label, then you need to use
			-- gtk_message_dialog_set_markup() instead, since you can't
			-- pass the markup string either as the format (it might
			-- contain '%' characters) or as a string argument.

			--  TODO: Eiffelize this example GtkWidget *dialog;
			
			--  dialog = gtk_message_dialog_new (main_application_window,
			--  GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR,
			--  GTK_BUTTON_CLOSE, NULL); gtk_message_dialog_set_markup
			--  (GTK_MESSAGE_DIALOG (dialog), markup);
			
			-- `a_parent': transient parent, or Void for none
		require
			gtk_initialized: gtk.is_initialized
			valid_dialog_flags: are_valid_dialog_flags (some_flags)
			valid_message_type: is_valid_gtk_message_type (a_type)
			valid_buttons_type: is_valid_gtk_buttons_type (some_buttons)
		do
			if a_parent=Void then from_external_pointer
				(gtk_message_dialog_new_with_markup
				 (default_pointer,some_flags,a_type,some_buttons,a_message.to_external))
			else from_external_pointer
				(gtk_message_dialog_new_with_markup
				 (a_parent.handle,some_flags,a_type,some_buttons,a_message.to_external))
			end
		end

feature {ANY} -- Dialog's message

	set_markup (a_string: STRING) is
			-- Sets the text of the message dialog to be `a_string',
			-- which is marked up with the Pango text markup language.
		require valid_string: a_string/=Void
		do
			gtk_message_dialog_set_markup (handle,a_string.to_external)
		end

	set_secondary_text (a_string: STRING) is
			-- Sets the secondary text of the message dialog to be
			-- `a_string' (note: it must follow C's printf()-style).
			
			-- Note that setting a secondary text makes the primary text
			-- become bold, unless you have provided explicit markup.
		require valid_string: a_string/=Void
		do
			gtk_message_dialog_format_secondary_text (handle, a_string.to_external)
		end

	unset_secondary_text is
			-- Remove any secondary text of the message dialog.
		do
			gtk_message_dialog_format_secondary_text (handle, default_pointer)
		end

	set_secondary_markup (a_string: STRING) is
			-- Sets the secondary text of the message dialog to be
			-- `a_string' (with printf()-style), which is marked up with
			-- the Pango text markup language.

			-- Note that setting a secondary text makes the primary text
			-- become bold, unless you have provided explicit markup.

			-- TODO: intern this note into current feature: Due to an
			-- oversight, this function does not escape special XML
			-- characters like gtk_message_dialog_new_with_markup()
			-- does. Thus, if the arguments may contain special XML
			-- characters, you should use g_markup_printf_escaped() to
			-- escape it.

			-- TODO: Eiffelize this example gchar *msg;
			
			-- msg = g_markup_printf_escaped (message_format, ...);
			-- gtk_message_dialog_format_secondary_markup (message_dialog, "%s", msg);
			-- g_free (msg);
		require valid_string: a_string/=Void
		do
			gtk_message_dialog_format_secondary_markup (handle, a_string.to_external)
		end

	unset_secondary_markup is
			-- Unsets the secondary text of the message dialog.
		do
			gtk_message_dialog_format_secondary_markup (handle, default_pointer)
		end

feature {ANY} -- Property Details
-- The "buttons" property

--   "buttons"              GtkButtonsType        : Write / Construct Only

-- The buttons shown in the message dialog.

-- Default value: GTK_BUTTONS_NONE
-- The "message-type" property

--   "message-type"         GtkMessageType        : Read / Write / Construct

-- The type of message.

-- Default value: GTK_MESSAGE_INFO
-- Style Property Details
-- The "message-border" style property

--   "message-border"       gint                  : Read

-- Width of border around the label and image in the message dialog.

-- Allowed values: >= 0

-- Default value: 12
-- The "use-separator" style property

--   "use-separator"        gboolean              : Read

-- Whether to put a separator between the message dialog's text and the buttons.

-- Default value: FALSE
-- See Also

end
