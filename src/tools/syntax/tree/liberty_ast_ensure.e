class LIBERTY_AST_ENSURE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_ensure_then: BOOLEAN is
		local
			r: LIBERTY_AST_ENSURE_THEN
		do
			r ::= nodes.first
			Result := r.is_ensure_then
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
