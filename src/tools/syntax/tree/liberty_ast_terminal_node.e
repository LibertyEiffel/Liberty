deferred class LIBERTY_AST_TERMINAL_NODE

inherit
	EIFFEL_TERMINAL_NODE

feature {ANY}
	name: STRING

	image: EIFFEL_IMAGE

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
		require
			a_name.has_prefix(once "KW ")
		do
			name := a_name
			image := a_image
		ensure
			name = a_name
			image = a_image
		end

end
