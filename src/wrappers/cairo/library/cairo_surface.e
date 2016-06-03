note
	description: "cairo_surface_t: base class for Cairo surfaces."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
											 Soluciones Informaticas Libres S.A. (Except),
											 Cairo team
					
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
	wrapped_version: "1.2.4"

class CAIRO_SURFACE
	-- A cairo_surface_t represents an image, either as the destination
	-- of a drawing operation or as source when drawing onto another
	-- surface. There are different subtypes of CAIRO_SURFACE for
	-- different drawing backends; for example, CAIRO_IMAGE_SURFACE is
	-- a bitmap image in memory.

inherit
	C_STRUCT 
	REFERENCE_COUNTED 

insert
	CAIRO_SURFACE_EXTERNALS
	CAIRO_SURFACE_TYPE
	CAIRO_STATUS
	CAIRO_CONTENT

create {ANY} make_similar, from_external_pointer

feature {ANY} -- Creation

	make_similar (another: CAIRO_SURFACE; a_content: INTEGER; a_width, an_height: INTEGER) is
			-- Create a new surface that is as compatible as possible
			-- with an existing surface. For example the new surface will
			-- have the same fallback resolution and font options as
			-- other. Generally, the new surface will also use the same
			-- backend as other, unless that is not possible for some
			-- reason. The type of the returned surface may be examined
			-- with `type'.

			-- Initially the surface contents are all 0 (transparent if
			-- contents have transparency, black otherwise.)

			-- `another': an existing surface used to select the backend
			-- of the new surface

			-- content : the content for the new surface

			-- a_width:   width of the new surface, (in device-space
			-- units)

			-- an_height :  height of the new surface (in device-space units)
		do
			from_external_pointer(cairo_surface_create_similar
										 (another.handle, a_content, a_width, an_height))
			-- cairo_surface_create_similar returns a pointer to the
			-- newly allocated surface. The caller owns the surface and
			-- should call cairo_surface_destroy when done with it.  This
			-- function always returns a valid pointer, but it will
			-- return a pointer to a "nil" surface if other is already in
			-- an error state or any other error occurs.
		end

feature {ANY} -- Operations

	finish is
			-- Finishes the surface and drops all references to external
			-- resources. For example, for the Xlib backend it means that
			-- cairo will no longer access the drawable, which can be
			-- freed. After calling `finish' the only valid operations on
			-- a surface are getting and setting user data and
			-- referencing and destroying it. Further drawing to the
			-- surface will not affect the surface but will instead
			-- trigger a `cairo_status_surface_finished' error.

			-- When the last call to `destroy' decreases the reference
			-- count to zero, cairo will call `finish' if it hasn't been
			-- called already, before freeing the resources associated
			-- with the surface.
		do
			cairo_surface_finish(handle)
		end

	flush is
			-- Do any pending drawing for the surface and also restore
			-- any temporary modification's cairo has made to the
			-- surface's state. This function must be called before
			-- switching from drawing on the surface with cairo to
			-- drawing on it directly with native APIs. If the surface
			-- doesn't support direct access, then this function does
			-- nothing.
		do
			cairo_surface_flush(handle)
		end

	font_options: CAIRO_FONT_OPTIONS is
			-- the default font rendering options for the surface. This
			-- allows display surfaces to report the correct subpixel
			-- order for rendering on them, print surfaces to disable
			-- hinting of metrics and so forth. The result can then be
			-- used to create a CAIRO_SCALED_FONT.
		do
			create Result.make
			cairo_surface_get_font_options (handle, Result.handle)
		end

	content: INTEGER is
			-- The content type of surface which indicates whether the
			-- surface contains color and/or alpha information. See
			-- CAIRO_CONTENT.
		do
			Result := cairo_surface_get_content (handle)
		ensure
			valid: is_valid_content (Result)
		end
	
	-- TODO: cairo_surface_set_user_data ()

	-- cairo_status_t cairo_surface_set_user_data  (cairo_surface_t *surface,
	--                                              const cairo_user_data_key_t *key,
	--                                              void *user_data,
	--                                              cairo_destroy_func_t destroy);

	--   Attach user data to surface. To remove user data from a surface, call this
	--   function with the key that was used to set it and NULL for data.

	--   surface :   a cairo_surface_t
	--   key :       the address of a cairo_user_data_key_t to attach the user data
	--               to
	--   user_data : the user data to attach to the surface
	--   destroy :   a cairo_destroy_func_t which will be called when the surface
	--               is destroyed or when new user data is attached using the same
	--               key.
	--   Returns :   CAIRO_STATUS_SUCCESS or CAIRO_STATUS_NO_MEMORY if a slot could
	--               not be allocated for the user data.

	--   --------------------------------------------------------------------------

	-- TODO:  cairo_surface_get_user_data ()

	-- void*       cairo_surface_get_user_data     (cairo_surface_t *surface,
	--                                              const cairo_user_data_key_t *key);

	--   Return user data previously attached to surface using the specified key.
	--   If no user data has been attached with the given key this function returns
	--   NULL.

	--   surface : a cairo_surface_t
	--   key :     the address of the cairo_user_data_key_t the user data was
	--             attached to
	--   Returns : the user data previously attached or NULL.

	mark_dirty is
			-- Tells cairo that drawing has been done to surface using
			-- means other than cairo, and that cairo should reread any
			-- cached areas. Note that you must call `flush' before doing
			-- such drawing.
		do
			cairo_surface_mark_dirty (handle)
		end

	mark_dirty_rectangle (an_x, an_y, a_width, an_height: INTEGER) is
			-- Like `mark_dirty', but drawing has been done only to the
			-- specified rectangle, so that cairo can retain cached
			-- contents for other parts of the surface.

			-- Any cached clip set on the surface will be reset by this
			-- function, to make sure that future cairo calls have the
			-- clip set that they expect.

			-- `an_x': X coordinate of dirty rectangle
			-- `an_y': Y coordinate of dirty rectangle
			-- `a_width': width of dirty rectangle
			-- `an_height': height of dirty rectangle
		do
			cairo_surface_mark_dirty_rectangle (handle, an_x, an_y, a_width, an_height)
		end

	set_device_offset (an_offset: CAIRO_POINT) is
			-- Sets an offset that is added to the device coordinates
			-- determined by the CTM when drawing to surface. One use
			-- case for this function is when we want to create a
			-- cairo_surface_t that redirects drawing for a portion of an
			-- onscreen surface to an offscreen surface in a way that is
			-- completely invisible to the user of the cairo API. Setting
			-- a transformation via `translate' isn't sufficient to do
			-- this, since functions like `device_to_user' will expose
			-- the hidden offset.

			-- Note that the offset affects drawing to the surface as
			-- well as using the surface in a source pattern.
		require
			offset_not_void: an_offset /= Void
		do
			cairo_surface_set_device_offset (handle, an_offset.x, an_offset.y)
		end

	device_offset: CAIRO_POINT is
		-- the device offset as set by `set_device_offset'.
		local
			an_x, an_y: REAL
		do
			cairo_surface_get_device_offset (handle, $an_x, $an_y)
			create Result.make(an_x,an_y)
		end

	set_fallback_resolution (x_pixels_per_inch, y_pixels_per_inch: REAL) is
			-- Set the horizontal and vertical resolution for image
			-- fallbacks.

			-- When certain operations aren't supported natively by a
			-- backend, cairo will fallback by rendering operations to an
			-- image and then overlaying that image onto the output. For
			-- backends that are natively vector-oriented, this function
			-- can be used to set the resolution used for these image
			-- fallbacks, (larger values will result in more detailed
			-- images, but also larger file sizes).

			-- Some examples of natively vector-oriented backends are the
			-- ps, pdf, and svg backends.

			-- For backends that are natively raster-oriented, image
			-- fallbacks are still possible, but they are always
			-- performed at the native device resolution.  So this
			-- function has no effect on those backends.

			-- NOTE: The fallback resolution only takes effect at the
			-- time of completing a page (with `show_page' or
			-- `copy_page') so there is currently no way to have more
			-- than one fallback resolution in effect on a single page.

			--   x_pixels_per_inch : horizontal setting for pixels per inch
			--   y_pixels_per_inch : vertical setting for pixels per inch
		do
			cairo_surface_set_fallback_resolution (handle, x_pixels_per_inch, y_pixels_per_inch)
		end

	status: INTEGER is
			-- Checks whether an error has previously occurred for this surface.
		do
			Result := cairo_surface_status (handle)
		ensure
			valid_result: is_valid_cairo_status (Result)
		end

feature {ANY} -- Memory handling
	ref is
			-- Increases the reference count on surface by one. This
			-- prevents surface from being destroyed until a matching
			-- call to `destroy' is made.
		local
			p: POINTER
		do
			p := cairo_surface_reference (handle)
			check p=handle end
		end

	unref is
			-- Decreases the reference count on surface by one. If the
			-- result is zero, then surface and all associated resources
			-- are freed. See `reference'.
		do
			cairo_surface_destroy(handle)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low-level features
		type: INTEGER is
			-- the type of the backend used to create a surface.  See
			-- CAIRO_SURFACE_TYPE for available types.
		do
			Result := cairo_surface_get_type (handle)
		ensure
			is_valid_surface_type (Result)
		end

end -- class CAIRO_SURFACE
