note
	description: "GOO_CANVAS -- The canvas widget"
	copyright: "[
					GooCanvas. Copyright (C) 2005-2022: Damon Chaplin, eiffel-libraries team and others
					
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
	revision "$REvision:$"

class
	GOO_CANVAS

inherit
	GTK_CONTAINER
	WRAPPER undefine from_external_pointer end
	
insert
	GOO_CANVAS_EXTERNALS
	GOO undefine copy, is_equal end

create {ANY}
	make
	
feature {} -- Creation

	make
			-- Creates a new GooCanvas widget.
		do
			from_external_pointer (goo_canvas_new)
			goo.register_creation_agents
		end

	

feature {ANY}

	set_bounds (left, top, right, bottom : REAL_64)
			-- 
		do
			goo_canvas_set_bounds (handle, left, top, right, bottom)
		end
		
	root_item : GOO_CANVAS_ITEM
			--
		local
			factory: G_OBJECT_EXPANDED_FACTORY [GOO_CANVAS_ITEM]
		do
--			std_error.put_line ("%Nroot : " + goo_canvas_get_root_item (handle).to_string)
			-- Result := factory.wrapper (goo_canvas_get_root_item (handle))
			
			-- this works too:
			create {GOO_CANVAS_ITEM_SIMPLE}Result.from_external_pointer (goo_canvas_get_root_item (handle))
		end
	
--feature -- The "item-created" signal
--	item_created_signal_name: STRING is "item-created"
--	
--	enable_on_item_created is
--			-- connects "item-created" signal to `on_item_created' feature
--		do
--			connect (Current, item_created_signal_name, $on_item_created)
--		end

--	on_item_created (GOOCANVAS_ITEM a_item, GOOCANVAS_ITEM_MODEL a_model) is
--			-- Built-in activate signal handler; empty by design; redefine it.
--		do
--		end

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvas.h>"
		alias "sizeof(GooCanvas)"
		end

feature {} -- Property names
	anchor_property_name : STRING is "anchor"                   -- GtkAnchorType         : Read / Write
  automatic_bounds_property_name : STRING is "automatic-bounds"         -- gboolean              : Read / Write
  background_color_property_name : STRING is "background-color"         -- gchararray            : Write
  background_color_rgb_property_name : STRING is "background-color-rgb"     -- guint                 : Write
  bounds_from_origin_property_name : STRING is "bounds-from-origin"       -- gboolean              : Read / Write
  bounds_padding_property_name : STRING is "bounds-padding"           -- gdouble               : Read / Write
  clear_background_property_name : STRING is "clear-background"         -- gboolean              : Read / Write
  integer_layout_property_name : STRING is "integer-layout"           -- gboolean              : Read / Write
  redraw_when_scrolled_property_name : STRING is "redraw-when-scrolled"     -- gboolean              : Read / Write
  resolution_x_property_name : STRING is "resolution-x"             -- gdouble               : Read / Write
  resolution_y_property_name : STRING is "resolution-y"             -- gdouble               : Read / Write
  scale_property_name : STRING is "scale"                    -- gdouble               : Read / Write
  scale_x_property_name : STRING is "scale-x"                  -- gdouble               : Read / Write
  scale_y_property_name : STRING is "scale-y"                  -- gdouble               : Read / Write
  units_property_name : STRING is "units"                    -- GtkUnit               : Read / Write
  x1_property_name : STRING is "x1"                       -- gdouble               : Read / Write
  x2_property_name : STRING is "x2"                       -- gdouble               : Read / Write
  y1_property_name : STRING is "y1"                       -- gdouble               : Read / Write
  y2_property_name : STRING is "y2"                       -- gdouble               : Read / Write
end
