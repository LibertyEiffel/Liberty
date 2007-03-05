indexing
	description: "Access to cairo_path_t C structure"
	copyright: "(C) 2007 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_PATH_STRUCT
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
	get_status (a_struct: POINTER): INTEGER is
		external "C struct cairo_path_t get status use <pango.h>"
		end

	set_status (a_struct: POINTER; a_status: INTEGER) is
		external "C struct cairo_path_t set status use <pango.h>"
		end

	--   cairo_path_data_t *data; the elements in the path
	get_data (a_struct: POINTER): POINTER is
		external "C struct cairo_path_t get data use <pango.h>"
		end

	set_data (a_struct: POINTER; a_data: POINTER) is
		external "C struct cairo_path_t set data use <pango.h>"
		end

	--   int num_data;            the number of elements in the data array
		get_num_data (a_struct: POINTER): INTEGER is
		external "C struct cairo_path_t get num_data use <pango.h>"
		end

	set_num_data (a_struct: POINTER; a_num_data: INTEGER) is
		external "C struct cairo_path_t set num_data use <pango.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <pango.h>"
		alias "sizeof(cairo_path_t)"
		end
end
