class LIBERTY_AST_E6

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	e7: LIBERTY_AST_E7 is
		do
			Result ::= nodes.item(0)
		end

	r7: LIBERTY_AST_R7 is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "e6"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_E6_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_e6(Current)
		end

end
