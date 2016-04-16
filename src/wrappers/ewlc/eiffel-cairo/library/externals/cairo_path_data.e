note
	description: "Access to cairo_path_data_t C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_PATH_DATA
	--  union cairo_path_data_t
	--
	-- union cairo_path_data_t {
	--     struct {
	--         cairo_path_data_type_t type;
	--         int length;
	--     } header;
	--     struct {
	--         double x, y;
	--     } point;
	-- };
	
	-- cairo_path_data_t is used to represent the path data inside a
	-- cairo_path_t.
	
	-- The data structure is designed to try to balance the demands of
	-- efficiency and ease-of-use. A path is represented as an array of
	-- cairo_path_data_t, which is a union of headers and points.
	
	-- Each portion of the path is represented by one or more elements
	-- in the array, (one header followed by 0 or more points). The
	-- length value of the header is the number of array elements for
	-- the current portion including the header, (ie. length==1+#of
	-- points), and where the number of points for each element type
	-- must be as follows:
	
	--     CAIRO_PATH_MOVE_TO:     1 point
	--     CAIRO_PATH_LINE_TO:     1 point
	--     CAIRO_PATH_CURVE_TO:    3 points
	--     CAIRO_PATH_CLOSE_PATH:  0 points

	-- The semantics and ordering of the coordinate values are
	-- consistent with `CAIRO_CONTEXT' `move_to', `line_to',
	-- `curve_to', and `close_path'.

	--   Here is sample code for iterating through a cairo_path_t:

	--      int i;
	--      cairo_path_t *path;
	--      cairo_path_data_t *data;

	--      path = cairo_copy_path (cr);
	--
	--      for (i=0; i < path->num_data; i += path->data[i].header.length) {
	--          data = &path->data[i];
	--          switch (data->header.type) {
	--          case CAIRO_PATH_MOVE_TO:
	--              do_move_to_things (data[1].point.x, data[1].point.y);
	--              break;
	--          case CAIRO_PATH_LINE_TO:
	--              do_line_to_things (data[1].point.x, data[1].point.y);
	--              break;
	--          case CAIRO_PATH_CURVE_TO:
	--              do_curve_to_things (data[1].point.x, data[1].point.y,
	--                                  data[2].point.x, data[2].point.y,
	--                                  data[3].point.x, data[3].point.y);
	--              break;
	--          case CAIRO_PATH_CLOSE_PATH:
	--              do_close_path_things();
	--              break;
	--          }
	--      }
	--      cairo_path_destroy (path);

insert CAIRO_PATH_DATA_TYPE

feature {} -- Structure getter/setter calls
	-- union cairo_path_data_t {
	--     struct {
	--         cairo_path_data_type_t type;
	--         int length;
	--     } header;
	--     struct {
	--         double x, y;
	--     } point;
	-- };

	get_type (a_struct: POINTER): INTEGER is
		external "C struct cairo_path_data_t get header.type use <cairo.h>"
		end

	set_type (a_struct: POINTER; a_type: INTEGER) is
		external "C struct cairo_path_data_t set header.type use <cairo.h>"
		end

	get_length (a_struct: POINTER): INTEGER is
		external "C struct cairo_path_data_t get header.length use <cairo.h>"
		end

	set_length (a_struct: POINTER; a_length: INTEGER) is
		external "C struct cairo_path_data_t set header.length use <cairo.h>"
		end

	get_x (a_struct: POINTER): REAL is
		external "C struct cairo_path_data_t get point.x use <cairo.h>"
		end

	set_x (a_struct: POINTER; a_x: REAL) is
		external "C struct cairo_path_data_t set point.x use <cairo.h>"
		end

	get_y (a_struct: POINTER): REAL is
		external "C struct cairo_path_data_t get point.y use <cairo.h>"
		end

	set_y (a_struct: POINTER; a_y: REAL) is
		external "C struct cairo_path_data_t set point.y use <cairo.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_path_data_t)"
		end

end
