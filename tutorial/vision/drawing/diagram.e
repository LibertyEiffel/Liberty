class DIAGRAM
	-- Used by drawing.e
	-- This is an example of a very basic layout. It paint only in a
	-- window using basic geometry functions, it did not handle children
	-- in then window.

inherit
	GRAPHIC
	LAYOUT
		redefine set_container
		end

creation {ANY}
	default_create

feature {}
	w: WINDOW

	pen1, pen2, pen3: DRAW_KIT

feature {ANY}
	set_container (c: CONTAINER) is
		do
			w ?= c
			check
				w /= Void
			end
			container := c
			create pen1
			create pen2
			pen2.set_line_width(5)
			pen2.set_color(cyan_color)
			create pen3
			pen3.set_line_width(3)
			pen3.set_color(violet_color)
			w.set_background_color(white_color)
			w.set_requisition(300, 300, 500, 300)
		end

	redo_layout (x, y: INTEGER) is
		do
		end

	update_requisition is
		do
		end

feature {CONTAINER}
	expose_paint is
		do
			draw
		end

feature {}
	draw is
		do
			pen1.set_drawable(w)
			pen2.set_drawable(w)
			pen3.set_drawable(w)
			pen1.line(10, 10, 100, 100)
			pen2.line(100, 100, 190, 10)
			pen2.put_string(once U"Hello", 100, 10)
			pen2.rectangle(10, 100, 200, 80)
			pen1.point(10, 180)
			-- on the rectangle' corner
			pen3.arc(10, 100, 200, 80, 90.0, 360.0)
			-- in the rectangle
			pen3.arc_radius(110, 100, 100, 50, 0.0, 180.0)
			--above the rectangle
			pen2.fill_rectangle(250, 10, 40, 40)
			pen3.fill_arc(250, 10, 40, 40, 0.0, 90)
		end

end -- class DIAGRAM
