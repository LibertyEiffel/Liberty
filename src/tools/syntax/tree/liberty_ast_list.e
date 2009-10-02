deferred class LIBERTY_AST_LIST[N_ -> EIFFEL_NODE]
	-- An optional list preceded by a keyword.

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {}
	list: EIFFEL_LIST_NODE is
		require
			count > 1
		do
			Result ::= nodes.item(1)
		end

feature {LIBERTY_AST_HANDLER}
	list_valid_index (index: INTEGER): BOOLEAN is
		require
			count > 1
		do
			Result := list.valid_index(index)
		end

	list_count: INTEGER is
		require
			count > 1
		do
			Result := list.count
		end

	list_lower: INTEGER is
		require
			count > 1
		do
			Result := list.lower
		end

	list_upper: INTEGER is
		require
			count > 1
		do
			Result := list.upper
		end

	list_item (index: INTEGER): N_ is
		require
			count > 1
			valid_index(index)
		do
			Result ::= list.item(index)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 2 >> }
		end

end
