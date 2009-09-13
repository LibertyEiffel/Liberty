class LIBERTY_AST_ELSE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Else"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_ELSE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_else(Current)
		end

end
