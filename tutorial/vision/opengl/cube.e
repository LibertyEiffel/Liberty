class CUBE

inherit
	GL_OBJECT

creation
	make_at_origin, make_with_position

feature{ANY}
	build is
		do
			create vertices.make(8)
			vertices.put(create {VERTEX}.make_with_color_object(-1, 1, 1, full_red), 0)
			vertices.put(create {VERTEX}.make_with_color_object(-1, -1, 1, full_red), 1)
			vertices.put(create {VERTEX}.make_with_color_object(1, -1, 1, full_green), 2)
			vertices.put(create {VERTEX}.make_with_color_object(1, 1, 1, full_green), 3)
			vertices.put(create {VERTEX}.make_with_color_object(1, 1, -1, full_blue), 4)
			vertices.put(create {VERTEX}.make_with_color_object(-1, 1, -1, full_blue), 5)
			vertices.put(create {VERTEX}.make_with_color_object(-1, -1, -1, full_magenta), 6)
			vertices.put(create {VERTEX}.make_with_color_object(1, -1, -1, full_magenta), 7)
			
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(1), vertices.item(3)))
			facets.add_last(create {FACET}.make(vertices.item(1), vertices.item(2), vertices.item(3)))

			facets.add_last(create {FACET}.make(vertices.item(3), vertices.item(2), vertices.item(4)))
			facets.add_last(create {FACET}.make(vertices.item(2), vertices.item(7), vertices.item(4)))
			
			facets.add_last(create {FACET}.make(vertices.item(5), vertices.item(6), vertices.item(0)))
			facets.add_last(create {FACET}.make(vertices.item(6), vertices.item(1), vertices.item(0)))
			
			facets.add_last(create {FACET}.make(vertices.item(5), vertices.item(0), vertices.item(4)))
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(3), vertices.item(4)))
			
			facets.add_last(create {FACET}.make(vertices.item(1), vertices.item(6), vertices.item(2)))
			facets.add_last(create {FACET}.make(vertices.item(6), vertices.item(7), vertices.item(2)))
			
			facets.add_last(create {FACET}.make(vertices.item(4), vertices.item(7), vertices.item(5)))
			facets.add_last(create {FACET}.make(vertices.item(7), vertices.item(6), vertices.item(5)))

			set_scale(1.5, 0.5, 0.75)
		end

	turn(ang_x, ang_y : REAL) is
		do
			set_pitch(ang_x)
			set_heading(ang_y)
		end

feature {}
	angle_x, angle_y : REAL
	vertices: FAST_ARRAY[VERTEX]

end
