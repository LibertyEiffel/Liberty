class MACRO_COMMAND[C_ -> COMMAND]
	--
	-- A very useful kind of Command: that's a bunch of commands to be executed at once.
	--

inherit
	COMMAND
		undefine fill_tagged_out_memory
		redefine copy, is_equal
		end
	COLLECTION[C_]

insert
	FAST_ARRAY[C_]
		redefine copy, is_equal
		end

creation {ANY}
	make, with_capacity

feature {ANY}
	execute is
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper
			loop
				item(i).execute
				i := i + 1
			end
		end

	copy (other: like Current) is
		do
			Precursor {FAST_ARRAY} (other)
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := Precursor {FAST_ARRAY} (other)
		end

end -- class MACRO_COMMAND
