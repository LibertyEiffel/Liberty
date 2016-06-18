class CAIROSIMPLE

insert
	CAIRO_FORMAT

create {ANY}
	make

feature {ANY}

	pi: REAL is 3.14159265358979323846 -- PI

	make
		local
			context: CAIRO_CONTEXT
			surface: CAIRO_IMAGE_SURFACE
			res: INTEGER
		do
			create surface.make (cairo_format_argb32, 300, 200)
			create context.make (surface)
			-- First draw something easy, say a redish rectangle
			context.set_source_rgb (0.8, 0.2, 0.4)
			context.rectangle (10, 10, 40, 80)
			context.fill_preserve
			context.set_source_rgb (0.4, 0.1, 0.2)
			context.stroke
			
			-- Now a semitransparent circle
			context.set_source_rgba (0.4, 0.8, 1.0, 0.5) -- alpha 1=opaque, 0=transparent
			context.set_line_width (1.0)
			context.arc (75, 75, 45, 0, 2 * pi)
			context.fill_preserve
			context.set_source_rgba (0, 0, 0, 0.5)
			context.stroke
			
			-- Finally, write to a PNG file
			res := surface.write_to_png ("cairosimple.png")
			surface.finish
		end

end -- class CAIROSIMPLE
