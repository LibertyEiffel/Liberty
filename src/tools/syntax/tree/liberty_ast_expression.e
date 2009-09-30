class LIBERTY_AST_EXPRESSION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_array: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "Array")
		end

	array: LIBERTY_AST_ARRAY is
		require
			is_array
		do
			Result ::= nodes.first
		end

	no_array: LIBERTY_AST_EXPRESSION_NO_ARRAY is
		require
			not is_array
		do
			Result ::= nodes.first
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Expression"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

end
