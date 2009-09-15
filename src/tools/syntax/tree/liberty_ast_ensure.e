class LIBERTY_AST_ENSURE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{LIBERTY_AST_ENSURE_VISITOR} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_ENSURE_VISITOR}
	ensure_then: LIBERTY_AST_ENSURE_THEN is
		do
			Result ::= nodes.first
		end

feature {ANY}
	name: STRING is "Ensure"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_ENSURE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_ensure(Current)
		end

end
