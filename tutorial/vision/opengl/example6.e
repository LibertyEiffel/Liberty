class EXAMPLE6

inherit
	GRAPHIC

insert
	ARGUMENTS

creation
	make

feature{ANY}

	world: INTERACTIVE_WORLD

	win: TOPLEVEL_WINDOW

	angle: REAL
	
	make is
		local
			universal_world_loader: UNIVERSAL_WORLD_LOADER[LOADABLE_GL_OBJECT]
			universal_object_loader: UNIVERSAL_OBJECT_LOADER[LOADABLE_GL_OBJECT]
			universal_texture_loader: UNIVERSAL_TEXTURE_LOADER

			xml_world_loader: XML_WORLD_LOADER[LOADABLE_GL_OBJECT]
			xml_object_loader: XML_OBJECT_LOADER[LOADABLE_GL_OBJECT]
			bmp_texture_loader: BMP_TEXTURE_LOADER
		do
			if argument_count < 1 then
				io.put_string("[
					Usage: ./a.out <file name>

					Example: ./a.out world.xml
					         ./a.out world2.xml

					]")
			else
				create win.default_create
				win.set_title("Example 6")
				win.set_background_color(white_color)
				win.map

				create universal_world_loader.make
				create universal_object_loader.make
				create universal_texture_loader.make
			
				universal_world_loader.add_lookup_directory("data/world")
				universal_object_loader.add_lookup_directory("data/object")
				universal_texture_loader.add_lookup_directory("data/texture")

				create xml_world_loader.make
				create xml_object_loader.make
				create bmp_texture_loader.make
			
				universal_world_loader.add_loader("xml", xml_world_loader)
				universal_object_loader.add_loader("xml", xml_object_loader)
				universal_texture_loader.add_loader("bmp", bmp_texture_loader)

				create world.make_interactive(win, agent finish_program)
				universal_world_loader.load_world(world, argument(1), universal_object_loader, universal_texture_loader)

				win.when_close_requested(agent finish_program)

				vision.start
			end
		end

	finish_program is
		do
			vision.loop_stack.break
		end
end
