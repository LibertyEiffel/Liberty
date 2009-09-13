class LIBERTY_AST_ARRAY

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	content: EIFFEL_LIST_NODE is
		do
			Result ::= node.item(0)
		end

	r10: LIBERTY_AST_R10 is
		do
			Result ::= node.item(1)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Array"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 3 >> }
		end

end
