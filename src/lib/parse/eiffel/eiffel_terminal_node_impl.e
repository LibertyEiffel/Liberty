class EIFFEL_TERMINAL_NODE_IMPL

inherit
	EIFFEL_TERMINAL_NODE

creation {EIFFEL_NODE_FACTORY}
	make

feature {ANY}
	name: STRING

	image: EIFFEL_IMAGE

	accept (visitor: VISITOR) is
		local
			v: EIFFEL_TERMINAL_NODE_IMPL_VISITOR
		do
			v ::= visitor
			v.visit_eiffel_terminal_node_impl(Current)
		end

feature {EIFFEL_NODE_HANDLER}
	display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING) is
		do
			do_indent(output, indent, p)
			output.put_character('"')
			output.put_string(name)
			output.put_string(once "%": ")
			output.put_line(image.image)
		end

	generate (o: OUTPUT_STREAM) is
		do
			o.put_string(image.blanks)
			o.put_string(image.image)
			generate_forgotten(o)
		end

feature {}
	make (a_name: like name; a_image: like image) is
		do
			name := a_name
			image := a_image
		ensure
			name = a_name
			image = a_image
		end

end -- class EIFFEL_TERMINAL_NODE_IMPL
