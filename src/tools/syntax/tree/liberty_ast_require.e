class LIBERTY_AST_REQUIRE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	require_else: LIBERTY_AST_REQUIRE_ELSE is
		do
			Result ::= nodes.first
		end

feature {ANY}
	name: STRING is "Require"

end
