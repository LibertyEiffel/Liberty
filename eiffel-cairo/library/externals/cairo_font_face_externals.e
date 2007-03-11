indexing
	description: "External calls for CAIRO_FONT_FACE"
	copyright: "(C) 2007 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_FONT_FACE_EXTERNALS

inherit ANY undefine is_equal, copy end

insert CAIRO_FONT_FACE_TYPE
	
feature {} -- External calls
	cairo_font_face_reference (a_font_face: POINTER): POINTER is
			-- 	cairo_font_face_t* cairo_font_face_reference (cairo_font_face_t *font_face);
		external "C use <cairo.h>"
		end

	cairo_font_face_destroy (a_font_face: POINTER) is
			-- void cairo_font_face_destroy (cairo_font_face_t
			-- *font_face);
		external "C use <cairo.h>"
		end

	cairo_font_face_status (a_font_face: POINTER): INTEGER is
			-- cairo_status_t cairo_font_face_status (cairo_font_face_t
			-- *font_face);
		external "C use <cairo.h>"
		end
	
	cairo_font_face_get_user_data (a_font_face, a_key: POINTER): POINTER is
			-- void* cairo_font_face_get_user_data (cairo_font_face_t
			-- *font_face, const cairo_user_data_key_t *key);
		external "C use <cairo.h>"
		end

	cairo_font_face_set_user_data (a_font_face, a_key, some_data, a_destroy_func: POINTER): INTEGER is
			-- cairo_status_t cairo_font_face_set_user_data
			-- (cairo_font_face_t *font_face, const cairo_user_data_key_t
			-- *key, void *user_data, cairo_destroy_func_t destroy);
		external "C use <cairo.h>"
		end
	
	-- enum        cairo_font_type_t is

	cairo_font_face_get_type  (a_font_face: POINTER): INTEGER is
			-- cairo_font_type_t cairo_font_face_get_type
			-- (cairo_font_face_t *font_face);
		external "C use <cairo.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_font_face_t)"
		end
end
