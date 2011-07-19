class SHRINK_EXPAND
--
-- This example show how standards layouts (row / column) handle *_shrink_allowed and *_expand_allowed 
-- widget's properties.
--
-- See also WIDGET and LAYOUT for more information.
--
	
inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	toplevel_window: TOPLEVEL_WINDOW

	make is
		local
			sub_window: SUB_WINDOW; label: LABEL
		do
			create toplevel_window
			-- The default layout is column.
			toplevel_window.set_title("Layout example")
			toplevel_window.set_background_color(white_color)
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.map
			toplevel_window.set_x_shrink(True)
			toplevel_window.set_y_shrink(True)
			toplevel_window.child_attach(create {LABEL}.make(U"Fixed size label"))
			
			create sub_window.make(toplevel_window)
			sub_window.set_background_color(light_sky_blue_color)
			sub_window.child_attach(create {LABEL}.make(U"Expand area"))
			sub_window.set_x_expand(True)
			sub_window.set_y_expand(True)
			sub_window.map
			
			create sub_window.make(toplevel_window)
			sub_window.set_background_color(pink_color)
			create label.make(U"Expand and shrink area")
			label.set_x_shrink(True)
			label.set_y_shrink(True)
			label.set_min_width(0)
			label.set_min_height(0)
			sub_window.child_attach(label)
			sub_window.set_x_expand(True)
			sub_window.set_y_expand(True)
			sub_window.set_x_shrink(True)
			sub_window.set_y_shrink(True)
			sub_window.map
			
			create sub_window.make(toplevel_window)
			sub_window.set_background_color(light_green_color)
			create label.make(U"Shrink area")
			label.set_x_shrink(True)
			label.set_y_shrink(True)
			label.set_min_width(0)
			label.set_min_height(0)
			sub_window.child_attach(label)
			sub_window.set_x_shrink(True)
			sub_window.set_y_shrink(True)
			sub_window.map
			
			vision.start
		end

end -- class SHRINK_EXPAND
