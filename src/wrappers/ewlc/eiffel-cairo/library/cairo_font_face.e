note
	description: "CAIRO_FONT_FACE -- Base class for fonts"
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

class CAIRO_FONT_FACE
	-- A cairo_font_face_t specifies all aspects of a font other than
	-- the size or font matrix (a font matrix is used to distort a font
	-- by sheering it or scaling it unequally in the two directions). A
	-- font face can be set on a CAIRO_CONTEXT by using
	-- `set_font_face'; the size and font matrix are set with
	-- `set_font_size' and `set_font_matrix'.

inherit
	C_STRUCT

insert
	CAIRO_FONT_FACE_EXTERNALS
	CAIRO_FONT_TYPE
	CAIRO_STATUS

create {ANY} from_external_pointer

feature {ANY} -- Memory handling
	dispose do unref end

	ref
			-- Increases the reference count on font_face by one. This
			-- prevents font_face from being destroyed until a matching
			-- call to CAIRO_FONT_FACE's `destroy' is made.
		local p: POINTER
		do
			p:=cairo_font_face_reference(handle)
		end

	unref
			-- Decreases the reference count on font_face by one. If the
			-- result is zero, then font_face and all associated
			-- resources are freed. See `reference'.
		do
			cairo_font_face_destroy(handle)
		end

feature {ANY}
	status: INTEGER
			-- The status of font face. Useful to check whether an error has previously occurred.
		do
			Result:=cairo_font_face_status(handle)
		ensure
			valid: is_valid_cairo_status (Result)
		end
	
	-- TODO: if necessary cairo_font_face_get_user_data ()

	-- void*       cairo_font_face_get_user_data   (cairo_font_face_t *font_face,
	--                                              const cairo_user_data_key_t *key);
	--
	--   Return user data previously attached to font_face using the specified key.
	--   If no user data has been attached with the given key this function returns
	--   NULL.
	--
	--   font_face : a cairo_font_face_t
	--   key :       the address of the cairo_user_data_key_t the user data was
	--               attached to
	--   Returns :   the user data previously attached or NULL.
	--

	-- TODO: if necessary cairo_font_face_set_user_data ()
	--
	-- cairo_status_t cairo_font_face_set_user_data
	--                                             (cairo_font_face_t *font_face,
	--                                              const cairo_user_data_key_t *key,
	--                                              void *user_data,
	--                                              cairo_destroy_func_t destroy);
	--
	--   Attach user data to font_face. To remove user data from a font face, call
	--   this function with the key that was used to set it and NULL for data.
	--
	--   font_face : a cairo_font_face_t
	--   key :       the address of a cairo_user_data_key_t to attach the user data
	--               to
	--   user_data : the user data to attach to the font face
	--   destroy :   a cairo_destroy_func_t which will be called when the font face
	--               is destroyed or when new user data is attached using the same
	--               key.
	--   Returns :   CAIRO_STATUS_SUCCESS or CAIRO_STATUS_NO_MEMORY if a slot could
	--               not be allocated for the user data.
	--
	--

feature {WRAPPER, WRAPPER_HANDLER}
	type: INTEGER
			-- The type of the backend used to create a font face.  See
			-- CAIRO_FONT_TYPE for available types.

			-- Note: this is useful only to provide wrappers of the 
			-- effective type.
		do
			Result:=cairo_font_face_get_type(handle)
		ensure valid: is_valid_font_type(Result)
		end

end -- class CAIRO_FONT_FACE
