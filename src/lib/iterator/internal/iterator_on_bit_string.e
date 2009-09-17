class ITERATOR_ON_BIT_STRING
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[BOOLEAN]

creation {BIT_STRING}
	make

feature {}
	bit_string: BIT_STRING

	index: INTEGER

	make (bit_string_: like bit_string) is
		do
			bit_string := bit_string_
			start
		ensure
			bit_string = bit_string_
		end

feature {ANY}
	start is
		do
			index := bit_string.lower
		end

	is_off: BOOLEAN is
		do
			Result := index > bit_string.upper
		end

	item: BOOLEAN is
		do
			Result := bit_string.item(index)
		end

	next is
		do
			index := index + 1
		end

invariant
	bit_string /= Void

end -- class ITERATOR_ON_BIT_STRING
