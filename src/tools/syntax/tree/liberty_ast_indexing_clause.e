class LIBERTY_AST_INDEXING_CLAUSE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	entity_name: LIBERTY_AST_ENTITY_NAME is
		do
			Result ::= nodes.item(0)
		end

	string: LIBERTY_AST_STRING is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Indexing_Clause"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3 >> }
		end

end
