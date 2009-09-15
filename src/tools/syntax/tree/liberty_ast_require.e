class LIBERTY_AST_REQUIRE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_REQUIRE_VISITOR}
	require_else: LIBERTY_AST_REQUIRE_ELSE is
		do
			Result ::= nodes.first
		end

feature {ANY}
	name: STRING is "Require"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_REQUIRE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_require(Current)
		end

end
