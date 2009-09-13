class LIBERTY_AST_STRING

inherit
	EIFFEL_TERMINAL_NODE_IMPL
		redefine
			accept
		end

feature {ANY}
	value: STRING is
		do
			-- TODO
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_STRING_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_string(Current)
		end

end
