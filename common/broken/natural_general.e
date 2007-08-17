indexing
	description: "general non-negative (natural) number"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	authors: "Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class NATURAL_GENERAL[TYPE_ -> COMPARABLE]

inherit
	COMPARABLE
		redefine
			fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
		end

feature {ANY} -- initialization
	make_from_signed (model: TYPE_) is
		do
			item := model
		end

feature {ANY} -- neutreal elements for + and *
	one: like Current is
		deferred
		end
	
	zero: like Current is
		deferred
		end
	
feature {ANY}
	infix "+" (other: like Current): like Current is
		require
			-- TODO: contracts
			no_overflow: item >= 0 and other.item >= 0
		do
			Result := Current #+ other
		ensure
			Result #- other = Current
		end

	infix "-" (other: like Current): like Current is
		require
			-- TODO: contracts
			no_overflow: item >= other.item
		do
			Result := Current #- other
		ensure
			valid_result: Result + other = Current
		end

feature {ANY} -- comparision
	is_equal (other: like Current): BOOLEAN is
		do
			Result := item.is_equal (other.item)
		end
	
	infix "<" (other: like Current): BOOLEAN is
		do
			-- TODO: check this
--			if item > 0 and other.item > 0 then
				Result := item < other.item
--			elseif item > 0 then
--				Result := True
--			elseif other.item > 0 then
--				Result := False
--			else
--				Result := item > other.item
--			end
		end

feature {ANY} -- Miscellaneous
	divisible (other: like Current): BOOLEAN is
		do
			Result := other /= zero
		end	
	
feature {ANY} -- overflowing operators
	infix "#+" (other: like Current): like Current is
		do
			-- TODO:
			Result.make_from_signed (item + other.item)
		end
	
	infix "#-" (other: like Current): like Current is
		do
			-- TODO
			Result.make_from_signed (item - other.item)
		end

	infix "#\\" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result.make_from_signed (int_sharp_mod(item, other.item))
		ensure
			(Current - Result) #\\ other = 0
		end

	infix "#//" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result.make_from_signed (int_sharp_div(item, other.item))
		ensure
			Result * other + Current #\\ other = Current
		end
	
feature {ANY} -- Object printing
	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			Current.append_in(tagged_out_memory)
		end

	append_in (buffer: STRING) is
			-- Append in the `buffer' the equivalent of `to_string'.
			-- If you look for performances, you should always prefer `append_in' which allow you to recycle
			-- a unique common `buffer' (each call of `to_string' allocate a new object!).
			--
			-- See also `append_in_format', `append_in_unicode', `append_in_unicode_format', `to_hexadecimal_in'.
		require
			buffer /= Void
		local
			val: like Current; i, idx: INTEGER
		do
			if Current = zero then
				buffer.extend('0')
			else
				from
					-- Save the position of first character in the buffer.
					i := buffer.count + 1
				until
					val = zero
				loop
					buffer.extend((val #\\ 10).decimal_digit)
					val := val #// 10
				end
				-- Change character order.
				from
					idx := buffer.count
				until
					i >= idx
				loop
					buffer.swap(i, idx)
					idx := idx - 1
					i := i + 1
				end
			end
		end

feature {} -- externals
	int_sharp_mod (x, y: like Current): like Current is
		-- correctly casted Result := x #\\ y
		deferred
		end
	
	int_sharp_div (x, y: like Current): like Current is
		-- correctly casted Result := x #// y
		deferred
		end
	
feature {NATURAL_GENERAL}
	item: TYPE_

end
