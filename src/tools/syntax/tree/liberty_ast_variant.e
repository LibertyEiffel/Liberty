class LIBERTY_AST_VARIANT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	has_variant: BOOLEAN is
		do
			Result := count > 0
		end

	variant_expression: LIBERTY_AST_EXPRESSION is
		require
			has_variant
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Variant"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_VARIANT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_variant(Current)
		end

end
