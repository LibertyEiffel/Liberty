class LIBERTY_AST_CREATION_EXPRESSION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		do
			Result ::= nodes.item(2)
		end

	r10: LIBERTY_AST_R10 is
		do
			Result ::= nodes.item(4)
		end

feature {ANY}
	count: INTEGER is 5

	name: STRING is "Creation_Expression"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 5 >> }
		end

end
