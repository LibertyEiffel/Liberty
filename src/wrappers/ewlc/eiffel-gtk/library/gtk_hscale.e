note
	description: "GtkHScale -- A horizontal slider widget for selecting a value from a range."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
 
class GTK_HSCALE
	-- The GtkHScale widget is used to allow the user to select a value using a
	-- horizontal slider. To create one, use `with_range'.
	
	-- The position to show the current value, and the number of decimal places
	-- shown can be set using the parent GtkScale class's functions.

inherit
	GTK_SCALE

insert
	GTK_HSCALE_EXTERNALS

		-- Implemented Interfaces: GtkHScale implements
		-- AtkImplementorIface.

create {ANY}
	from_adjustment, with_range, from_external_pointer

feature {} -- Creation

	from_adjustment (an_adjustment: GTK_ADJUSTMENT) is
			-- Creates a new GtkHScale. `an_adjustment' is the
			-- GtkAdjustment which sets the range of the scale.
		require valid_adjustment: an_adjustment /= Void
		do
			handle := gtk_hscale_new (an_adjustment.handle)
			store_eiffel_wrapper
		end

	with_range (a_min, a_max, a_step: REAL) is
			-- Creates a new horizontal scale widget that lets the user
			-- input a number between `a_min' and `a_max' (including
			-- `a_min' and `a_max') with the increment step. step must be
			-- nonzero; it's the distance the slider moves when using the
			-- arrow keys to adjust the scale value.

			-- Note that the way in which the precision is derived works
			-- best if step is a power of ten. If the resulting precision
			-- is not suitable for your needs, use `set_digits' to
			-- correct it.

			-- `a_min' : 	minimum value
			
			-- `a_max' : maximum value

			-- `a_step' : step increment (tick size) used with keyboard
			-- shortcuts
		require
			a_step /= 0.0 -- from GTK+ assertion
		do
			handle:=gtk_hscale_new_with_range (a_min, a_max, a_step)
			store_eiffel_wrapper
		end
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkHScale)"
		end
end

