class LIBERTY_AST_R5

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E5]
		export {LIBERTY_AST_R5_VISITOR}
			expression, remainder
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_R5_VISITOR}
	is_plus: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW +")
		end

	is_minus: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW -")
		end

feature {ANY}
	name: STRING is "r5"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_R5_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_r5(Current)
		end

end
