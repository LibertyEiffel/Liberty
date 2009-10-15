class STRING_PRINTER

inherit
	STRING_FORMATTER

creation {ANY}
	make

feature {ANY}
	make (output_: like output) is
		require
			output_.is_connected
		do
			output := output_
		ensure
			output = output_
		end

feature {}
	put (c: CHARACTER) is
		do
			output.put_character(c)
		end

	put_item (item: ANY) is
		do
			item.print_on(output)
		end

feature {}
	output: OUTPUT_STREAM

end -- class STRING_PRINTER
