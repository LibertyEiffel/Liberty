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
			gl.disable(gl.const_cull_face)
			smart_gl.rotate(angle, 0, 1, 0)
			smart_gl.begin_triangles
			full_red.render
			smart_gl.vertex(0, 1, 0)
			full_green.render
			smart_gl.vertex(-1, -1, 0)
			full_blue.render
			smart_gl.vertex(1, -1, 0)
			smart_gl.end_primitive
		end
		
	anim (widget: GL_WIDGET): BOOLEAN is
		do
			angle := angle + 2
			widget.display_gl
			--post_redisplay
			Result := True
		end

feature{}
	angle: REAL

end
