class LIBERTY_AST_INDEXING_CLAUSE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	entity_name: EIFFEL_TERMINAL_NODE is
		do
			Result ::= nodes.item(0)
		end

	string: EIFFEL_TERMINAL_NODE is
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

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_INDEXING_CLAUSE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_indexing_clause(Current)
		end

end
