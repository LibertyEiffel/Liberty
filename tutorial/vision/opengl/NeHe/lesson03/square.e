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
		local
			color: GL_COLOR
		do
			-- In SMART_GL, all colors are given with 4 values (including alpha value)
			create color.set_color(0.5, 0.5, 1, 1)
			smart_gl.begin_quads
			color.render
			smart_gl.vertex(-1, 1, 0)
			smart_gl.vertex(-1, -1, 0)
			smart_gl.vertex(1, -1, 0)
			smart_gl.vertex(1, 1, 0)
			smart_gl.end_primitive
		end
		
end
