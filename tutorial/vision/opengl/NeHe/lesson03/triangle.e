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
			-- In SMART_GL, all colors are given with 4 values (including alpha value)
			smart_gl.begin_triangles
			full_red.render
			smart_gl.vertex(0, 1, 0)
			full_green.render
			smart_gl.vertex(-1, -1, 0)
			full_blue.render
			smart_gl.vertex(1, -1, 0)
			smart_gl.end_primitive
		end
		
end
