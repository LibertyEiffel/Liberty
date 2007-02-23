indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Fonts (parent)
	--   Link: Fonts (previous)
	--   Link: Scaled Fonts (next)
	--   Link: Part I. Tutorial (part)
	--   Link: Part II. Reference (part)
	--   Link: Drawing (chapter)
	--   Link: Fonts (chapter)
	--   Link: Surfaces (chapter)
	--   Link: Utilities (chapter)
	--   Link: Index (index)
	--   Link: Index of new symbols in 1.2 (index)
	--   Link: Appendix A. Creating a language binding for cairo (appendix)
	--
	--   Prev Up Home             Cairo: A Vector Graphics Library             Next
	--   Top  |  Description
	--
	--   cairo_font_face_t
	--
	--   cairo_font_face_t -- Base class for fonts
	--
	--Synopsis
	--
	--
	--
	--
	-- typedef     cairo_font_face_t;
	-- cairo_font_face_t* cairo_font_face_reference
	--                                             (cairo_font_face_t *font_face);
	-- void        cairo_font_face_destroy         (cairo_font_face_t *font_face);
	-- cairo_status_t cairo_font_face_status       (cairo_font_face_t *font_face);
	-- void*       cairo_font_face_get_user_data   (cairo_font_face_t *font_face,
	--                                              const cairo_user_data_key_t *key);
	-- cairo_status_t cairo_font_face_set_user_data
	--                                             (cairo_font_face_t *font_face,
	--                                              const cairo_user_data_key_t *key,
	--                                              void *user_data,
	--                                              cairo_destroy_func_t destroy);
	-- enum        cairo_font_type_t;
	-- cairo_font_type_t cairo_font_face_get_type  (cairo_font_face_t *font_face);
	--
	--Description
	--
	--Details
	--
	--  cairo_font_face_t
	--
	-- typedef struct _cairo_font_face cairo_font_face_t;
	--
	--   A cairo_font_face_t specifies all aspects of a font other than the size or
	--   font matrix (a font matrix is used to distort a font by sheering it or
	--   scaling it unequally in the two directions) . A font face can be set on a
	--   cairo_t by using cairo_set_font_face(); the size and font matrix are set
	--   with cairo_set_font_size() and cairo_set_font_matrix().
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_face_reference ()
	--
	-- cairo_font_face_t* cairo_font_face_reference
	--                                             (cairo_font_face_t *font_face);
	--
	--   Increases the reference count on font_face by one. This prevents font_face
	--   from being destroyed until a matching call to cairo_font_face_destroy() is
	--   made.
	--
	--   font_face : a cairo_font_face_t, (may be NULL in which case this function
	--               does nothing).
	--   Returns :   the referenced cairo_font_face_t.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_face_destroy ()
	--
	-- void        cairo_font_face_destroy         (cairo_font_face_t *font_face);
	--
	--   Decreases the reference count on font_face by one. If the result is zero,
	--   then font_face and all associated resources are freed. See
	--   cairo_font_face_reference().
	--
	--   font_face : a cairo_font_face_t
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_face_status ()
	--
	-- cairo_status_t cairo_font_face_status       (cairo_font_face_t *font_face);
	--
	--   Checks whether an error has previously occurred for this font face
	--
	--   font_face : a cairo_font_face_t
	--   Returns :   CAIRO_STATUS_SUCCESS or another error such as
	--               CAIRO_STATUS_NO_MEMORY.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_face_get_user_data ()
	--
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
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_face_set_user_data ()
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
	--   --------------------------------------------------------------------------
	--
	--  enum cairo_font_type_t
	--
	-- typedef enum _cairo_font_type {
	--     CAIRO_FONT_TYPE_TOY,
	--     CAIRO_FONT_TYPE_FT,
	--     CAIRO_FONT_TYPE_WIN32,
	--     CAIRO_FONT_TYPE_ATSUI
	-- } cairo_font_type_t;
	--
	--   cairo_font_type_t is used to describe the type of a given font face or
	--   scaled font. The font types are also known as "font backends" within
	--   cairo.
	--
	--   The type of a font face is determined by the function used to create it,
	--   which will generally be of the form cairo_type_font_face_create. The font
	--   face type can be queried with cairo_font_face_get_type()
	--
	--   The various cairo_font_face functions can be used with a font face of any
	--   type.
	--
	--   The type of a scaled font is determined by the type of the font face
	--   passed to cairo_scaled_font_create. The scaled font type can be queried
	--   with cairo_scaled_font_get_type()
	--
	--   The various cairo_scaled_font functions can be used with scaled fonts of
	--   any type, but some font backends also provide type-specific functions that
	--   must only be called with a scaled font of the appropriate type. These
	--   functions have names that begin with cairo_type_scaled_font such as
	--   cairo_ft_scaled_font_lock_face.
	--
	--   The behavior of calling a type-specific function with a scaled font of the
	--   wrong type is undefined.
	--
	--   New entries may be added in future versions.
	--
	--   CAIRO_FONT_TYPE_TOY   The font was created using cairo's toy font api
	--   CAIRO_FONT_TYPE_FT    The font is of type FreeType
	--   CAIRO_FONT_TYPE_WIN32 The font is of type Win32
	--   CAIRO_FONT_TYPE_ATSUI The font is of type ATSUI
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_face_get_type ()
	--
	-- cairo_font_type_t cairo_font_face_get_type  (cairo_font_face_t *font_face);
	--
	--   This function returns the type of the backend used to create a font face.
	--   See cairo_font_type_t for available types.
	--
	--   font_face : a cairo_font_face_t
	--   Returns :   The type of font_face.
	--
	--   Since 1.2

end -- class FOO
