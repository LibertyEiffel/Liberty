class REFERENCE[E_]
	--
	-- This class is useful to share a common volatile expanded value between different objects or as the
	-- result of a once function.
	-- So in most cases the E_ type is expanded and the reference to the REFERENCE[E_] container object is
	-- shared.
	--

inherit
	ANY

creation {ANY}
	default_create, set_item

feature {ANY}
	item: E_

	set_item (i: like item) is
		do
			item := i
		ensure
			item = i
		end

	clear is
			-- Reset `item' with the default value.
		local
			default_item: like item
		do
			item := default_item
		end

end -- class REFERENCE
