class LIBERTY_AST_WHEN_SLICE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_WHEN_SLICE_VISITOR}
	low_value: LIBERTY_AST_WHEN_VALUE is
		do
			Result ::= nodes.item(0)
		end

	up_value: LIBERTY_AST_WHEN_VALUE is
		require
			count = 3
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "When_Slice"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_WHEN_SLICE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_when_slice(Current)
		end

end
