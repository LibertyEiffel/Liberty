class PYRAMID

inherit
	GL_OBJECT

creation
	make_at_origin, make_with_position

feature{ANY}
	build is
		do
			create vertices.make(5)
			vertices.put(create {VERTEX}.make_with_color_object(0, 1, 0, full_red), 0)
			vertices.put(create {VERTEX}.make_with_color_object(-1, -1, -1, full_green), 1)
			vertices.put(create {VERTEX}.make_with_color_object(1, -1, -1, full_blue), 2)
			vertices.put(create {VERTEX}.make_with_color_object(1, -1, 1, full_magenta), 3)
			vertices.put(create {VERTEX}.make_with_color_object(-1, -1, 1, full_cyan), 4)

			-- Vertices must be given in counter-clockwise order when look toward the facet
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(2), vertices.item(1)))
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(3), vertices.item(2)))
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(4), vertices.item(3)))
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(1), vertices.item(4)))
			facets.add_last(create {FACET}.make(vertices.item(4), vertices.item(1), vertices.item(3)))
			facets.add_last(create {FACET}.make(vertices.item(1), vertices.item(2), vertices.item(3)))
		end

	turn(ang_x, ang_y : REAL) is
		do
			set_pitch(ang_x)
			set_heading(ang_y)
		end

feature {}
	vertices: FAST_ARRAY[VERTEX]

end
