note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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
	--   Link: Utilities (parent)
	--   Link: cairo_matrix_t (previous)
	--   Link: Version Information (next)
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
	--   Error handling
	--
	--   Error handling -- Decoding cairo's status
	--
	--Synopsis
	--
	--
	--
	--
	-- enum        cairo_status_t;
	-- const char* cairo_status_to_string          (cairo_status_t status);
	-- void        cairo_debug_reset_static_data   (void);
	--
	--Description
	--
	--Details
	--
	--  enum cairo_status_t
	--
	-- typedef enum _cairo_status {
	--     CAIRO_STATUS_SUCCESS = 0,
	--     CAIRO_STATUS_NO_MEMORY,
	--     CAIRO_STATUS_INVALID_RESTORE,
	--     CAIRO_STATUS_INVALID_POP_GROUP,
	--     CAIRO_STATUS_NO_CURRENT_POINT,
	--     CAIRO_STATUS_INVALID_MATRIX,
	--     CAIRO_STATUS_INVALID_STATUS,
	--     CAIRO_STATUS_NULL_POINTER,
	--     CAIRO_STATUS_INVALID_STRING,
	--     CAIRO_STATUS_INVALID_PATH_DATA,
	--     CAIRO_STATUS_READ_ERROR,
	--     CAIRO_STATUS_WRITE_ERROR,
	--     CAIRO_STATUS_SURFACE_FINISHED,
	--     CAIRO_STATUS_SURFACE_TYPE_MISMATCH,
	--     CAIRO_STATUS_PATTERN_TYPE_MISMATCH,
	--     CAIRO_STATUS_INVALID_CONTENT,
	--     CAIRO_STATUS_INVALID_FORMAT,
	--     CAIRO_STATUS_INVALID_VISUAL,
	--     CAIRO_STATUS_FILE_NOT_FOUND,
	--     CAIRO_STATUS_INVALID_DASH,
	--     CAIRO_STATUS_INVALID_DSC_COMMENT
	-- } cairo_status_t;
	--
	--   cairo_status_t is used to indicate errors that can occur when using Cairo.
	--   In some cases it is returned directly by functions. but when using
	--   cairo_t, the last error, if any, is stored in the context and can be
	--   retrieved with cairo_status().
	--
	--   New entries may be added in future versions. Use cairo_status_to_string()
	--   to get a human-readable representation of an error message.
	--
	--   CAIRO_STATUS_SUCCESS               no error has occurred
	--   CAIRO_STATUS_NO_MEMORY             out of memory
	--   CAIRO_STATUS_INVALID_RESTORE       cairo_restore without matching
	--                                      cairo_save
	--   CAIRO_STATUS_INVALID_POP_GROUP     no saved group to pop
	--   CAIRO_STATUS_NO_CURRENT_POINT      no current point defined
	--   CAIRO_STATUS_INVALID_MATRIX        invalid matrix (not invertible)
	--   CAIRO_STATUS_INVALID_STATUS        invalid value for an input
	--                                      cairo_status_t
	--   CAIRO_STATUS_NULL_POINTER          NULL pointer
	--   CAIRO_STATUS_INVALID_STRING        input string not valid UTF-8
	--   CAIRO_STATUS_INVALID_PATH_DATA     input path data not valid
	--   CAIRO_STATUS_READ_ERROR            error while reading from input stream
	--   CAIRO_STATUS_WRITE_ERROR           error while writing to output stream
	--   CAIRO_STATUS_SURFACE_FINISHED      target surface has been finished
	--   CAIRO_STATUS_SURFACE_TYPE_MISMATCH the surface type is not appropriate for
	--                                      the operation
	--   CAIRO_STATUS_PATTERN_TYPE_MISMATCH the pattern type is not appropriate for
	--                                      the operation
	--   CAIRO_STATUS_INVALID_CONTENT       invalid value for an input
	--                                      cairo_content_t
	--   CAIRO_STATUS_INVALID_FORMAT        invalid value for an input
	--                                      cairo_format_t
	--   CAIRO_STATUS_INVALID_VISUAL        invalid value for an input Visual*
	--   CAIRO_STATUS_FILE_NOT_FOUND        file not found
	--   CAIRO_STATUS_INVALID_DASH          invalid value for a dash setting
	--   CAIRO_STATUS_INVALID_DSC_COMMENT   invalid value for a DSC comment (Since
	--                                      1.2)
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_status_to_string ()
	--
	-- const char* cairo_status_to_string          (cairo_status_t status);
	--
	--   Provides a human-readable description of a cairo_status_t.
	--
	--   status :  a cairo status
	--   Returns : a string representation of the status
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_debug_reset_static_data ()
	--
	-- void        cairo_debug_reset_static_data   (void);
	--
	--   Resets all static data within cairo to its original state, (ie. identical
	--   to the state at the time of program invocation). For example, all caches
	--   within cairo will be flushed empty.
	--
	--   This function is intended to be useful when using memory-checking tools
	--   such as valgrind. When valgrind's memcheck analyzes a cairo-using program
	--   without a call to cairo_debug_reset_static_data, it will report all data
	--   reachable via cairo's static objects as "still reachable". Calling
	--   cairo_debug_reset_static_data just prior to program termination will make
	--   it easier to get squeaky clean reports from valgrind.
	--
	--   WARNING: It is only safe to call this function when there are no active
	--   cairo objects remaining, (ie. the appropriate destroy functions have been
	--   called as necessary). If there are active cairo objects, this call is
	--   likely to cause a crash, (eg. an assertion failure due to a hash table
	--   being destroyed when non-empty).

end -- class FOO
