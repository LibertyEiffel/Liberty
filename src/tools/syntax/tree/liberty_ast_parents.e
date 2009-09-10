deferred class LIBERTY_AST_PARENTS

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {}
	parents: EIFFEL_LIST_NODE is
		require
			count > 0
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := count > 0 and then parents.valid_index(index)
		end

	count: INTEGER is
		do
			Result := count > 0 and then parents.count
		end

	lower: INTEGER is
		do
			if count > 0 then
				Result := parents.lower
			end
		end

	upper: INTEGER is
		do
			if count > 0 then
				Result := parents.upper
			else
				Result := -1
			end
		end

	parent (index: INTEGER): LIBERTY_AST_PARENT is
		require
			valid_index(index)
		do
			Result ::= parents.item(index)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 2 >> }
		end

end
