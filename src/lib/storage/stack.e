class STACK[E_]
	--
	-- A Stack of elements of type `E_'.
	--

insert
	FAST_ARRAY[E_]
		rename last as top,
			add_last as push,
			remove_last as pop,
			make as collection_make
		export {ANY} is_empty, top, pop, push, count;
			{STACK} all
		redefine new_iterator
		end
	ANY
		-- To get reasonable default exports
		undefine fill_tagged_out_memory, copy, is_equal
		end

creation {ANY}
	make, with_capacity

creation {FAST_ARRAY}
	collection_make

feature {}
	make is
		do
			with_capacity(16)
		ensure
			is_empty
		end

	new_iterator: ITERATOR[E_] is
		do
			check
				False
			end
		end

end -- class STACK
