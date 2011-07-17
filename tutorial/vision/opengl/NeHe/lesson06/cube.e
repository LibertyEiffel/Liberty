class CUBE

inherit
	GL_OBJECT

creation
	make_at_origin, make_with_position

feature{ANY}
	
	build is
		do
			create vertices.make(24)
			vertices.put(create {VERTEX}.make(-1, 1, 1), 0)
			vertices.put(create {VERTEX}.make(-1, -1, 1), 1)
			vertices.put(create {VERTEX}.make(1, -1, 1), 2)
			vertices.put(create {VERTEX}.make(1, 1, 1), 3)
			vertices.put(create {VERTEX}.make(1, 1, -1), 4)
			vertices.put(create {VERTEX}.make(-1, 1, -1), 5)
			vertices.put(create {VERTEX}.make(-1, -1, -1), 6)
			vertices.put(create {VERTEX}.make(1, -1, -1), 7)
			
			vertices.put(create {VERTEX}.make(-1, 1, 1), 8)
			vertices.put(create {VERTEX}.make(-1, -1, 1), 9)
			vertices.put(create {VERTEX}.make(1, -1, 1), 10)
			vertices.put(create {VERTEX}.make(1, 1, 1), 11)
			vertices.put(create {VERTEX}.make(1, 1, -1), 12)
			vertices.put(create {VERTEX}.make(-1, 1, -1), 13)
			vertices.put(create {VERTEX}.make(-1, -1, -1), 14)
			vertices.put(create {VERTEX}.make(1, -1, -1), 15)
			
			vertices.put(create {VERTEX}.make(-1, 1, 1), 16)
			vertices.put(create {VERTEX}.make(-1, -1, 1), 17)
			vertices.put(create {VERTEX}.make(1, -1, 1), 18)
			vertices.put(create {VERTEX}.make(1, 1, 1), 19)
			vertices.put(create {VERTEX}.make(1, 1, -1), 20)
			vertices.put(create {VERTEX}.make(-1, 1, -1), 21)
			vertices.put(create {VERTEX}.make(-1, -1, -1), 22)
			vertices.put(create {VERTEX}.make(1, -1, -1), 23)

			-- Here, vertices can only be shared between two facets of the same cube's face because of texture mapping
			facets.add_last(create {FACET}.make(vertices.item(0), vertices.item(1), vertices.item(3)))
			facets.add_last(create {FACET}.make(vertices.item(1), vertices.item(2), vertices.item(3)))

			facets.add_last(create {FACET}.make(vertices.item(11), vertices.item(10), vertices.item(4)))
			facets.add_last(create {FACET}.make(vertices.item(10), vertices.item(7), vertices.item(4)))

			facets.add_last(create {FACET}.make(vertices.item(5), vertices.item(6), vertices.item(8)))
			facets.add_last(create {FACET}.make(vertices.item(6), vertices.item(9), vertices.item(8)))

			facets.add_last(create {FACET}.make(vertices.item(13), vertices.item(16), vertices.item(12)))
			facets.add_last(create {FACET}.make(vertices.item(16), vertices.item(19), vertices.item(12)))

			facets.add_last(create {FACET}.make(vertices.item(17), vertices.item(14), vertices.item(18)))
			facets.add_last(create {FACET}.make(vertices.item(14), vertices.item(15), vertices.item(18)))

			facets.add_last(create {FACET}.make(vertices.item(20), vertices.item(23), vertices.item(21)))
			facets.add_last(create {FACET}.make(vertices.item(23), vertices.item(22), vertices.item(21)))
			
			load_textures

			facets.item(facets.lower + 0).set_texture(texture)
			facets.item(facets.lower + 0).vertex1.set_2d_texture_coord(0, 1)
			facets.item(facets.lower + 0).vertex2.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 0).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 1).set_texture(texture)
			facets.item(facets.lower + 1).vertex1.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 1).vertex2.set_2d_texture_coord(1, 0)
			facets.item(facets.lower + 1).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 2).set_texture(texture)
			facets.item(facets.lower + 2).vertex1.set_2d_texture_coord(0, 1)
			facets.item(facets.lower + 2).vertex2.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 2).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 3).set_texture(texture)
			facets.item(facets.lower + 3).vertex1.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 3).vertex2.set_2d_texture_coord(1, 0)
			facets.item(facets.lower + 3).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 4).set_texture(texture)
			facets.item(facets.lower + 4).vertex1.set_2d_texture_coord(0, 1)
			facets.item(facets.lower + 4).vertex2.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 4).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 5).set_texture(texture)
			facets.item(facets.lower + 5).vertex1.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 5).vertex2.set_2d_texture_coord(1, 0)
			facets.item(facets.lower + 5).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 6).set_texture(texture)
			facets.item(facets.lower + 6).vertex1.set_2d_texture_coord(0, 1)
			facets.item(facets.lower + 6).vertex2.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 6).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 7).set_texture(texture)
			facets.item(facets.lower + 7).vertex1.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 7).vertex2.set_2d_texture_coord(1, 0)
			facets.item(facets.lower + 7).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 8).set_texture(texture)
			facets.item(facets.lower + 8).vertex1.set_2d_texture_coord(0, 1)
			facets.item(facets.lower + 8).vertex2.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 8).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 9).set_texture(texture)
			facets.item(facets.lower + 9).vertex1.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 9).vertex2.set_2d_texture_coord(1, 0)
			facets.item(facets.lower + 9).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 10).set_texture(texture)
			facets.item(facets.lower + 10).vertex1.set_2d_texture_coord(0, 1)
			facets.item(facets.lower + 10).vertex2.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 10).vertex3.set_2d_texture_coord(1, 1)

			facets.item(facets.lower + 11).set_texture(texture)
			facets.item(facets.lower + 11).vertex1.set_2d_texture_coord(0, 0)
			facets.item(facets.lower + 11).vertex2.set_2d_texture_coord(1, 0)
			facets.item(facets.lower + 11).vertex3.set_2d_texture_coord(1, 1)
		end
	
	load_textures is
		local
			image: BMP_IMG
		do
			create image.load_from_file("nehe.bmp")
			if image.is_loaded then
				create texture.make(image)
			end
		end

	turn (angle: REAL) is
		do
			set_orientation(0.2 * angle, 0.3 * angle, 0.4 * angle)
		end
	
feature{}
	texture: TEXTURE_2D
	vertices: FAST_ARRAY[VERTEX]

end
