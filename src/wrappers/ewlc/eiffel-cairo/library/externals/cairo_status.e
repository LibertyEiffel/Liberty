note
	description: "enum cairo_status_t"
	copyright: "[
					Copyright (C) 2006-2018: Soluciones Informaticas Libres S.A. (Except),
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

deferred class CAIRO_STATUS

inherit ANY undefine is_equal, copy end

	-- CAIRO_STATUS is used to indicate errors that can occur when using Cairo.
	-- In some cases it is returned directly by functions. but when using a
	-- CAIRO_CONTEXT, the last error, if any, is stored in the context and can
	-- be retrieved with 'status'.
	--
	-- New entries may be added in future versions. Use 'status_to_string' to
	-- get a human-readable representation of an error message.

feature {ANY}

	is_valid_cairo_status (a_status: INTEGER): BOOLEAN
		do
			Result := a_status.in_range (cairo_status_success,
			                             cairo_status_invalid_dash)
		end

	cairo_status_success: INTEGER
			-- no error has occurred
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_SUCCESS"
		end

	cairo_status_no_memory: INTEGER
			-- out of memory
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_NO_MEMORY"
		end

	cairo_status_invalid_restore: INTEGER
			-- cairo_restore without matching cairo_save
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_RESTORE"
		end

	cairo_status_invalid_pop_group: INTEGER
			-- no saved group to pop
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_POP_GROUP"
		end

	cairo_status_no_current_point: INTEGER
			-- no current point defined
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_NO_CURRENT_POINT"
		end

	cairo_status_invalid_matrix: INTEGER
			-- invalid matrix (not invertible)
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_MATRIX"
		end

	cairo_status_invalid_status: INTEGER
			-- invalid value for an input cairo_status_t
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_STATUS"
		end

	cairo_status_null_pointer: INTEGER
			-- NULL pointer
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_NULL_POINTER"
		end

	cairo_status_invalid_string: INTEGER
			-- input string not valid UTF-8
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_STRING"
		end

	cairo_status_invalid_path_data: INTEGER
			-- input path data not valid
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_PATH_DATA"
		end

	cairo_status_read_error: INTEGER
			-- error while reading from input stream
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_READ_ERROR"
		end

	cairo_status_write_error: INTEGER
			-- error while writing to output stream
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_WRITE_ERROR"
		end

	cairo_status_surface_finished: INTEGER
			-- target surface has been finished
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_SURFACE_FINISHED"
		end

	cairo_status_surface_type_mismatch: INTEGER
			-- the surface type is not appropriate for the operation
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_SURFACE_TYPE_MISMATCH"
		end

	cairo_status_pattern_type_mismatch: INTEGER
			-- the pattern type is not appropriate for the operation
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_PATTERN_TYPE_MISMATCH"
		end

	cairo_status_invalid_content: INTEGER
			-- invalid value for an input cairo_content_t
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_CONTENT"
		end

	cairo_status_invalid_format: INTEGER
			-- invalid value for an input cairo_format_t
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_FORMAT"
		end

	cairo_status_invalid_visual: INTEGER
			-- invalid value for an input Visual*
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_VISUAL"
		end

	cairo_status_file_not_found: INTEGER
			-- file not found
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_FILE_NOT_FOUND"
		end

	cairo_status_invalid_dash: INTEGER
			-- invalid value for a dash setting
		external "C macro use <cairo.h>"
		alias "CAIRO_STATUS_INVALID_DASH"
		end

--  In version 1.2
--	cairo_status_invalid_dsc_comment: INTEGER is
--			-- invalid value for a DSC comment (Since 1.2)
--		external "C macro use <cairo.h>"
--		alias "CAIRO_STATUS_INVALID_DSC_COMMENT"
--		end

--  In version 1.2
--	cairo_status_invalid_index: INTEGER is
--			-- invalid index passed to getter (Since 1.4)
--		external "C macro use <cairo.h>"
--		alias "CAIRO_STATUS_INVALID_INDEX"
--		end

--  In version 1.4
--	cairo_status_clip_not_representable: INTEGER is
--			-- clip region not representable in desired format (Since 1.4)
--		external "C macro use <cairo.h>"
--		alias "CAIRO_STATUS_CLIP_NOT_REPRESENTABLE"
--		end

	cairo_status_to_string (a_status: INTEGER): POINTER
			-- Don't call this method directly, use status_to_string instead!
		external "C use <cairo.h>"
		end
feature {ANY} -- Access

	status_to_string (a_status: INTEGER): STRING
			-- Provides a human-readable description of a cairo_status.
		require
			is_valid_cairo_status (a_status)
		do
			create Result.from_external_copy (cairo_status_to_string (a_status))
		end

end -- class CAIRO_STATUS
