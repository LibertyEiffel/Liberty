note
	description: "GtkFileChooserDialog A file chooser dialog, suitable for `File/Open' or `File/Save' commands."
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

class GTK_FILE_CHOOSER_DIALOG
	-- GtkFileChooserDialog is a dialog box suitable for use with
	-- "File/Open" or "File/Save as" commands. This widget works by
	-- putting a GtkFileChooserWidget inside a GtkDialog. It exposes
	-- the GtkFileChooserIface interface, so you can use all of the
	-- GtkFileChooser functions on the file chooser dialog as well as
	-- those for GtkDialog.

	-- Note that GtkFileChooserDialog does not have any methods of its
	-- own. Instead, you should use the functions that work on a
	-- GtkFileChooser.

	-- TODO: Eiffellize Example 7. Typical usage
	
	-- In the simplest of cases, you can the following code to use GtkFileChooserDialog to select a file for opening:
	
	-- GtkWidget *dialog;

	-- dialog = gtk_file_chooser_dialog_new ("Open File",
	-- 				      parent_window,
	-- 				      GTK_FILE_CHOOSER_ACTION_OPEN,
	-- 				      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
	-- 				      GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT,
	-- 				      NULL);

	-- if (gtk_dialog_run (GTK_DIALOG (dialog)) == GTK_RESPONSE_ACCEPT)
	--   {
	--     char *filename;

	--     filename = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog));
	--     open_file (filename);
	--     g_free (filename);
	--   }

	-- gtk_widget_destroy (dialog);
		

	-- To use a dialog for saving, you can use this:

	-- GtkWidget *dialog;

	-- dialog = gtk_file_chooser_dialog_new ("Save File",
	-- 				      parent_window,
	-- 				      GTK_FILE_CHOOSER_ACTION_SAVE,
	-- 				      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
	-- 				      GTK_STOCK_SAVE, GTK_RESPONSE_ACCEPT,
	-- 				      NULL);
	-- gtk_file_chooser_set_do_overwrite_confirmation (GTK_FILE_CHOOSER (dialog), TRUE);

	-- if (user_edited_a_new_document)
	--   {
	--     gtk_file_chooser_set_current_folder (GTK_FILE_CHOOSER (dialog), default_folder_for_saving);
	--     gtk_file_chooser_set_current_name (GTK_FILE_CHOOSER (dialog), "Untitled document");
	--   }
	-- else
	--   gtk_file_chooser_set_filename (GTK_FILE_CHOOSER (dialog), filename_for_existing_document);


	-- if (gtk_dialog_run (GTK_DIALOG (dialog)) == GTK_RESPONSE_ACCEPT)
	--   {
	--     char *filename;

	--     filename = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog));
	--     save_to_file (filename);
	--     g_free (filename);
	--   }

	-- gtk_widget_destroy (dialog);
		

	-- Response Codes

	-- GtkFileChooserDialog inherits from GtkDialog, so buttons that go in its action area have response codes such as GTK_RESPONSE_ACCEPT and GTK_RESPONSE_CANCEL. For example, you could call gtk_file_chooser_dialog_new() as follows:

	-- GtkWidget *dialog;

	-- dialog = gtk_file_chooser_dialog_new ("Open File",
	-- 				      parent_window,
	-- 				      GTK_FILE_CHOOSER_ACTION_OPEN,
	-- 				      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
	-- 				      GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT,
	-- 				      NULL);
	

	-- This will create buttons for "Cancel" and "Open" that use stock response identifiers from GtkResponseType. For most dialog boxes you can use your own custom response codes rather than the ones in GtkResponseType, but GtkFileChooserDialog assumes that its "accept"-type action, e.g. an "Open" or "Save" button, will have one of the following response codes:
	-- GTK_RESPONSE_ACCEPT
	-- GTK_RESPONSE_OK
	-- GTK_RESPONSE_YES
	-- GTK_RESPONSE_APPLY

	-- This is because GtkFileChooserDialog must intercept
	-- responses and switch to folders if appropriate, rather
	-- than letting the dialog terminate %GÅ‚Äî%@
	-- the implementation uses these known response codes to know
	-- which responses can be blocked if appropriate.  -- Note

	-- To summarize, make sure you use a stock response code when
	-- you use GtkFileChooserDialog to ensure proper operation.
	
inherit
	GTK_DIALOG redefine struct_size end
	GTK_FILE_CHOOSER
		-- Implemented Interfaces: GtkFileChooserDialog implements
		-- AtkImplementorIface and GtkFileChooser.

insert
	GTK_FILE_CHOOSER_DIALOG_EXTERNALS

create {ANY}
	make_open, make_save, from_external_pointer

feature {} -- Creation
	make_open (a_title: STRING; a_parent: GTK_WINDOW; some_buttons: COLLECTION[TUPLE[STRING,INTEGER]])
			-- Creates a new GTK_FILE_CHOOSER_DIALOG to open a file. `a_title' is the title  of
			-- the dialog, or Void; `a_parent' - if not Void - is the
			-- transient parent of the dialog;
			-- first_button_text : 	stock ID or text to go in the first button, or NULL
			-- ... : 	response ID for the first button, then additional (button, id) pairs, ending with NULL
			-- Returns : 	a new GtkFileChooserDialog
		do
			making (a_title, a_parent, gtk_file_chooser_action_open, some_buttons)
		end

	make_save (a_title: STRING; a_parent: GTK_WINDOW; some_buttons: COLLECTION[TUPLE[STRING,INTEGER]])
			-- Creates a new GTK_FILE_CHOOSER_DIALOG to save a file. `a_title' is the title  of
			-- the dialog, or Void; `a_parent' - if not Void - is the
			-- transient parent of the dialog;
			-- first_button_text : 	stock ID or text to go in the first button, or NULL
			-- ... : 	response ID for the first button, then additional (button, id) pairs, ending with NULL
			-- Returns : 	a new GtkFileChooserDialog
		do
			making (a_title, a_parent, gtk_file_chooser_action_save, some_buttons)
		end

	making (a_title: STRING; a_parent: GTK_WINDOW; an_action: INTEGER; some_buttons: COLLECTION[TUPLE[STRING,INTEGER]])
			-- Creates a new GTK_FILE_CHOOSER_DIALOG. `a_title' is the title  of
			-- the dialog, or Void; `a_parent' - if not Void - is the
			-- transient parent of the dialog; `an_action' is the Open or save mode for the dialog
			-- first_button_text : 	stock ID or text to go in the first button, or NULL
			-- ... : 	response ID for the first button, then additional (button, id) pairs, ending with NULL
			-- Returns : 	a new GtkFileChooserDialog

		local title_ptr, parent_ptr: POINTER; iterator: ITERATOR[TUPLE[STRING,INTEGER]]
		do
			if a_title/=Void then title_ptr := a_title.to_external end
			if a_parent/=Void then parent_ptr := a_parent.handle end
			from_external_pointer (gtk_file_chooser_dialog_new 
										  (title_ptr, parent_ptr, an_action, default_pointer))
			if some_buttons/=Void then
				from iterator := some_buttons.get_new_iterator; iterator.start
				until iterator.is_off
				loop 
					add_button (iterator.item.item_1, iterator.item.item_2)
					iterator.next
				end
			end
		end


	-- TODO: gtk_file_chooser_dialog_new_with_backend ()

	-- GtkWidget* gtk_file_chooser_dialog_new_with_backend (const gchar
	-- *title, GtkWindow *parent, GtkFileChooserAction action, const
	-- gchar *backend, const gchar *first_button_text, ...);
	
	-- Creates a new GtkFileChooserDialog with a specified backend. This is especially useful if you use gtk_file_chooser_set_local_only() to allow non-local files and you use a more expressive vfs, such as gnome-vfs, to load files.
	
	-- title : 	Title of the dialog, or NULL
	-- parent : 	Transient parent of the dialog, or NULL
	-- action : 	Open or save mode for the dialog
	-- backend : 	The name of the specific filesystem backend to use.
	-- first_button_text : 	stock ID or text to go in the first button, or NULL
	-- ... : 	response ID for the first button, then additional (button, id) pairs, ending with NULL
	-- Returns : 	a new GtkFileChooserDialog
	
	-- Since 2.4

feature {ANY}
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFileChooserDialog)"
		end
end
