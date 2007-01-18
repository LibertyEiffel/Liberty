indexing
	description: "Features to handle GnomeVFSResult, the result of I/O operations, the equivalent of errno in C"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Gnome-VFS team
					
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

deferred class GNOME_VFS_RESULT

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_result (a_result :INTEGER): BOOLEAN is
		do	
			Result:=((a_result = gnome_vfs_ok) or else
						(a_result = gnome_vfs_error_not_found) or else
						(a_result = gnome_vfs_error_generic) or else
						(a_result = gnome_vfs_error_internal) or else
						(a_result = gnome_vfs_error_bad_parameters) or else
						(a_result = gnome_vfs_error_not_supported) or else
						(a_result = gnome_vfs_error_io) or else
						(a_result = gnome_vfs_error_corrupted_data) or else
						(a_result = gnome_vfs_error_wrong_format) or else
						(a_result = gnome_vfs_error_bad_file) or else
						(a_result = gnome_vfs_error_too_big) or else
						(a_result = gnome_vfs_error_no_space) or else
						(a_result = gnome_vfs_error_read_only) or else
						(a_result = gnome_vfs_error_invalid_uri) or else
						(a_result = gnome_vfs_error_not_open) or else
						(a_result = gnome_vfs_error_invalid_open_mode) or else
						(a_result = gnome_vfs_error_access_denied) or else
						(a_result = gnome_vfs_error_too_many_open_files) or else
						(a_result = gnome_vfs_error_eof) or else
						(a_result = gnome_vfs_error_not_a_directory) or else
						(a_result = gnome_vfs_error_in_progress) or else
						(a_result = gnome_vfs_error_interrupted) or else
						(a_result = gnome_vfs_error_file_exists) or else
						(a_result = gnome_vfs_error_loop) or else
						(a_result = gnome_vfs_error_not_permitted) or else
						(a_result = gnome_vfs_error_is_directory) or else
						(a_result = gnome_vfs_error_no_memory) or else
						(a_result = gnome_vfs_error_host_not_found) or else
						(a_result = gnome_vfs_error_invalid_host_name) or else
						(a_result = gnome_vfs_error_host_has_no_address) or else
						(a_result = gnome_vfs_error_login_failed) or else
						(a_result = gnome_vfs_error_cancelled) or else
						(a_result = gnome_vfs_error_directory_busy) or else
						(a_result = gnome_vfs_error_directory_not_empty) or else
						(a_result = gnome_vfs_error_too_many_links) or else
						(a_result = gnome_vfs_error_read_only_file_system) or else
						(a_result = gnome_vfs_error_not_same_file_system) or else
						(a_result = gnome_vfs_error_name_too_long) or else
						(a_result = gnome_vfs_error_service_not_available) or else
						(a_result = gnome_vfs_error_service_obsolete) or else
						(a_result = gnome_vfs_error_protocol_error) or else
						(a_result = gnome_vfs_error_no_master_browser) or else
						(a_result = gnome_vfs_error_no_default) or else
						(a_result = gnome_vfs_error_no_handler) or else
						(a_result = gnome_vfs_error_parse) or else
						(a_result = gnome_vfs_error_launch) or else
						(a_result = gnome_vfs_error_timeout) or else
						(a_result = gnome_vfs_error_nameserver) or else
						(a_result = gnome_vfs_error_locked) or else
						(a_result = gnome_vfs_error_deprecated_function) or else
						(a_result = gnome_vfs_num_errors))
 		end

	gnome_vfs_ok: INTEGER is
			-- GNOME_VFS_OK
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_OK"
		end

	gnome_vfs_error_not_found: INTEGER is
			-- GNOME_VFS_ERROR_NOT_FOUND
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NOT_FOUND"
		end
	
	gnome_vfs_error_generic: INTEGER is
			-- GNOME_VFS_ERROR_GENERIC
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_GENERIC"
		end

	gnome_vfs_error_internal: INTEGER is
			-- GNOME_VFS_ERROR_INTERNAL
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_INTERNAL"
		end

	gnome_vfs_error_bad_parameters: INTEGER is
			-- GNOME_VFS_ERROR_BAD_PARAMETERS
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_BAD_PARAMETERS"
		end

	gnome_vfs_error_not_supported: INTEGER is
			-- GNOME_VFS_ERROR_NOT_SUPPORTED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NOT_SUPPORTED"
		end

	gnome_vfs_error_io: INTEGER is
			-- GNOME_VFS_ERROR_IO
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_IO"
		end

	gnome_vfs_error_corrupted_data: INTEGER is
			-- GNOME_VFS_ERROR_CORRUPTED_DATA
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_CORRUPTED_DATA"
		end

	gnome_vfs_error_wrong_format: INTEGER is
			-- GNOME_VFS_ERROR_WRONG_FORMAT
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_WRONG_FORMAT"
		end

	gnome_vfs_error_bad_file: INTEGER is
			-- GNOME_VFS_ERROR_BAD_FILE
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_BAD_FILE"
		end

	gnome_vfs_error_too_big: INTEGER is
			-- GNOME_VFS_ERROR_TOO_BIG
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_TOO_BIG"
		end

	gnome_vfs_error_no_space: INTEGER is
			-- GNOME_VFS_ERROR_NO_SPACE
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NO_SPACE"
		end

	gnome_vfs_error_read_only: INTEGER is
			-- GNOME_VFS_ERROR_READ_ONLY
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_READ_ONLY"
		end

	gnome_vfs_error_invalid_uri: INTEGER is
			-- GNOME_VFS_ERROR_INVALID_URI
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_INVALID_URI"
		end

	gnome_vfs_error_not_open: INTEGER is
			-- GNOME_VFS_ERROR_NOT_OPEN
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NOT_OPEN"
		end

	gnome_vfs_error_invalid_open_mode: INTEGER is
			-- GNOME_VFS_ERROR_INVALID_OPEN_MODE
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_INVALID_OPEN_MODE"
		end

	gnome_vfs_error_access_denied: INTEGER is
			-- GNOME_VFS_ERROR_ACCESS_DENIED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_ACCESS_DENIED"
		end

	gnome_vfs_error_too_many_open_files: INTEGER is
			-- GNOME_VFS_ERROR_TOO_MANY_OPEN_FILES
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_TOO_MANY_OPEN_FILES"
		end

	gnome_vfs_error_eof: INTEGER is
			-- GNOME_VFS_ERROR_EOF
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_EOF"
		end

	gnome_vfs_error_not_a_directory: INTEGER is
			-- GNOME_VFS_ERROR_NOT_A_DIRECTORY
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NOT_A_DIRECTORY"
		end

	gnome_vfs_error_in_progress: INTEGER is
			-- GNOME_VFS_ERROR_IN_PROGRESS
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_IN_PROGRESS"
		end

	gnome_vfs_error_interrupted: INTEGER is
			-- GNOME_VFS_ERROR_INTERRUPTED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_INTERRUPTED"
		end

	gnome_vfs_error_file_exists: INTEGER is
			-- GNOME_VFS_ERROR_FILE_EXISTS
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_FILE_EXISTS"
		end

	gnome_vfs_error_loop: INTEGER is
			-- GNOME_VFS_ERROR_LOOP
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_LOOP"
		end

	gnome_vfs_error_not_permitted: INTEGER is
			-- GNOME_VFS_ERROR_NOT_PERMITTED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NOT_PERMITTED"
		end

	gnome_vfs_error_is_directory: INTEGER is
			-- GNOME_VFS_ERROR_IS_DIRECTORY
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_IS_DIRECTORY"
		end

	gnome_vfs_error_no_memory: INTEGER is
			-- GNOME_VFS_ERROR_NO_MEMORY
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NO_MEMORY"
		end

	gnome_vfs_error_host_not_found: INTEGER is
			-- GNOME_VFS_ERROR_HOST_NOT_FOUND
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_HOST_NOT_FOUND"
		end

	gnome_vfs_error_invalid_host_name: INTEGER is
			-- GNOME_VFS_ERROR_INVALID_HOST_NAME
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_INVALID_HOST_NAME"
		end

	gnome_vfs_error_host_has_no_address: INTEGER is
			-- GNOME_VFS_ERROR_HOST_HAS_NO_ADDRESS
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_HOST_HAS_NO_ADDRESS"
		end

	gnome_vfs_error_login_failed: INTEGER is
			-- GNOME_VFS_ERROR_LOGIN_FAILED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_LOGIN_FAILED"
		end

	gnome_vfs_error_cancelled: INTEGER is
			-- GNOME_VFS_ERROR_CANCELLED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_CANCELLED"
		end

	gnome_vfs_error_directory_busy: INTEGER is
			-- GNOME_VFS_ERROR_DIRECTORY_BUSY
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_DIRECTORY_BUSY"
		end

	gnome_vfs_error_directory_not_empty: INTEGER is
			-- GNOME_VFS_ERROR_DIRECTORY_NOT_EMPTY
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_DIRECTORY_NOT_EMPTY"
		end

	gnome_vfs_error_too_many_links: INTEGER is
			-- GNOME_VFS_ERROR_TOO_MANY_LINKS
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_TOO_MANY_LINKS"
		end

	gnome_vfs_error_read_only_file_system: INTEGER is
			-- GNOME_VFS_ERROR_READ_ONLY_FILE_SYSTEM
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_READ_ONLY_FILE_SYSTEM"
		end

	gnome_vfs_error_not_same_file_system: INTEGER is
			-- GNOME_VFS_ERROR_NOT_SAME_FILE_SYSTEM
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NOT_SAME_FILE_SYSTEM"
		end

	gnome_vfs_error_name_too_long: INTEGER is
			-- GNOME_VFS_ERROR_NAME_TOO_LONG
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NAME_TOO_LONG"
		end

	gnome_vfs_error_service_not_available: INTEGER is
			-- GNOME_VFS_ERROR_SERVICE_NOT_AVAILABLE
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_SERVICE_NOT_AVAILABLE"
		end

	gnome_vfs_error_service_obsolete: INTEGER is
			-- GNOME_VFS_ERROR_SERVICE_OBSOLETE
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_SERVICE_OBSOLETE"
		end

	gnome_vfs_error_protocol_error: INTEGER is
			-- GNOME_VFS_ERROR_PROTOCOL_ERROR
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_PROTOCOL_ERROR"
		end

	gnome_vfs_error_no_master_browser: INTEGER is
			-- GNOME_VFS_ERROR_NO_MASTER_BROWSER
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NO_MASTER_BROWSER"
		end

	gnome_vfs_error_no_default: INTEGER is
			-- GNOME_VFS_ERROR_NO_DEFAULT
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NO_DEFAULT"
		end

	gnome_vfs_error_no_handler: INTEGER is
			-- GNOME_VFS_ERROR_NO_HANDLER
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NO_HANDLER"
		end

	gnome_vfs_error_parse: INTEGER is
			-- GNOME_VFS_ERROR_PARSE
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_PARSE"
		end

	gnome_vfs_error_launch: INTEGER is
			-- GNOME_VFS_ERROR_LAUNCH
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_LAUNCH"
		end

	gnome_vfs_error_timeout: INTEGER is
			-- GNOME_VFS_ERROR_TIMEOUT
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_TIMEOUT"
		end

	gnome_vfs_error_nameserver: INTEGER is
			-- GNOME_VFS_ERROR_NAMESERVER
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_NAMESERVER"
		end

	gnome_vfs_error_locked: INTEGER is
			-- GNOME_VFS_ERROR_LOCKED
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_LOCKED"
		end

	gnome_vfs_error_deprecated_function00: INTEGER is
			-- GNOME_VFS_ERROR_DEPRECATED_FUNCTION
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_ERROR_DEPRECATED_FUNCTION"
		end

	gnome_vfs_num_errors: INTEGER is
			-- GNOME_VFS_NUM_ERRORS
		external "C macro use <libgnomevfs/gnome-vfs.h>"
		alias "GNOME_VFS_NUM_ERRORS"
		end

feature 
	last_result: INTEGER
			-- The result of the last Gnome-VFS operation

	string_from (a_result: INTEGER): STRING is
			-- a string representing `a_result' useful for debugging
			-- purposes, but probably not appropriate for passing to the
			-- user.
		require valid_result: is_valid_result (a_result)
		do
			create {CONST_STRING} Result.from_pointer(gnome_vfs_result_to_string(a_result))
		ensure not_void: Result /= Void
		end

	result_from_errno_code (an_errno_code: INTEGER): INTEGER is
			-- Converts a system `an_errno_code' value to a GnomeVFSResult.
		do
			Result := gnome_vfs_result_from_errno_code(an_errno_code)
		ensure valid_result: is_valid_result (Result)
		end

	result_from_errno: INTEGER is
			-- a GnomeVFSResult equivalent to the current system errno.
		do
			Result:=gnome_vfs_result_from_errno
		ensure valid_result: is_valid_result (Result)
		end

	result_from_h_errno: INTEGER is
			-- Converts the system "h_errno" to a GnomeVFSResult (h_errno
			-- represents errors accessing and finding internet hosts)
		do
			Result := gnome_vfs_result_from_h_errno
		ensure valid_result: is_valid_result (Result)
		end

	result_from_h_errno_val (an_h_errno_code: INTEGER) is
			-- The GnomeVFSResult equivalent to the `an_h_errno_code', an
			-- integer that represents errors accessing and finding
			-- internet hosts.
		do
			Result:= gnome_vfs_result_from_h_errno_val(an_h_errno_code);
		ensure valid_result: is_valid_result (Result)
		end

feature {} -- External calls
	gnome_vfs_result_to_string (an_result: INTEGER): POINTER is
		external "C  use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_result_from_errno_code (an_errno_code: INTEGER): INTEGER is
		external "C  use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_result_from_errno is
		external "C  use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_result_from_h_errno: INTEGER is
		external "C  use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_result_from_h_errno_val (an_h_errno_code: INTEGER): INTEGER is
		external "C  use <libgnomevfs/gnome-vfs.h>"
		end	
end -- class GNOME_VFS_RESULT
