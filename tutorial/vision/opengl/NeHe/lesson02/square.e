class SQUARE

inherit
	GL_OBJECT
		redefine draw
		end

creation
	make_with_position

feature{ANY}
	build is
		do
		end

	draw is
		do
			-- Vertices must be given in counter-clockwise order
			smart_gl.begin_quads
			smart_gl.vertex(-1, 1, 0)
			smart_gl.vertex(-1, -1, 0)
			smart_gl.vertex(1, -1, 0)
			smart_gl.vertex(1, 1, 0)
			smart_gl.end_primitive
		end
		
end
