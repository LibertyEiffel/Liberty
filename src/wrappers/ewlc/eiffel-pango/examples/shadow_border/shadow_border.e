class SHADOW_BORDER

insert
	CAIRO_FORMAT
	PANGO_CONSTANTS

create {ANY}
	make

feature {ANY}

	draw_normal_text (text: STRING; x, y: INTEGER) is
		local
			layout: PANGO_CAIRO_LAYOUT
			description: PANGO_FONT_DESCRIPTION
		do
			cairo.save
			cairo.translate (x, y)
			create layout.for_cairo (cairo)
			layout.set_text (text)
			create description.from_string (font)
			layout.set_font_description (description)
			cairo.set_source_rgb (0.2, 0.4, 0.7)
			layout.update (cairo)
			layout.show_on_cairo (cairo)
			cairo.restore
		end

	draw_text_with_shadow (text: STRING; x, y: INTEGER) is
		local
			layout: PANGO_CAIRO_LAYOUT
			description: PANGO_FONT_DESCRIPTION
		do
			cairo.save
			cairo.translate (x, y)
			cairo.save
			cairo.translate (3, 3)
			create layout.for_cairo (cairo)
			layout.set_text (text)
			create description.from_string (font)
			layout.set_font_description (description)
			cairo.set_source_rgba (0.0, 0.0, 0.0, 0.5)
			layout.update (cairo)
			layout.show_on_cairo (cairo)
			cairo.restore
			cairo.set_source_rgba (0.9, 0.7, 0.5, 1.0)
			layout.update (cairo)
			layout.show_on_cairo (cairo)
			cairo.restore
		end

	draw_text_with_border (text: STRING; x, y: INTEGER) is
		local
			layout: PANGO_CAIRO_LAYOUT
			description: PANGO_FONT_DESCRIPTION
		do
			cairo.save
			cairo.translate (x, y)
			create layout.for_cairo (cairo)
			layout.set_text (text)
			create description.from_string (font)
			layout.set_font_description (description)

			cairo.set_source_rgb (0.0, 0.0, 0.0)
			layout.update (cairo)
			layout.show_path (cairo)
			cairo.stroke

			cairo.set_source_rgb (0.5, 0.9, 0.7)
			layout.update (cairo)
			layout.show_on_cairo (cairo)

			cairo.restore
		end

	make is
		local
			surface: CAIRO_IMAGE_SURFACE
			res: INTEGER
		do
			create surface.make (cairo_format_argb32, 600, 400)
			create cairo.make (surface)
			cairo.set_source_rgb (1.0, 1.0, 1.0)
			cairo.paint
			draw_normal_text ("Hello World!", 30, 40)
			draw_text_with_shadow ("Hello Shadowy World!", 50, 90)
			draw_text_with_border ("Hello Bordered World!", 70, 140)
			res := surface.write_to_png ("shadows_and_borders.png")
			surface.finish
		end

feature {ANY} -- Implementation details

	cairo: CAIRO_CONTEXT

	font: STRING is "Sans Bold 27"

end -- class SHADOW_BORDER
