class PRINTABLE_REFERENCE[E_]

inherit
	ANY
		redefine
			out_in_tagged_out_memory
		end

creation {ANY}
	set_item

feature {ANY}
	item: E_

	set_item (item_: like item) is
		require
			item_ /= Void
		do
			item := item_
		ensure
			item = item_
		end

feature {ANY}
	out_in_tagged_out_memory is
		do
			item.out_in_tagged_out_memory
		end

end -- class PRINTABLE_REFERENCE
