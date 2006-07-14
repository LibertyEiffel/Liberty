indexing
	description: "Layout Objects -- Highlevel layout driver objects"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, Pango team
					
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

class PANGO_LAYOUT

inherit
	G_OBJECT
		rename make as g_object_make end

insert
	PANGO_LAYOUT_EXTERNALS
	G_OBJECT_RETRIEVER [PANGO_CONTEXT]
		rename retrieve_eiffel_wrapper_from_gobject_pointer as retrieve_context end
	PANGO_WRAP_MODE
	PANGO_ALIGNMENT

creation make, from_external_pointer

feature {NONE} -- Creation

	make (a_context: PANGO_CONTEXT) is
			-- Create a new PANGO_LAYOUT object with attributes initialized to
			-- default values for a particular PANGO_CONTEXT.
		do
			from_external_pointer (pango_layout_new (a_context.handle))
		end

feature -- size

	size: INTEGER is
			-- This returns the size of the underlaying C structure in bytes.
			-- To obtain the size of the layout in pixels you want layout_size
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PangoLayout)"
		end

feature -- Access

	context: PANGO_CONTEXT is
			-- Retrieves the PANGO_CONTEXT used for this layout.
		local
			context_pointer: POINTER
		do
			context_pointer := pango_layout_get_context(handle)
			if has_eiffel_wrapper_stored (context_pointer) then
				Result := retrieve_context (context_pointer)
			else
				create Result.from_external_pointer (context_pointer)
			end
		end

	text: STRING is
			-- Gets the text in the layout.
		do
			create Result.from_external_copy (pango_layout_get_text (handle))
		end

	layout_size: TUPLE [INTEGER, INTEGER] is
			-- Determines the logical width and height of a PANGO_LAYOUT in
			-- Pango units. (device units scaled by PANGO_SCALE). This is
			-- simply a convenience function around get_extents.
		local
			a_width, a_height: INTEGER
		do
			pango_layout_get_size (handle, $a_width, $a_height)
			Result := [a_width, a_height]
		end

	wrap: INTEGER is
			-- Gets the wrap mode for the layout.
		do
			Result := pango_layout_get_wrap (handle)
		ensure
			is_valid_pango_wrap_mode (Result)
		end

	width: INTEGER is
			-- Gets the width to which the lines of the PangoLayout should
			-- wrap.  Returns the width, or -1 if no width set.
		do
			Result := pango_layout_get_width (handle)
		ensure
			Result >= -1
		end

	alignment: INTEGER is
			-- Gets the alignment for the layout: how partial lines are
			-- positioned within the horizontal space available.
		do
			Result := pango_layout_get_alignment (handle)
		ensure
			is_valid_pango_alignment (Result)
		end

	justify: BOOLEAN is
			-- Gets whether each complete line should be stretched to fill
			-- the entire width of the layout.
		do
			Result := pango_layout_get_justify (handle).to_boolean
		end

feature -- Operations

	context_changed is
			-- Forces recomputation of any state in the PANGO_LAYOUT that
			-- might depend on the layout's context. This function should
			-- be called if you make changes to the context subsequent to
			-- creating the layout.
		do
			pango_layout_context_changed (handle)
		end

	set_text (a_text: STRING) is
			-- Sets the text of the layout.
		require
			valid_text: a_text /= Void
		do
			pango_layout_set_text (handle, a_text.to_external, a_text.count)
		end

	set_markup (a_markup: STRING) is
			-- Same as set_markup_with_accel(), but the markup text isn't
			-- scanned for accelerators.
		require
			valid_markup: a_markup /= Void
		do
			pango_layout_set_markup (handle, a_markup.to_external, a_markup.count);
		end

	set_markup_with_accel (a_markup: STRING; accel_marker, accel_char: INTEGER) is
			-- Sets the layout text and attribute list from marked-up text
			-- (see markup format). Replaces the current text and attribute list.
			--
			-- If accel_marker is nonzero, the given character will mark the
			-- character following it as an accelerator. For example, the accel
			-- marker might be an ampersand or underscore. All characters
			-- marked as an accelerator will receive a PANGO_UNDERLINE_LOW
			-- attribute, and the first character so marked will be returned
			-- in accel_char. Two accel_marker characters following each other
			-- produce a single literal accel_marker character.
		do
			check unimplemented: False end
		end

	set_wrap (a_wrap_mode: INTEGER) is
			-- Sets the wrap mode; the wrap mode only has effect if a width
			-- is set on the layout with set_width(). To turn off wrapping,
			-- set the width to -1.
		require
			is_valid_pango_wrap_mode (a_wrap_mode)
		do
			pango_layout_set_wrap (handle, a_wrap_mode)
		end

	set_width (a_width: INTEGER) is
			-- Sets the width to which the lines of the PangoLayout should
			-- wrap.  The desired width should be in Pango units, or -1 to
			-- indicate that no wrapping should be performed.
		require
			a_width >= -1
		do
			pango_layout_set_width (handle, a_width)
		ensure
			width = a_width
		end

	set_alignment (an_alignment: INTEGER) is
			-- Sets the alignment for the layout: how partial lines are
			-- positioned within the horizontal space available.
		require
			is_valid_pango_alignment (an_alignment)
		do
			pango_layout_set_alignment (handle, an_alignment)
		end

	set_justify (a_justify: BOOLEAN) is
			-- Sets whether each complete line should be stretched to fill
			-- the entire width of the layout. This stretching is typically
			-- done by adding whitespace, but for some scripts (such as
			-- Arabic), the justification may be done in more complex ways,
			-- like extending the characters.
			--
			-- Note that as of Pango-1.10, this functionality is not yet
			-- implemented.
		do
			pango_layout_set_justify (handle, a_justify.to_integer)
		ensure
			justify = a_justify
		end

end -- class PANGO_LAYOUT
