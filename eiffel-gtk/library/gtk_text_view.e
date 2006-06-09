indexing
	description: "Multiline text view widget"
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

class GTK_TEXT_VIEW

inherit GTK_CONTAINER

insert GTK_TEXT_VIEW_EXTERNALS

creation
	make, make_with_buffer, from_external_pointer

feature {NONE} -- Creation

	make is
			-- Creates a new GTK_TEXT_VIEW. If you don't call
			-- `set_buffer' before using the text view, an empty
			-- default buffer will be created for you. Get
			-- the buffer with `get_buffer'. If you want to
			-- specify your own buffer, consider `make_with_buffer'.
		do
			handle := gtk_text_view_new
			store_eiffel_wrapper
		end

	make_with_buffer (a_buffer: GTK_TEXT_BUFFER) is
			-- Creates a new GTK_TEXT_VIEW widget displaying the buffer
			-- `a_buffer'. One buffer can be shared among many widgets.
			-- `a_buffer' may be Void to create a default buffer, in which
			-- case this function is equivalent to `make'.
			-- The text view adds its own reference count to the buffer;
			-- it does not take over an existing reference.
		do
			handle := gtk_text_view_new_with_buffer (a_buffer.handle)
			store_eiffel_wrapper
		end

feature -- Operations

	set_buffer (a_buffer: GTK_TEXT_BUFFER) is
			-- Sets `a_buffer' as the buffer being displayed.
			-- The previous buffer displayed by the text view is unreferenced,
			-- and a reference is added to `a_buffer'.
			-- If you owned a reference to `a_buffer' before passing it
			-- to this function, you must remove that reference yourself;
			-- GTK_TEXT_VIEW will not "adopt" it.
		require
			buffer_not_null: a_buffer /= Void
		do
			gtk_text_view_set_buffer (handle, a_buffer.handle)
		ensure
			buffer_is_set: get_buffer /= Void -- XXX: is this ok?
		end

feature -- Access

	get_buffer: GTK_TEXT_BUFFER is
			-- Returns the GTK_TEXT_BUFFER being displayed by this text view.
			-- The reference count on the buffer is not incremented;
			-- the caller of this function won't own a new reference.
		do
			create Result.from_external_pointer (gtk_text_view_get_buffer (handle))
		end

feature -- Properties

--  "accepts-tab"          gboolean              : Read / Write
--  "buffer"               GtkTextBuffer         : Read / Write
--  "cursor-visible"       gboolean              : Read / Write
--  "editable"             gboolean              : Read / Write
--  "indent"               gint                  : Read / Write
--  "justification"        GtkJustification      : Read / Write
--  "left-margin"          gint                  : Read / Write
--  "overwrite"            gboolean              : Read / Write
--  "pixels-above-lines"   gint                  : Read / Write
--  "pixels-below-lines"   gint                  : Read / Write
--  "pixels-inside-wrap"   gint                  : Read / Write
--  "right-margin"         gint                  : Read / Write
--  "tabs"                 PangoTabArray         : Read / Write
--  "wrap-mode"            GtkWrapMode           : Read / Write

-- Style properties:
--  "error-underline-color" GdkColor              : Read


end -- class GTK_TEXT_VIEW
