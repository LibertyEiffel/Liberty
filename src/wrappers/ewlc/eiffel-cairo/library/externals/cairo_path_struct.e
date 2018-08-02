note
	description: "Access to cairo_path_t C structure"
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli,
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

deferred class CAIRO_PATH_STRUCT

inherit
	ANY
		undefine
			copy, is_equal
		end

	-- typedef struct {
	--     cairo_status_t status;
	--     cairo_path_data_t *data;
	--     int num_data;
	-- } cairo_path_t;

	-- A data structure for holding a path. This data structure serves
	-- as the return value for cairo_copy_path() and
	-- cairo_copy_path_flat() as well the input value for
	-- cairo_append_path().

	-- See cairo_path_data_t for hints on how to iterate over the
	-- actual data within the path.

	-- The num_data member gives the number of elements in the data
	-- array. This number is larger than the number of independent path
	-- portions (defined in cairo_path_data_type_t), since the data
	-- includes both headers and coordinates for each portion.

	--   cairo_status_t status;   the current error status
	--   cairo_path_data_t *data; the elements in the path
	--   int num_data;            the number of elements in the data array

feature {} -- Structure getter/setter calls
	--  cairo_path_t
	--
	--   cairo_status_t status;   the current error status
	get_status (a_struct: POINTER): INTEGER
		external "C struct cairo_path_t get status use <cairo.h>"
		end

	set_status (a_struct: POINTER; a_status: INTEGER)
		external "C struct cairo_path_t set status use <cairo.h>"
		end

	--   cairo_path_data_t *data; the elements in the path
	get_data (a_struct: POINTER): POINTER
		external "C struct cairo_path_t get data use <cairo.h>"
		end

	set_data (a_struct: POINTER; a_data: POINTER)
		external "C struct cairo_path_t set data use <cairo.h>"
		end

	--   int num_data;            the number of elements in the data array
		get_num_data (a_struct: POINTER): INTEGER
		external "C struct cairo_path_t get num_data use <cairo.h>"
		end

	set_num_data (a_struct: POINTER; a_num_data: INTEGER)
		external "C struct cairo_path_t set num_data use <cairo.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_path_t)"
		end
end
