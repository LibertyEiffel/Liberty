deferred class XMLNS_NODE
	--
	-- A node in an XMLNS_TREE
	--

feature {ANY}
	line, column: INTEGER
			-- The position of the node in its source file

	parent: XMLNS_COMPOSITE_NODE
			-- The parent of the node, Void if it is the root

feature {XMLNS_COMPOSITE_NODE}
	set_parent (a_parent: like parent) is
		require
			a_parent /= Void
		do
			parent := a_parent
		ensure
			parent = a_parent
		end

end -- class XMLNS_NODE
