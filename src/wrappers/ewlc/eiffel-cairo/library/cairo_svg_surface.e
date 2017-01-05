note
	description: "SVG Surfaces: Rendering SVG documents."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, Cairo team
					
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

	wrapped_version: "1.2.4"

class CAIRO_SVG_SURFACE

inherit CAIRO_SURFACE

insert CAIRO_SVG_VERSION
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_filename: STRING; a_width_in_points, an_height_in_points: REAL)
			-- Creates a SVG surface of the specified size in points to
			-- be written to filename.

			-- `a_filename' : a filename for the SVG output (must be
			-- writable)
		
			-- `a_width_in_points' : width of the surface, in points (1
			-- point == 1/72.0 inch)
		
			-- `an_height_in_points' : height of the surface, in points
			-- (1 point == 1/72.0 inch)
		require filename_not_void: a_filename/=Void
		do
			from_external_pointer(cairo_svg_surface_create
										 (a_filename.to_external, a_width_in_points, an_height_in_points))
			-- cairo_svg_surface_create returns a pointer to the newly
			-- created surface. The caller owns the surface and should
			-- call cairo_surface_destroy when done with it. This
			-- function always returns a valid pointer, but it will
			-- return a pointer to a "nil" surface if an error such as
			-- out of memory occurs. You can use cairo_surface_status()
			-- to check for this.
		end

	--  cairo_svg_surface_create_for_stream ()
	--
	-- cairo_surface_t* cairo_svg_surface_create_for_stream
	--                                             (cairo_write_func_t write_func,
	--                                              void *closure,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Creates a SVG surface of the specified size in points to be written
	--   incrementally to the stream represented by write_func and closure.
	--
	--   write_func :       a cairo_write_func_t to accept the output data
	--   closure :          the closure argument for write_func
	--   width_in_points :  width of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   height_in_points : height of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   Returns :          a pointer to the newly created surface. The caller owns
	--                      the surface and should call cairo_surface_destroy when
	--                      done with it. This function always returns a valid
	--                      pointer, but it will return a pointer to a "nil"
	--                      surface if an error such as out of memory occurs. You
	--                      can use cairo_surface_status() to check for this.
	--
	--   Since 1.2
	--
feature {ANY}
	restrict_to_version (a_version: INTEGER)
			-- Restricts the generated SVG file to version. See
			-- `versions' for a list of available version values that can
			-- be used here.

			-- This function should only be called before any drawing
			-- operations have been performed on the given surface. The
			-- simplest way to do this is to call this function
			-- immediately after creating the surface.
		require valid_version: is_valid_svg_version(a_version)
		do
			cairo_svg_surface_restrict_to_version(handle, a_version)
		end

	-- TODO versions: ARRAY[INTEGER] is
	--
	-- void        cairo_svg_get_versions          (cairo_svg_version_t const **versions,
	--                                              int *num_versions);
	--
	--   Used to retrieve the list of supported versions. See
	--   cairo_svg_surface_restrict_to_version().
	--
	--   versions :     supported version list
	--   num_versions : list length
	--
	--   Since 1.2
	--

	-- version_to_string ()
	--
	-- const char* cairo_svg_version_to_string     (cairo_svg_version_t version);
	--
	--   Get the string representation of the given version id. This function will
	--   return NULL if version isn't valid. See cairo_svg_get_versions() for a way
	--   to get the list of valid version ids.
	--
	--   version : a version id
	--   Returns : the string associated to given version.
	--
	--   Since 1.2
feature {}
	cairo_svg_surface_create (a_filename: POINTER; a_width_in_points, an_height_in_points: REAL): POINTER
			-- cairo_surface_t* cairo_svg_surface_create (const char
			-- *filename, double width_in_points, double
			-- height_in_points);
		external "C use <cairo.h>"
		end
	
	cairo_svg_surface_create_for_stream (a_write_func, a_closure: POINTER; a_width_in_points, an_height_in_points: REAL): POINTER
			-- cairo_surface_t* cairo_svg_surface_create_for_stream
			-- (cairo_write_func_t write_func, void *closure, double
			-- width_in_points, double height_in_points);
		external "C use <cairo.h>"
		end
	
	cairo_svg_surface_restrict_to_version (a_surface: POINTER; a_version: INTEGER)
			-- void cairo_svg_surface_restrict_to_version
			-- (cairo_surface_t *surface, cairo_svg_version_t version);
		external "C use <cairo.h>"
		end
	
	--	enum cairo_svg_version_t;
	cairo_svg_get_versions (some_versions, a_num_versions: POINTER)
			-- void cairo_svg_get_versions (cairo_svg_version_t const
			-- **versions, int *num_versions);
		external "C use <cairo.h>"
		end

	cairo_svg_version_to_string (a_version: INTEGER): POINTER
		--	const char* cairo_svg_version_to_string (cairo_svg_version_t
		--	version);
		external "C use <cairo.h>"
		end
end -- class CAIRO_SVG_SURFACE
