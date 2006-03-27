indexing
	description: "GtkHScale -- A horizontal slider widget for selecting a value from a range."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
			-- Description

			-- The GtkHScale widget is used to allow the user to select a
			-- value using a horizontal slider. To create one, use
			-- gtk_hscale_new_with_range().

			-- The position to show the current value, and the number of
			-- decimal places shown can be set using the parent GtkScale
			-- class's functions.

class GTK_HSCALE
inherit

	GTK_SCALE
	GTK_HSCALE_EXTERNALS

		-- Implemented Interfaces: GtkHScale implements
		-- AtkImplementorIface.
	
creation from_adjustment, with_range

feature {NONE} -- Creation
	from_adjustment (an_adjustment: GTK_ADJUSTMENT) is
			-- Creates a new GtkHScale. `an_adjustment' is the
			-- GtkAdjustment which sets the range of the scale.
		require valid_adjustment: an_adjustment /= Void
		do
			handle := gtk_hscale_new (an_adjustment.handle)
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

		do
			handle:=gtk_hscale_new_with_range (a_min, a_max, a_step)
		end
end
	
