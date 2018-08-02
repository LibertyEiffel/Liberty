note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Fonts (parent)
	--   Link: Font Options (previous)
	--   Link: Win32 Fonts (next)
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
	--   FreeType Fonts
	--
	--   FreeType Fonts -- Font support for FreeType
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_font_face_t* cairo_ft_font_face_create_for_ft_face
	--                                             (FT_Face face,
	--                                              int load_flags);
	-- cairo_font_face_t* cairo_ft_font_face_create_for_pattern
	--                                             (FcPattern *pattern);
	-- void        cairo_ft_font_options_substitute
	--                                             (const cairo_font_options_t *options,
	--                                              FcPattern *pattern);
	-- FT_Face     cairo_ft_scaled_font_lock_face  (cairo_scaled_font_t *scaled_font);
	-- void        cairo_ft_scaled_font_unlock_face
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--Description
	--
	--Details
	--
	--  cairo_ft_font_face_create_for_ft_face ()
	--
	-- cairo_font_face_t* cairo_ft_font_face_create_for_ft_face
	--                                             (FT_Face face,
	--                                              int load_flags);
	--
	--   Creates a new font face for the FreeType font backend from a pre-opened
	--   FreeType face. This font can then be used with cairo_set_font_face() or
	--   cairo_scaled_font_create(). The cairo_scaled_font_t returned from
	--   cairo_scaled_font_create() is also for the FreeType backend and can be
	--   used with functions such as cairo_ft_font_lock_face().
	--
	--   face :       A FreeType face object, already opened. This must be kept
	--                around until the face's ref_count drops to zero and it is
	--                freed. Since the face may be referenced internally to Cairo,
	--                the best way to determine when it is safe to free the face is
	--                to pass a cairo_destroy_func_t to
	--                cairo_font_face_set_user_data()
	--   load_flags : flags to pass to FT_Load_Glyph when loading glyphs from the
	--                font. These flags are OR'ed together with the flags derived
	--                from the cairo_font_options_t passed to
	--                cairo_scaled_font_create(), so only a few values such as
	--                FT_LOAD_VERTICAL_LAYOUT, and FT_LOAD_FORCE_AUTOHINT are
	--                useful. You should not pass any of the flags affecting the
	--                load target, such as FT_LOAD_TARGET_LIGHT.
	--   Returns :    a newly created cairo_font_face_t. Free with
	--                cairo_font_face_destroy() when you are done using it.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ft_font_face_create_for_pattern ()
	--
	-- cairo_font_face_t* cairo_ft_font_face_create_for_pattern
	--                                             (FcPattern *pattern);
	--
	--   Creates a new font face for the FreeType font backend based on a
	--   fontconfig pattern. This font can then be used with cairo_set_font_face()
	--   or cairo_scaled_font_create(). The cairo_scaled_font_t returned from
	--   cairo_scaled_font_create() is also for the FreeType backend and can be
	--   used with functions such as cairo_ft_font_lock_face().
	--
	--   Font rendering options are representated both here and when you call
	--   cairo_scaled_font_create(). Font options that have a representation in a
	--   FcPattern must be passed in here; to modify FcPattern appropriately to
	--   reflect the options in a cairo_font_options_t, call
	--   cairo_ft_font_options_substitute().
	--
	--   pattern : A fully resolved fontconfig pattern. A pattern can be resolved,
	--             by, among other things, calling FcConfigSubstitute(),
	--             FcDefaultSubstitute(), then FcFontMatch(). Cairo will call
	--             FcPatternReference() on this pattern, so you should not further
	--             modify the pattern, but you can release your reference to the
	--             pattern with FcPatternDestroy() if you no longer need to access
	--             it.
	--   Returns : a newly created cairo_font_face_t. Free with
	--             cairo_font_face_destroy() when you are done using it.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ft_font_options_substitute ()
	--
	-- void        cairo_ft_font_options_substitute
	--                                             (const cairo_font_options_t *options,
	--                                              FcPattern *pattern);
	--
	--   Add options to a FcPattern based on a cairo_font_options_t font options
	--   object. Options that are already in the pattern, are not overriden, so you
	--   should call this function after calling FcConfigSubstitute() (the user's
	--   settings should override options based on the surface type), but before
	--   calling FcDefaultSubstitute().
	--
	--   options : a cairo_font_options_t object
	--   pattern : an existing FcPattern
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ft_scaled_font_lock_face ()
	--
	-- FT_Face     cairo_ft_scaled_font_lock_face  (cairo_scaled_font_t *scaled_font);
	--
	--   cairo_ft_font_lock_face() gets the FT_Face object from a FreeType backend
	--   font and scales it appropriately for the font. You must release the face
	--   with cairo_ft_font_unlock_face() when you are done using it. Since the
	--   FT_Face object can be shared between multiple cairo_scaled_font_t objects,
	--   you must not lock any other font objects until you unlock this one. A
	--   count is kept of the number of times cairo_ft_font_lock_face() is called.
	--   cairo_ft_font_unlock_face() must be called the same number of times.
	--
	--   You must be careful when using this function in a library or in a threaded
	--   application, because other threads may lock faces that share the same
	--   FT_Face object. For this reason, you must call cairo_ft_lock() before
	--   locking any face objects, and cairo_ft_unlock() after you are done. (These
	--   functions are not yet implemented, so this function cannot be currently
	--   safely used in a threaded application.)
	--
	--   scaled_font : A cairo_scaled_font_t from the FreeType font backend. Such
	--                 an object can be created by calling
	--                 cairo_scaled_font_create() on a FreeType backend font face
	--                 (see cairo_ft_font_face_create_for_pattern(),
	--                 cairo_ft_font_face_create_for_face()).
	--   Returns :     The FT_Face object for font, scaled appropriately, or NULL
	--                 if scaled_font is in an error state (see
	--                 cairo_scaled_font_status()) or there is insufficient memory.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ft_scaled_font_unlock_face ()
	--
	-- void        cairo_ft_scaled_font_unlock_face
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--   Releases a face obtained with cairo_ft_scaled_font_lock_face().
	--
	--   scaled_font : A cairo_scaled_font_t from the FreeType font backend. Such
	--                 an object can be created by calling
	--                 cairo_scaled_font_create() on a FreeType backend font face
	--                 (see cairo_ft_font_face_create_for_pattern(),
	--                 cairo_ft_font_face_create_for_ft_face()).

end -- class FOO
