class LIBERTY_AST_CHARACTER

inherit
	EIFFEL_TERMINAL_NODE_IMPL
		redefine
			accept
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	value: CHARACTER is
		do
			-- TODO
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_CHARACTER_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_character(Current)
		end

end
