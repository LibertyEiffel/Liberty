class LIBERTY_AST_DECLARATION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	variables: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(0)
		end

	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Declaration"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 3 >> }
		end

end
