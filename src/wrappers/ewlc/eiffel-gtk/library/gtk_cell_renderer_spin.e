note
	description: "GtkCellRendererSpin -- Renders a spin button in a cell."
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

	wrapped_version: "2.10.6"

class GTK_CELL_RENDERER_SPIN
	-- GTK_CELL_RENDERER_SPIN renders text in a cell like
	-- GTK_CELL_RENDERER_TEXT from which it is derived. But while
	-- GTK_CELL_RENDERER_TEXT offers a simple entry to edit the text,
	-- GTK_CELL_RENDERER_SPIN offers a GTK_SPIN_BUTTON widget. Of
	-- course, that means that the text has to be parseable as a
	-- floating point number.

	-- The range of the spinbutton is taken from the adjustment
	-- property of the cell renderer, which can be set explicitly or
	-- mapped to a column in the tree model, like all properties of
	-- cell renders. GtkCellRendererSpin also has properties for the
	-- climb rate and the number of digits to display.  Other
	-- GtkSpinButton properties can be set in a handler for the
	-- start-editing signal.

	--   The GtkCellRendererSpin cell renderer was added in GTK+ 2.10.

inherit
	GTK_CELL_RENDERER_TEXT
		redefine make, struct_size end

create {ANY} make, from_external_pointer

feature {} -- Creation
	make is
			--   Creates a new GtkCellRendererSpin.
		do
			from_external_pointer(gtk_cell_renderer_spin_new)
		end
	
feature {ANY} -- Properties getters
	adjustment: GTK_ADJUSTMENT is
			-- The adjustment that holds the value of the spin
			-- button. This must be non-NULL for the cell renderer to be
			-- editable.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_ADJUSTMENT]
		do
			-- TODO: suboptimal implementation; the generic `property' create a
			-- new G_VALUE everytime this feature is invoked
			Result:=factory.wrapper_or_void(property(adjustment_property_name).pointer)
		end

	climb_rate: REAL is
			-- The acceleration rate when you hold down a button.
		do
			Result:=property(climb_rate_property_name).real
		ensure valid: Result >= 0
		end

	digits: INTEGER is
			--   The number of decimal places to display.
		do
			Result:=property(climb_rate_property_name).integer
		ensure valid: Result.in_range(0,20)
		end

feature {ANY} -- Properties setters
	set_adjustment (an_adjustment: GTK_ADJUSTMENT) is
		require adjustment_not_void: an_adjustment /= Void
		do
			set_property(adjustment_property_name, create {G_VALUE}.from_pointer(an_adjustment.handle))
		end

	
	set_climb_rate (a_climb_rate: REAL) is
		require a_climb_rate >= 0 
		do
			set_property(climb_rate_property_name, create {G_VALUE}.from_real(a_climb_rate))
		end

	set_digits (some_digits: INTEGER) is
		require valid_digits: some_digits.in_range(0,20)
		do
			set_property(digits_property_name, create {G_VALUE}.from_natural(some_digits))
		end	

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererSpin)"
		end

feature {} -- 
	adjustment_property_name: STRING is "adjustment"
	climb_rate_property_name: STRING is "climb-rate"
	digits_property_name: STRING is "digits"

	gtk_cell_renderer_spin_new: POINTER is
			-- GtkCellRenderer* gtk_cell_renderer_spin_new (void);
		external "C use <gtk/gtk.h>"
		end
	
end -- class GTK_CELL_RENDERER_SPIN
