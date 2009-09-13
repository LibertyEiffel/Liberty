class LIBERTY_AST_ENTITY_NAME

inherit
	EIFFEL_TERMINAL_NODE_IMPL

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_ENTITY_NAME_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_entity_name(Current)
		end

end
