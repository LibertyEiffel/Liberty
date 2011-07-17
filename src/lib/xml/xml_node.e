deferred class XML_NODE
	--
	-- A node in an XML_TREE
	--

feature {ANY}
	line, column: INTEGER
			-- The position of the node in its source file

	parent: XML_COMPOSITE_NODE
			-- The parent of the node, Void if it is the root

feature {XML_COMPOSITE_NODE}
	set_parent (a_parent: like parent) is
		require
			a_parent /= Void
		do
			parent := a_parent
		ensure
			parent = a_parent
		end

end -- class XML_NODE
