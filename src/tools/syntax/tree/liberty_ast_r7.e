class LIBERTY_AST_R7

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E7]

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_power: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.item(0).name.is_equal(once "KW ^")
			end
		end

feature {ANY}
	name: STRING is "r7"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_R7_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_r7(Current)
		end

end
