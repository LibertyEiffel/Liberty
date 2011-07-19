class CUBE

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
			smart_gl.rotate(angle, 1, 0, 0)
			smart_gl.begin_quads
			create color.set_color(0, 1, 0, 1)
			color.render
			smart_gl.vertex(1, 1, -1)
			smart_gl.vertex(-1, 1, -1)
			smart_gl.vertex(-1, 1, 1)
			smart_gl.vertex(1, 1, 1)

			color.set_color(1, 0.5, 0, 1)
			color.render
			smart_gl.vertex(1, -1, 1)
			smart_gl.vertex(-1, -1, 1)
			smart_gl.vertex(-1, -1, -1)
			smart_gl.vertex(1, -1, -1)

			color.set_color(1, 0, 0, 1)
			color.render
			smart_gl.vertex(1, 1, 1)
			smart_gl.vertex(-1, 1, 1)
			smart_gl.vertex(-1, -1, 1)
			smart_gl.vertex(1, -1, 1)

			color.set_color(1, 1, 0, 1)
			color.render
			smart_gl.vertex(1, -1, -1)
			smart_gl.vertex(-1, -1, -1)
			smart_gl.vertex(-1, 1, -1)
			smart_gl.vertex(1, 1, -1)

			color.set_color(0, 0, 1, 1)
			color.render
			smart_gl.vertex(-1, 1, 1)
			smart_gl.vertex(-1, 1, -1)
			smart_gl.vertex(-1, -1, -1)
			smart_gl.vertex(-1, -1, 1)

			color.set_color(1, 0, 1, 1)
			color.render
			smart_gl.vertex(1, 1, -1)
			smart_gl.vertex(1, 1, 1)
			smart_gl.vertex(1, -1, 1)
			smart_gl.vertex(1, -1, -1)

			smart_gl.end_primitive
		end
		
	anim (widget: GL_WIDGET): BOOLEAN is
		do
			angle := angle - 1.5
			widget.display_gl
			Result := True
		end

feature{}
	angle: REAL

end
