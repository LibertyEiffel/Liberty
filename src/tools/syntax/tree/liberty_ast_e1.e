class LIBERTY_AST_E1

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	e2: LIBERTY_AST_E2 is
		do
			Result ::= nodes.item(0)
		end

	r2: LIBERTY_AST_R2 is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "e1"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_E1_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_e1(Current)
		end

end
