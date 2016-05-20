note
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

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Utilities (parent)
	--   Link: Version Information (previous)
	--   Link: Index (next)
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
	--   Types
	--
	--   Types -- Generic data types used in the cairo API
	--
	--Synopsis
	--
	--
	--
	--
	-- typedef     cairo_bool_t;
	--             cairo_user_data_key_t;
	-- void        (*cairo_destroy_func_t)         (void *data);
	--
	--Description
	--
	--Details
	--
	--  cairo_bool_t
	--
	-- typedef int cairo_bool_t;
	--
	--   cairo_bool_t is used for boolean values. Returns of type cairo_bool_t will
	--   always be either 0 or 1, but testing against these values explicitly is
	--   not encouraged; just use the value as a boolean condition.
	--
	--  if (cairo_in_stroke (cr, x, y)) {
	--      /* do something */
	--  }
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_user_data_key_t
	--
	-- typedef struct {
	--     int unused;
	-- } cairo_user_data_key_t;
	--
	--   cairo_user_data_key_t is used for attaching user data to cairo data
	--   structures. The actual contents of the struct is never used, and there is
	--   no need to initialize the object; only the unique address of a
	--   cairo_data_key_t object is used. Typically, you would just use the address
	--   of a static cairo_data_key_t object.
	--
	--   int unused; not used; ignore.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_destroy_func_t ()
	--
	-- void        (*cairo_destroy_func_t)         (void *data);
	--
	--   cairo_destroy_func_t the type of function which is called when a data
	--   element is destroyed. It is passed the pointer to the data element and
	--   should free any memory and resources allocated for it.
	--
	--   data : The data element being destroyed.

end -- class FOO
