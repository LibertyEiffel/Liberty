indexing
	description: "GtkEntryCompletion -- Completion functionality for GtkEntry"
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

-- Description

-- GtkEntryCompletion is an auxiliary object to be used in conjunction
-- with GtkEntry to provide the completion functionality. It
-- implements the GtkCellLayout interface, to allow the user to add
-- extra cells to the GtkTreeView with completion matches.
	
-- "Completion functionality" means that when the user modifies the
-- text in the entry, GtkEntryCompletion checks which rows in the
-- model match the current content of the entry, and displays a list
-- of matches. By default, the matching is done by comparing the entry
-- text case-insensitively against the text columqn of the model (see
-- gtk_entry_completion_set_text_column()), but this can be overridden
-- with a custom match function (see
-- gtk_entry_completion_set_match_func()).

-- When the user selects a completion, the content of the entry is
-- updated. By default, the content of the entry is replaced by the
-- text column of the model, but this can be overridden by connecting
-- to the ::match-selected signal and updating the entry in the signal
-- handler. Note that you should return TRUE from the signal handler
-- to suppress the default behaviour.  To add completion functionality
-- to an entry, use gtk_entry_set_completion().

-- In addition to regular completion matches, which will be inserted
-- into the entry when they are selected, GtkEntryCompletion also
-- allows to display "actions" in the popup window. Their appearance
-- is similar to menuitems, to differentiate them clearly from
-- completion strings. When an action is selected, the
-- ::action-activated signal is emitted.

class GTK_ENTRY_COMPLETION

inherit
	G_OBJECT
		-- GtkEntryCompletion implements GtkCellLayout.

insert
	GTK_ENTRY_COMPLETION_EXTERNALS
	G_OBJECT_RETRIEVER [GTK_TREE_MODEL]

creation make, from_external_pointer

feature {} -- Creation
	
	make is
			-- Creates a new GtkEntryCompletion object.
		do
			from_external_pointer (gtk_entry_completion_new)
		end
	
feature
	entry: GTK_ENTRY is
			-- the entry completion has been attached to.
		do
			create Result.from_external_pointer (gtk_entry_completion_get_entry (handle))
		end
	
	set_model (a_model: GTK_TREE_MODEL) is
			-- Sets `a_model' for a GtkEntryCompletion. If completion 
			-- already has a model set, it will remove it before setting
			-- the new model.      
		require
			valid_model: a_model /= Void
		do
			gtk_entry_completion_set_model (handle, a_model.handle)
		end

	unset_model is
			-- Unsets the model for GtkEntryCompletion. 
		do
			gtk_entry_completion_set_model (handle, default_pointer)
		end

	model: GTK_TREE_MODEL is
			-- the model the GtkEntryCompletion is using as data source
		require
			is_model_set
		do
			Result := (retrieve_eiffel_wrapper_from_gobject_pointer
						  (gtk_entry_completion_get_model (handle)))
		end
	
	is_model_set: BOOLEAN is
			-- Is the model of GtkEntryCompletion set?
		require
			is_model_set
		do
			Result := (gtk_entry_completion_get_model (handle)).is_not_null
		end

	-- TODO: set_match_func ()

	-- void gtk_entry_completion_set_match_func (GtkEntryCompletion
	-- *completion, -- GtkEntryCompletionMatchFunc func, -- gpointer
	-- func_data, -- GDestroyNotify func_notify);
	
	-- Sets the match function for completion to be func. The match function is used to determine if a row should or should not be in the completion list.
	
	-- completion : 	A GtkEntryCompletion.
	-- func : 	The GtkEntryCompletionMatchFunc to use.
	-- func_data : 	The user data for func.
	-- func_notify : 	Destroy notifier for func_data.


	set_minimum_key_length (a_length: INTEGER) is
			-- Requires the length of the search key for completion to be
			-- at least `a_length'. This is useful for long lists, where
			-- completing using a small key takes a lot of time and will
			-- come up with meaningless results anyway (ie, a too large
			-- dataset).
		do
			gtk_entry_completion_set_minimum_key_length (handle, a_length)
		end

	minimum_key_length: INTEGER is
			-- the minimum key length as set for completion.
		do
			Result := gtk_entry_completion_get_minimum_key_length (handle)
		end

	complete is
			-- Requests a completion operation, or in other words a
			-- refiltering of the current list with completions, using
			-- the current key. The completion list view will be updated
			-- accordingly.
		do
			gtk_entry_completion_complete (handle)
		end


	insert_prefix is
			-- Requests a prefix insertion.
		do
			gtk_entry_completion_insert_prefix (handle)
		end

	insert_action_text (an_index: INTEGER; a_text: STRING) is
			-- Inserts an action in completion's action item list at
			-- position index_ with text text. If you want the action
			-- item to have markup, use
			-- gtk_entry_completion_insert_action_markup().
		require
			valid_text: a_text /= Void
		do
			gtk_entry_completion_insert_action_text (handle, an_index,a_text.to_external)
		end

	set_text_column (a_column: INTEGER) is
			-- Convenience function for setting up the most used case of this code:
			-- a completion list with just strings.
			-- This function will set up completion to have a list displaying all (and just)
			-- strings in the completion list, and to get those strings from column
 			-- in the model of completion.
 			-- This functions creates and adds a GtkCellRendererText for the selected column.
			-- If you need to set the text column, but don't want the cell renderer,
			-- use g_object_set() to set the ::text_column property directly.
		do
			gtk_entry_completion_set_text_column (handle, a_column)
		end

	text_column: INTEGER is
			-- Returns the column in the model of completion to get
			-- strings from.
		do
			Result := gtk_entry_completion_get_text_column (handle)
		end

	set_inline_completion (a_boolean: BOOLEAN) is
			-- Sets whether the common prefix of the possible completions
			-- should be automatically inserted in the entry.
		do
			gtk_entry_completion_set_inline_completion (handle, a_boolean)
		end

	inline_completion: BOOLEAN is
			-- Returns whether the common prefix of the possible completions
			-- should be automatically inserted in the entry.
		do
			Result := gtk_entry_completion_get_inline_completion (handle)
		end

	-- Since 2.4
	-- gtk_entry_completion_insert_action_markup ()

	-- void        gtk_entry_completion_insert_action_markup
	--                                             (GtkEntryCompletion *completion,
	--                                              gint index_,
	--                                              const gchar *markup);

	-- Inserts an action in completion's action item list at position index_ with markup markup.

	-- completion : 	A GtkEntryCompletion.
	-- index_ : 	The index of the item to insert.
	-- markup : 	Markup of the item to insert.

	-- Since 2.4
	-- gtk_entry_completion_delete_action ()

	-- void        gtk_entry_completion_delete_action
	--                                             (GtkEntryCompletion *completion,
	--                                              gint index_);

	-- Deletes the action at index_ from completion's action list.

	-- completion : 	A GtkEntryCompletion.
	-- index_ : 	The index of the item to Delete.

	-- Since 2.6
	-- gtk_entry_completion_set_popup_completion ()

	-- void        gtk_entry_completion_set_popup_completion
	--                                             (GtkEntryCompletion *completion,
	--                                              gboolean popup_completion);

	-- Sets whether the completions should be presented in a popup window.

	-- completion : 	a GtkEntryCompletion
	-- popup_completion : 	TRUE to do popup completion

	-- Since 2.6
	-- gtk_entry_completion_get_popup_completion ()

	-- gboolean    gtk_entry_completion_get_popup_completion
	--                                             (GtkEntryCompletion *completion);

	-- Returns whether the completions should be presented in a popup window.

	-- completion : 	a GtkEntryCompletion
	-- Returns : 	TRUE if popup completion is turned on

	-- Since 2.6
	-- gtk_entry_completion_set_popup_set_width ()

	-- void        gtk_entry_completion_set_popup_set_width
	--                                             (GtkEntryCompletion *completion,
	--                                              gboolean popup_set_width);

	-- Sets whether the completion popup window will be resized to be the same width as the entry.

	-- completion : 	a GtkEntryCompletion
	-- popup_set_width : 	TRUE to make the width of the popup the same as the entry

	-- Since 2.8
	-- gtk_entry_completion_get_popup_set_width ()

	-- gboolean    gtk_entry_completion_get_popup_set_width
	--                                             (GtkEntryCompletion *completion);

	-- Returns whether the completion popup window will be resized to the width of the entry.

	-- completion : 	a GtkEntryCompletion
	-- Returns : 	TRUE if the popup window will be resized to the width of the entry

	-- Since 2.8
	-- gtk_entry_completion_set_popup_single_match ()

	-- void        gtk_entry_completion_set_popup_single_match
	--                                             (GtkEntryCompletion *completion,
	--                                              gboolean popup_single_match);

	-- Sets whether the completion popup window will appear even if there is only a single match. You may want to set this to FALSE if you are using inline completion.

	-- completion : 	a GtkEntryCompletion
	-- popup_single_match : 	TRUE if the popup should appear even for a single match

	-- Since 2.8
	-- gtk_entry_completion_get_popup_single_match ()

	-- gboolean    gtk_entry_completion_get_popup_single_match
	--                                             (GtkEntryCompletion *completion);

	-- Returns whether the completion popup window will appear even if there is only a single match.

	-- completion : 	a GtkEntryCompletion
	-- Returns : 	TRUE if the popup window will appear regardless of the number of matches.

	-- Since 2.8
	-- Property Details
	-- The "inline-completion" property

	--   "inline-completion"    gboolean              : Read / Write

	-- Determines whether the common prefix of the possible completions should be inserted automatically in the entry. Note that this requires text-column to be set, even if you are using a custom match function.

	-- Default value: FALSE

	-- Since 2.6
	-- The "minimum-key-length" property

	--   "minimum-key-length"   gint                  : Read / Write

	-- Minimum length of the search key in order to look up matches.

	-- Allowed values: >= 0

	-- Default value: 1
	-- The "model" property

	--   "model"                GtkTreeModel          : Read / Write

	-- The model to find matches in.
	-- The "popup-completion" property

	--   "popup-completion"     gboolean              : Read / Write

	-- Determines whether the possible completions should be shown in a popup window.

	-- Default value: TRUE

	-- Since 2.6
	-- The "popup-set-width" property

	--   "popup-set-width"      gboolean              : Read / Write

	-- Determines whether the completions popup window will be resized to the width of the entry.

	-- Default value: TRUE

	-- Since 2.8
	-- The "popup-single-match" property

	--   "popup-single-match"   gboolean              : Read / Write

	-- Determines whether the completions popup window will shown for a single possible completion. You probably want to set this to FALSE if you are using inline completion.

	-- Default value: TRUE

	-- Since 2.8
	-- The "text-column" property

	--   "text-column"          gint                  : Read / Write

	-- The column of the model containing the strings.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.6
	-- Signal Details
	-- The "action-activated" signal

	-- void        user_function                  (GtkEntryCompletion *widget,
	--                                             gint index,
	--                                             gpointer user_data);

	-- Gets emitted when an action is activated.

	-- widget : 	the object which received the signal
	-- index : 	the index of the activated action
	-- user_data : 	user data set when the signal handler was connected.

	-- Since 2.4
	-- The "insert-prefix" signal

	-- gboolean    user_function                  (GtkEntryCompletion *widget,
	--                                             gchar *prefix,
	--                                             gpointer user_data);

	-- Gets emitted when the inline autocompletion is triggered. The default behaviour is to make the entry display the whole prefix and select the newly inserted part.

	-- Applications may connect to this signal in order to insert only a smaller part of the prefix into the entry - e.g. the entry used in the GtkFileChooser inserts only the part of the prefix up to the next '/'.

	-- widget : 	the object which received the signal
	-- prefix : 	the common prefix of all possible completions
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	TRUE if the signal has been handled

	-- Since 2.6
	-- The "match-selected" signal

	-- gboolean    user_function                  (GtkEntryCompletion *widget,
	--                                             GtkTreeModel *model,
	--                                             GtkTreeIter *iter,
	--                                             gpointer user_data);

	-- Gets emitted when a match from the list is selected. The default behaviour is to replace the contents of the entry with the contents of the text column in the row pointed to by iter.

	-- widget : 	the object which received the signal
	-- model : 	the GtkTreeModel containing the matches
	-- iter : 	a GtkTreeIter positioned at the selected match
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	TRUE if the signal has been handled

	-- Since 2.4


	-- Details
	-- GtkEntryCompletion

	-- typedef struct _GtkEntryCompletion GtkEntryCompletion;

	-- The GtkEntryCompletion struct contains only private data.
	-- GtkEntryCompletionMatchFunc ()

	-- gboolean    (*GtkEntryCompletionMatchFunc)  (GtkEntryCompletion *completion,
	--                                              const gchar *key,
	--                                              GtkTreeIter *iter,
	--                                              gpointer user_data);

	-- A function which decides whether the row indicated by iter matches a given key, and should be displayed as a possible completion for key. Note that key is normalized and case-folded (see g_utf8_normalize() and g_utf8_casefold()). If this is not appropriate, match functions have access to the unmodified key via gtk_entry_get_text (GTK_ENTRY (gtk_entry_completion_get_entry ())).
	-- completion : 	the GtkEntryCompletion
	-- key : 	the string to match, normalized and case-folded
	-- iter : 	a GtkTreeIter indicating the row to match
	-- user_data : 	user data given to gtk_entry_completion_set_match_func()
	-- Returns : 	TRUE if iter should be displayed as a possible completion for key
feature
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkEntryCompletion)"
		end

end -- class GTK_ENTRY_COMPLETION
