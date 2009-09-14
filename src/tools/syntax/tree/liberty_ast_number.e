class LIBERTY_AST_NUMBER

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
			v: LIBERTY_AST_NUMBER_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_number(Current)
		end

end
