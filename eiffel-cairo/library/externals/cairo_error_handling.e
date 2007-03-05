indexing
	description: "Error handling — Decoding cairo's status "
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team, Cairo team
					
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

deferred class CAIRO_ERROR_HANDLING
	-- cairo_status_t is used to indicate errors that can occur when
	-- using Cairo. In some cases it is returned directly by
	-- functions. but when using cairo_t, the last error, if any, is
	-- stored in the context and can be retrieved with `status'.

	-- New entries may be added in future versions. Use
	-- `status_to_string' to get a human-readable representation of an
	-- error message.

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_status (a_status :INTEGER): BOOLEAN is
		do	
			Result:=((a_status=cairo_status_success) or else
						(a_status=cairo_status_no_memory) or else
						(a_status=cairo_status_invalid_restore) or else
						(a_status=cairo_status_invalid_pop_group) or else
						(a_status=cairo_status_no_current_point) or else
						(a_status=cairo_status_invalid_matrix) or else
						(a_status=cairo_status_invalid_status) or else
						(a_status=cairo_status_null_pointer) or else
						(a_status=cairo_status_invalid_string) or else
						(a_status=cairo_status_invalid_path_data) or else
						(a_status=cairo_status_read_error) or else
						(a_status=cairo_status_write_error) or else
						(a_status=cairo_status_surface_finished) or else
						(a_status=cairo_status_surface_type_mismatch) or else
						(a_status=cairo_status_pattern_type_mismatch) or else
						(a_status=cairo_status_invalid_content) or else
						(a_status=cairo_status_invalid_format) or else
						(a_status=cairo_status_invalid_visual) or else
						(a_status=cairo_status_file_not_found) or else
						(a_status=cairo_status_invalid_dash) or else
						(a_status=cairo_status_invalid_dsc_comment) or else
						(a_status=cairo_status_invalid_index) or else
						(a_status=cairo_status_clip_not_representable))
		end

	cairo_status_success: INTEGER is
			-- no error has occurred
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_SUCCESS"
		end

	cairo_status_no_memory: INTEGER is
			-- out of memory
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_NO_MEMORY"
		end

	cairo_status_invalid_restore: INTEGER is
			-- cairo_restore without matching cairo_save
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_RESTORE"
		end

	cairo_status_invalid_pop_group: INTEGER is
			-- no saved group to pop
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_POP_GROUP"
		end

	cairo_status_no_current_point: INTEGER is
			-- no current point defined
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_NO_CURRENT_POINT"
		end

	cairo_status_invalid_matrix: INTEGER is
			-- invalid matrix (not invertible)
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_MATRIX"
		end

	cairo_status_invalid_status: INTEGER is
			-- invalid value for an input cairo_status_t
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_STATUS"
		end

	cairo_status_null_pointer: INTEGER is
			-- NULL pointer
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_NULL_POINTER"
		end

	cairo_status_invalid_string: INTEGER is
			-- input string not valid UTF-8
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_STRING"
		end

	cairo_status_invalid_path_data: INTEGER is
			-- input path data not valid
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_PATH_DATA"
		end

	cairo_status_read_error: INTEGER is
			-- error while reading from input stream
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_READ_ERROR"
		end

	cairo_status_write_error: INTEGER is
			-- error while writing to output stream
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_WRITE_ERROR"
		end

	cairo_status_surface_finished: INTEGER is
			-- target surface has been finished
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_SURFACE_FINISHED"
		end

	cairo_status_surface_type_mismatch: INTEGER is
			-- the surface type is not appropriate for the operation
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_SURFACE_TYPE_MISMATCH"
		end

	cairo_status_pattern_type_mismatch: INTEGER is
			-- the pattern type is not appropriate for the operation
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_PATTERN_TYPE_MISMATCH"
		end

	cairo_status_invalid_content: INTEGER is
			-- invalid value for an input cairo_content_t
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_CONTENT"
		end

	cairo_status_invalid_format: INTEGER is
			-- invalid value for an input cairo_format_t
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_FORMAT"
		end

	cairo_status_invalid_visual: INTEGER is
			-- invalid value for an input Visual*
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_VISUAL"
		end

	cairo_status_file_not_found: INTEGER is
			-- file not found
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_FILE_NOT_FOUND"
		end

	cairo_status_invalid_dash: INTEGER is
			-- invalid value for a dash setting
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_DASH"
		end

	cairo_status_invalid_dsc_comment: INTEGER is
			-- invalid value for a DSC comment (Since 1.2)
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_DSC_COMMENT"
		end

	cairo_status_invalid_index: INTEGER is
			-- invalid index passed to getter (Since 1.4)
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_INVALID_INDEX"
		end

	cairo_status_clip_not_representable: INTEGER is
			-- clip region not representable in desired format (Since 1.4)
		external "C macro use <pango.h>"
		alias "CAIRO_STATUS_CLIP_NOT_REPRESENTABLE"
		end

feature
	status_to_string (a_status: INTEGER): CONST_STRING is
			-- a human-readable description of a cairo_status_t.
		require valid_status: is_valid_status(a_status)
		do
			create Result.from_external(cairo_status_to_string(a_status))
		ensure not_void: Result/=Void
		end

	-- TODO: wrap - if necessary - cairo_debug_reset_static_data ()

	-- void cairo_debug_reset_static_data (void);
	
	-- Resets all static data within cairo to its original state,
	-- (ie. identical to the state at the time of program
	-- invocation). For example, all caches within cairo will be
	-- flushed empty.
	
	-- This function is intended to be useful when using
	-- memory-checking tools such as valgrind. When valgrind's memcheck
	-- analyzes a cairo-using program without a call to
	-- cairo_debug_reset_static_data, it will report all data reachable
	-- via cairo's static objects as "still reachable". Calling
	-- cairo_debug_reset_static_data just prior to program termination
	-- will make it easier to get squeaky clean reports from valgrind.

	-- WARNING: It is only safe to call this function when there are no
	-- active cairo objects remaining, (ie. the appropriate destroy
	-- functions have been called as necessary). If there are active
	-- cairo objects, this call is likely to cause a crash, (eg. an
	-- assertion failure due to a hash table being destroyed when
	-- non-empty).

feature {}
	cairo_status_to_string (a_status: INTEGER) is
			-- const char* cairo_status_to_string (cairo_status_t
			-- status);
		external "C use <cairo.h>"
		end
	
	cairo_debug_reset_static_data is
			-- void cairo_debug_reset_static_data (void);
		external "C use <cairo.h>"
		end

end
