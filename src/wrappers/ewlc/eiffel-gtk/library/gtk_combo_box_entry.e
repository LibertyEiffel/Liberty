note
	description: "GtkComboBoxEntry -- A text entry field with a dropdown list."
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
					
class GTK_COMBO_BOX_ENTRY
	--A GtkComboBoxEntry is a widget that allows the user to choose
	-- from a list of valid choices or enter a different value. It is
	-- very similar to a GtkComboBox, but it displays the selected
	-- value in an entry to allow modifying it.

	-- In contrast to a GtkComboBox, the underlying model of a
	-- GtkComboBoxEntry must always have a text column (see
	-- `set_text_column'), and the entry will show the content of the
	-- text column in the selected row. To get the text from the entry,
	-- use `active_text'.

	-- The changed signal will be emitted while typing into a
	-- GtkComboBoxEntry, as well as when selecting an item from the
	-- GtkComboBoxEntry's list. Use `active_row' or `active_iter' to
	-- discover whether an item was actually selected from the list.
	       
	-- Connect to the activate signal of the GtkEntry (use `child') to
	-- detect when the user actually finishes entering text.

	-- The convenience API to construct simple text-only GtkComboBoxes
	-- can also be used with GtkComboBoxEntrys which have been
	-- constructed with `with_text_only'.

inherit
	GTK_COMBO_BOX
		rename
			with_model as make_combo_box_with_model,
			child as entry
		export {} make_combo_box_with_model
		redefine make, with_text_only, struct_size, entry
		end
	-- GtkComboBoxEntry implements the same interfaces implemented by
	-- GtkComboBox, i.e.: AtkImplementorIface, GtkCellEditable and
	-- GtkCellLayout.

insert
	GTK_COMBO_BOX_ENTRY_EXTERNALS

create {ANY} make, with_model, with_text_only, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new GtkComboBoxEntry which has a GtkEntry as
			-- child. After construction, you should set a model using
			-- `set_model' and a text_column using
			-- `set_text_column'.
		do
			from_external_pointer (gtk_combo_box_entry_new)
		end

	with_model (a_model: GTK_TREE_MODEL; a_text_column: INTEGER)
			-- Creates a new GtkComboBoxEntry which has a GtkEntry as
			-- child and a list of strings as popup. You can get the
			-- GtkEntry from a GtkComboBoxEntry using `child'. To add and
			-- remove strings from the list, just modify model using its
			-- data manipulation API.
		do
			from_external_pointer (gtk_combo_box_entry_new_with_model (a_model.handle, a_text_column))
		end

	with_text_only
			-- Convenience function which constructs a new editable text
			-- combo box, which is a GtkComboBoxEntry just displaying
			-- strings. If you use this function to create a text combo
			-- box, you should only manipulate its data source with the
			-- following convenience functions: `append_text',
			-- `insert_text', `prepend_text' and `remove_text'.
		do
			from_external_pointer (gtk_combo_box_entry_new_text )
			is_text_only:=True
		ensure then text_only: is_text_only
		end

feature {ANY}
	set_text_column (a_column: INTEGER)
			-- Sets the model column which entry box should use to get
			-- strings from to be `a_column'.
		require valid_column: a_column >= -1
		do 
			gtk_combo_box_entry_set_text_column (handle, a_column)
		end

	text_column: INTEGER
			-- The column which entry box is using to get the strings from.
		do
			Result := gtk_combo_box_entry_get_text_column (handle)
		ensure valid: Result >= -1 
		end

feature {ANY}

	entry: GTK_ENTRY
		do
			if hidden_child_wrapper=Void then
				create hidden_child_wrapper.from_external_pointer (gtk_bin_get_child(handle))
			end
			Result := hidden_child_wrapper
		end

feature {} -- Implementation
	hidden_child_wrapper: GTK_ENTRY

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkComboBoxEntry)"
		end

end
