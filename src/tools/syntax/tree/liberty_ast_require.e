class LIBERTY_AST_REQUIRE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} valid_index, count, lower, upper, item
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
			r: LIBERTY_AST_REQUIRE_THEN
		do
			r ::= nodes.first
			Result := r.is_require_then
		end

feature {ANY}
	name: STRING is "Require"

end
