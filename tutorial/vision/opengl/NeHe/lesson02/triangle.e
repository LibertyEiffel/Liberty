class TRIANGLE

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
			smart_gl.begin_triangles
			smart_gl.vertex(0, 1, 0)
			smart_gl.vertex(-1, -1, 0)
			smart_gl.vertex(1, -1, 0)
			smart_gl.end_primitive
		end
		
end
