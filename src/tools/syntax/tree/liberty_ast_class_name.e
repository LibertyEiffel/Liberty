class LIBERTY_AST_CLASS_NAME

inherit
	EIFFEL_TERMINAL_NODE_IMPL
		redefine
			accept
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_CLASS_NAME_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_class_name(Current)
		end

end
