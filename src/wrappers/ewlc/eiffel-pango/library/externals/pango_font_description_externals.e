note
	description: "External calls for features of PANGO_FONT_DESCRIPTION"
	copyright: "[
					Copyright (C) 2007 Soluciones Informaticas Libres S.A. (Except),
					                   Pango team
					
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

deferred class PANGO_FONT_DESCRIPTION_EXTERNALS

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	pango_font_description_new: POINTER
		external "C use <pango/pango.h>"
		end

	pango_font_description_from_string (a_string: POINTER): POINTER
		external "C use <pango/pango.h>"
		end

	pango_font_description_hash (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_family (a_font_description: POINTER): POINTER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_style (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_variant (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_weight (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_stretch (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_size (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_size_is_absolute (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_get_set_fields (a_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_better_match (a_fd, b_fd, c_fd: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_to_string (a_font_description: POINTER): POINTER
		external "C use <pango/pango.h>"
		end

	pango_font_description_to_filename (a_font_description: POINTER): POINTER
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_family (a_font_description: POINTER; a_family: POINTER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_style (a_font_description: POINTER; a_style: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_variant (a_font_description: POINTER; a_variant: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_weight (a_font_description: POINTER; a_weight: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_stretch (a_font_description: POINTER; a_stretch: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_size (a_font_description: POINTER; a_size: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_set_absolute_size (a_fd: POINTER; a_size: REAL)
		external "C use <pango/pango.h>"
		end

	pango_font_description_unset_fields (a_font_description: POINTER; a_fields: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_merge (a_fd, b_fd: POINTER; replace_existing: INTEGER)
		external "C use <pango/pango.h>"
		end

	pango_font_description_equal (a_font_description, b_font_description: POINTER): INTEGER
		external "C use <pango/pango.h>"
		end

	pango_font_description_copy (a_font_description: POINTER): POINTER
		external "C use <pango/pango.h>"
		end

	pango_font_description_free (a_font_description: POINTER)
		external "C use <pango/pango.h>"
		end

end -- class PANGO_FONT_DESCRIPTION_EXTERNALS
