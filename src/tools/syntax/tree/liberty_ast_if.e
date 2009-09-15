class LIBERTY_AST_IF

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_IF_VISITOR}
	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(1)
		end

	instructions: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "If"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 4 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_IF_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_if(Current)
		end

end
