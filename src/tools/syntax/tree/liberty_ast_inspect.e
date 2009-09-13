class LIBERTY_AST_INSPECT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(1)
		end

	when_list: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(2)
		end

	else_clause: LIBERTY_AST_ELSE is
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is 5

	name: STRING is "Inspect"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 5 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_INSPECT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_inspect(Current)
		end

end
