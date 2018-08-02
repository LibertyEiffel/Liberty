note
	description: "Named paper sizes."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_PAPER_SIZE
	-- GtkPaperSize handles paper sizes. It uses the standard called
	-- "PWG 5101.1-2002 PWG: Standard for Media Standardized Names" to
	-- name the paper sizes (and to get the data for the page
	-- sizes). In addition to standard paper sizes, GtkPaperSize allows
	-- to construct custom paper sizes with arbitrary dimensions.

	-- The GtkPaperSize object stores not only the dimensions (width
	-- and height) of a paper size and its name, it also provides
	-- default print margins.

	-- Printing support has been added in GTK+ 2.10.

inherit
	C_STRUCT 
		undefine free 
		redefine copy, is_equal 
		end
	EIFFEL_OWNED undefine free end

insert 
	GTK_PAPER_SIZE_EXTERNALS rename gtk_paper_size_free as free end
	GTK_UNIT 

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_paper_name: STRING)
			-- Creates a new GtkPaperSize object by parsing a PWG
			-- 5101.1-2002 PWG `a_paper_name'.
		require name_not_void: a_paper_name /= Void
		do
			from_external_pointer(gtk_paper_size_new(a_paper_name.to_external))
		end

	make_default
			-- Creates a new GtkPaperSize object for the default paper
			-- size.
		do
			from_external_pointer(gtk_paper_size_new(default_pointer))
		end

	from_ppd (a_ppd_name, a_ppd_display_name: STRING; a_width, an_height: REAL)
			-- Creates a new GtkPaperSize object by using PPD
			-- information.

			-- If `a_ppd_name' is not a recognized PPD paper name,
			-- `a_ppd_display_name,' `a_width' and `an_height' are used
			-- to construct a custom GtkPaperSize object.

			-- `a_ppd_name' a PPD paper name

			-- `a_ppd_display_name' the corresponding human-readable name

			--  `a_width' : the paper width, in points

			--   `an_height' : the paper height in points
		require 
			name_not_void: a_ppd_name /= Void
			display_name_not_void: a_ppd_display_name /= Void
		do
			from_external_pointer (gtk_paper_size_new_from_ppd
										  (a_ppd_name.to_external, a_ppd_display_name.to_external,
											a_width, an_height))
		end

	make_custom (a_name, a_display_name: STRING; a_width, an_height: REAL; a_unit: INTEGER)
			-- Creates a new GtkPaperSize object with the given
			-- parameters.
			
			-- `a_name' : the paper name

			-- `a_display_name' : the human-readable name

			-- `a_width' : the paper width, in units of `a_unit'

			-- `an_height' : the paper height, in units of `a_unit'

			--  `a_unit' : the unit for `a_width' and `an_height'
		require 
			name_not_void: a_name /= Void
			display_name_not_void: a_display_name /= Void
			valid_unit: is_valid_gtk_unit (a_unit)
		do
			from_external_pointer(gtk_paper_size_new_custom
										 (a_name.to_external, a_display_name.to_external,
										  a_width, an_height, a_unit))
		end	
	
feature {ANY} -- Copying
	copy (another: GTK_PAPER_SIZE)
			--   Copies an existing GtkPaperSize.
		do
			from_external_pointer(gtk_paper_size_copy(another.handle))
		end	

feature {ANY} -- Queries
	is_equal (another: GTK_PAPER_SIZE): BOOLEAN
			-- Do Current and `another' represent the same paper size?
		do
			Result:=gtk_paper_size_is_equal(handle, another.handle).to_boolean
		end

	name: CONST_STRING
			-- the name of the GtkPaperSize.
		do
			if stored_name=Void then 
				create stored_name.from_external (gtk_paper_size_get_name(handle))
			end
			Result:=stored_name
		end

	display_name: CONST_STRING
			-- the human-readable name of the GtkPaperSize.
		do
			if stored_display_name=Void then
				create stored_display_name.from_external (gtk_paper_size_get_display_name(handle))
			end
			Result:=stored_display_name
		end
	
	ppd_name:CONST_STRING
			-- the PPD name of the GtkPaperSize, which may be Void.
		local ptr: POINTER
		do
			if not ppd_name_retrieved then
				ptr:=gtk_paper_size_get_ppd_name(handle)
				if ptr.is_not_null then
					create stored_ppd_name.from_external(ptr)
				end
				ppd_name_retrieved:=True
			end
			Result:=stored_ppd_name
		end

	unit: INTEGER 
			-- the unit measure for all the further queries
	
	width: REAL
			-- the paper width of the GtkPaperSize
		do
			Result:=gtk_paper_size_get_width(handle, unit)
		end

	height: REAL
			--  the paper height of the GtkPaperSize
		do
			Result:=gtk_paper_size_get_height(handle, unit)
		end
	
	is_custom: BOOLEAN
			-- Is size not a standard paper size?
		do
			Result:=gtk_paper_size_is_custom(handle).to_boolean
		end

	default_top_margin: REAL
			-- The default top margin for the GtkPaperSize.
		do
			Result:=gtk_paper_size_get_default_top_margin(handle,unit)
		end

	default_bottom_margin: REAL
			--  the default bottom margin for the GtkPaperSize.
		do
			Result:=gtk_paper_size_get_default_bottom_margin(handle,unit)
		end

	default_left_margin: REAL
			-- the default left margin for the GtkPaperSize.
		do
			Result:=gtk_paper_size_get_default_left_margin(handle, unit)
		end

	default_right_margin: REAL
			-- the default right margin for the GtkPaperSize.
		do
			Result:=gtk_paper_size_get_default_right_margin(handle,unit)
		end

feature {ANY} -- Setters
	set_unit (a_unit: INTEGER)
			-- Set the unit measure for all the further queries
		do
			unit:=a_unit
		ensure set: unit = a_unit
		end
	
	set_size (a_width, an_height: REAL; a_unit: INTEGER)
			-- Changes the dimensions of a size to `a_width' x `an_height', 
			-- expressed in `a_unit'.
		require valid_unit: is_valid_gtk_unit(a_unit)
		do
			gtk_paper_size_set_size(handle, a_width, an_height, a_unit)
		end

feature {} -- Implementation
	stored_name, stored_display_name, stored_ppd_name: CONST_STRING
	ppd_name_retrieved: BOOLEAN
	
end -- class GTK_PAPER_SIZE
			
