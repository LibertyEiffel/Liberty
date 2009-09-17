class LIBERTYC

insert
	ARGUMENTS

create {}
	make

feature {}
	make is
		local
			universe: LIBERTY_UNIVERSE
			root: LIBERTY_TYPE
		do
			if argument_count /= 1 then
				std_error.put_line("This is a bootstrap version of the compiler; it only accepts two arguments - the path to loadpath.se and the name of the root class which must have a %"make%" creation procedure.")
				die_with_code(1)
			end

			create universe.make(argument(1))
			root := universe.get_type(Void, argument(2), create {FAST_ARRAY[LIBERTY_TYPE]}.with_capacity(0))

			std_output.put_line("Done: root=" + root.hash_code.out)
		end

end
