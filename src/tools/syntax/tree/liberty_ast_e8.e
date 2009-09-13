class LIBERTY_AST_E8

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	has_prefix_operator: BOOLEAN is
		do
			Result := count = 2
		end

	prefix_operator: EIFFEL_TERMINAL_NODE is
		require
			has_prefix_operator
		do
			Resul t::= nodes.item(0)
		end

	prefixed_expression: LIBERTY_AST_E8 is
		require
			has_prefix_operator
		do
			Result ::= nodes.item(1)
		end

	e9: LIBERTY_AST_E9 is
		require
			not has_prefix_operator
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "e8"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 1, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_E8_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_e8(Current)
		end

end
