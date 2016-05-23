class PANGO_CAIRO

insert
	CAIRO_FORMAT
	PANGO_CONSTANTS

create {ANY}
	make

feature {ANY}

	draw_text is
		local
			layout: PANGO_CAIRO_LAYOUT
			description: PANGO_FONT_DESCRIPTION
			i: INTEGER
			size: TUPLE[INTEGER, INTEGER]
			angle red, green, blue: REAL;

		do
			cairo.translate (radius, radius)
			create layout.for_cairo (cairo)
			layout.set_text ("Text")
			create description.from_string (font)
			layout.set_font_description (description)
			from
				i := 0
			until
				i = n_words
			loop
				angle := (360 * i) / n_words
				cairo.save
				-- A nice gradient
				red := (1 + ((angle) * pi / 180)).cos / 2
				blue := (1 + ((angle + 120) * pi / 180)).cos / 2
				green := (1 + ((angle - 120) * pi / 180)).cos / 2
				cairo.set_source_rgb (red, green, blue)
				cairo.rotate (angle * pi / 180)
				layout.update (cairo)
				size := layout.size
				cairo.move_to (-(size.first / pango_scale) / 2, - radius)
				layout.show_on_cairo (cairo)
				cairo.restore
				i := i + 1
			end
		end

	make is
		local
			surface: CAIRO_IMAGE_SURFACE
			res: INTEGER
		do
			create surface.make (cairo_format_argb32, 2 * radius, 2 * radius)
			create cairo.make (surface)
			cairo.set_source_rgb (1.0, 1.0, 1.0)
			cairo.paint
			draw_text
			res := surface.write_to_png ("pango_cairo_is_easy.png")
			surface.finish
		end

feature {ANY} -- Implementation details

	pi: REAL is 3.14159265358979323846 -- PI

	cairo: CAIRO_CONTEXT

	radius: INTEGER is 150

	n_words: INTEGER is 9

	font: STRING is "Sans Bold 27"

end -- class PANGO_CAIRO
