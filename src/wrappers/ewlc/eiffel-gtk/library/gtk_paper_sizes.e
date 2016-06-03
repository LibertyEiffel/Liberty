note
	description: "Names of various standard paper sizes and related features."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

deferred class GTK_PAPER_SIZES

inherit ANY undefine is_equal, copy end

feature {ANY} -- Paper sizes
	--	a3_paper_name: STRING is
			
	--
	-- #define GTK_PAPER_NAME_A3 "iso_a3"
	--
	--   Name for the A4 paper size.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PAPER_NAME_A4
	--
	-- #define GTK_PAPER_NAME_A4 "iso_a4"
	--
	--   Name for the A4 paper size.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PAPER_NAME_A5
	--
	-- #define GTK_PAPER_NAME_A5 "iso_a5"
	--
	--   Name for the A5 paper size.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PAPER_NAME_B5
	--
	-- #define GTK_PAPER_NAME_B5 "iso_b5"
	--
	--   Name for the B5 paper size.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PAPER_NAME_LETTER
	--
	-- #define GTK_PAPER_NAME_LETTER "na_letter"
	--
	--   Name for the Letter paper size.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PAPER_NAME_EXECUTIVE
	--
	-- #define GTK_PAPER_NAME_EXECUTIVE "na_executive"
	--
	--   Name for the Executive paper size.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PAPER_NAME_LEGAL
	--
	-- #define GTK_PAPER_NAME_LEGAL "na_legal"
	--
	--   Name for the Legal paper size.
	--
	--   --------------------------------------------------------------------------

	--

	default_paper_size_name: CONST_STRING is
			-- the name of the default paper size, which depends on the current
			-- locale.
		do
			create Result.from_external(gtk_paper_size_get_default)
		end

feature {} -- External calls
	gtk_paper_name_a3_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_A3
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_A3"
		end

	gtk_paper_name_a4_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_A4
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_A4"
		end

	gtk_paper_name_a5_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_A5
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_A5"
		end

	gtk_paper_name_b5_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_B5
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_B5"
		end

	gtk_paper_name_letter_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_LETTER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_LETTER"
		end

	gtk_paper_name_executive_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_EXECUTIVE
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_EXECUTIVE"
		end

	gtk_paper_name_legal_ptr: INTEGER is
			-- #define GTK_PAPER_NAME_LEGAL
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAPER_NAME_LEGAL"
		end


	gtk_paper_size_get_default: POINTER is
			-- const gchar* gtk_paper_size_get_default     (void);
		external "C use <gtk/gtk.h>"
		end	
end -- class GTK_PAPER_SIZES
