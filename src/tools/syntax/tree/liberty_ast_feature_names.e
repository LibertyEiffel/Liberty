class LIBERTY_AST_FEATURE_NAMES

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_frozen: BOOLEAN is
		do
			Result := count = 2
			check
				Result implies nodes.item(0).name.is_equal(once "KW frozen")
			end
		end

	names: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.last
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Feature_Names"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 1, 2 >> }
		end

end
