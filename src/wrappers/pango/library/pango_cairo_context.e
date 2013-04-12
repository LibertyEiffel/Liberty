indexing
	description: "PANGO_CAIRO_CONTEXT: A PangoContext created from a PangoCairoFontMap "
	copyright: "[
					Copyright (C) 2007 Soluciones Informaticas Libres S.A. (Except),
					Pango team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
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

class PANGO_CAIRO_CONTEXT

inherit
	PANGO_CONTEXT

insert
	PANGO_CAIRO_CONTEXT_EXTERNALS

create {ANY}
	from_external_pointer -- Only to be used by FontMaps

feature {ANY} -- Operations

	set_resolution (a_dpi: REAL) is
			-- Sets the resolution for the context. This is a scale factor
			-- between points specified in a PANGO_FONT_DESCRIPTION and Cairo
			-- units. The default value is 96, meaning that a 10 point font will
			-- be 13 units high. (10 * 96. / 72. = 13.3).
			--
			-- 'a_dpi' is the resolution in "dots per inch". (Physical inches
			-- aren't actually involved; the terminology is conventional.) A 0
			-- or negative value means to use the resolution from the font map.
		do
			pango_cairo_context_set_resolution (handle, a_dpi)
		end

	set_font_options (a_font_options: CAIRO_FONT_OPTIONS) is
			-- Sets the font options used when rendering text with this context.
			-- These options override any options that 'update' derives from the
			-- target surface.
			-- a_font_options can be Void to unset any previously set options.
		local
			fo_ptr: POINTER
		do
			if a_font_options /= Void then
				fo_ptr := a_font_options.handle
			end
			pango_cairo_context_set_font_options (handle, fo_ptr)
		end

	update (a_cairo: CAIRO_CONTEXT) is
			-- Updates a PangoContext previously created for use with Cairo to
			-- match the current transformation and target surface of a Cairo
			-- context. If any layouts have been created for the context, it's
			-- necessary to call 'context_changed' on those layouts.
		do
			pango_cairo_update_context (a_cairo.handle, handle)
		end

feature {ANY} -- Access

	font_options: CAIRO_FONT_OPTIONS is
			-- Font rendering options previously set with
			-- 'set_font_options'. These options does not report those
			-- derived from the target surface by 'update'.

			-- Returns the font options previously set on the context, or Void
			-- if no options have been set. This value is owned by the context
			-- and must not be modified!
		local
			fo_ptr: POINTER
		do
			fo_ptr := pango_cairo_get_font_options (handle)
			if fo_ptr.is_not_null then
				create Result.from_external_pointer (fo_ptr)
				Result.set_shared
			end
		end

	resolution: REAL is
			-- Gets the resolution for the context. See 'set_resolution'
			--
			-- Returns the resolution in "dots per inch". A negative value will
			-- be returned if no resolution has previously been set.
		do
			Result := pango_cairo_context_get_resolution  (handle)
		end

end -- class PANGO_CAIRO_CONTEXT
