class LIBERTY_AST_PARENT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_PARENT_VISITOR}
	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		do
			Result ::= nodes.item(0)
		end

	parent_clause: LIBERTY_AST_PARENT_CLAUSE is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "Parent"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PARENT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_parent(Current)
		end

end
