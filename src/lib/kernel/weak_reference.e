class WEAK_REFERENCE[G_]
	--
	-- Weak reference to some object of type G_.
	-- This kind of reference does not prevent the object of type G_ from being reclaimed by the garbage
	-- collector (in which case item returns Void).
	-- Item makes it possible to get (a strong reference to) the object.
	-- Inheriting from this class is prohibited.
	--
	-- Notes: when using the "-no_gc" option (i.e. no garbage collector), the behavior of WEAK_REFERENCE
	-- is equivalent to the behavior of REFERENCE. Also note that WEAK_REFERENCE is not yet implemented
	-- for `compile_to_jvm' (the behavior is the one of REFERENCE).
	--

inherit
	ANY

creation {ANY}
	set_item

feature {ANY}
	item: G_
			-- Return a (strong) reference to the object

	set_item (i: like item) is
			-- Set the object to be weak referenced
		do
			item := i
		ensure
			item = i
		end

end -- class WEAK_REFERENCE
