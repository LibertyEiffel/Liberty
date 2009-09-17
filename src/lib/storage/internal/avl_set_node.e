class AVL_SET_NODE[E_ -> COMPARABLE]
	--
	-- Auxiliary class to implement AVL_SET.
	--
	-- This a classic implementation of an AVL tree (balanced tree first
	-- designed by Adelson-Velskii and Landis, 1960)
	--

inherit
	AVL_TREE_NODE[E_]
	ANY_AVL_SET_NODE

creation {AVL_SET}
	default_create

feature {AVL_SET} -- Creation:
	make (i: like item) is
		do
			set_balance(balanced)
			left := Void
			right := Void
			set_item(i)
		ensure
			item = i
		end

end -- class AVL_SET_NODE
