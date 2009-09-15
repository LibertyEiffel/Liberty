class LIBERTY_AST_VARIABLE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_VARIABLE_VISITOR}
	variable: LIBERTY_AST_ENTITY_NAME is
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Variable"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_VARIABLE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_variable(Current)
		end

end
