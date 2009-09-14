class LIBERTY_AST_REQUIRE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_require_else: BOOLEAN is
		local
			r: LIBERTY_AST_REQUIRE_ELSE
		do
			r ::= nodes.first
			Result := r.is_require_else
		end

	is_require_then: BOOLEAN is
		local
			r: LIBERTY_AST_REQUIRE_ELSE
		do
			r ::= nodes.first
			Result := r.is_require_then
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
