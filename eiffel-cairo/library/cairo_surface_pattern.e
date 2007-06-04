indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Cairo team
					
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

class CAIRO_SURFACE_PATTERN

inherit CAIRO_PATTERN

creation make, from_external_pointer

feature {} -- Creation
	from_surface (a_surface: CAIRO_SURFACE) is
			-- Create a new cairo_pattern_t for the given surface.
		require surface_not_void: a_surface /= Void
		do
			from_external_pointer(cairo_pattern_create_for_surface(a_surface.handle))
			-- cairo_pattern_create_for_surface returns the newly created
			-- cairo_pattern_t if succesful, or an error pattern in case
			-- of no memory. The caller owns the returned object and
			-- should call cairo_pattern_destroy() when finished with
			-- it. This function will always return a valid pointer, but
			-- if an error occurred the pattern status will be set to an
			-- error.  To inspect the status of a pattern use
			-- cairo_pattern_status().
	end

feature 
	set_extend (an_extend: INTEGER) is
		do
			cairo_pattern_set_extend(handle,an_exte(cairo_pattern_t *pattern,
	--                                              cairo_extend_t extend);
	--
	--   Sets the mode to be used for drawing outside the area of a pattern. See
	--   cairo_extend_t for details on the semantics of each extend strategy.
	--
	--   pattern : a cairo_pattern_t
	--   extend :  a cairo_extend_t describing how the area outside of the pattern
	--             will be drawn
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pattern_get_extend ()
	--
	-- cairo_extend_t cairo_pattern_get_extend     (cairo_pattern_t *pattern);
	--
	--   Gets the current extend mode for a pattern. See cairo_extend_t for details
	--   on the semantics of each extend strategy.
	--
	--   pattern : a cairo_pattern_t
	--   Returns : the current extend strategy used for drawing the pattern.
	--
	--   --------------------------------------------------------------------------
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pattern_set_filter ()
	--
	-- void        cairo_pattern_set_filter        (cairo_pattern_t *pattern,
	--                                              cairo_filter_t filter);
	--
	--   pattern :
	--   filter :
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pattern_get_filter ()
	--
	-- cairo_filter_t cairo_pattern_get_filter     (cairo_pattern_t *pattern);
	--
	--   pattern :
	--   Returns :

end -- class CAIRO_SURFACE_PATTERN
