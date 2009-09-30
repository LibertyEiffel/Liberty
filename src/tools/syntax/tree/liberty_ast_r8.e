class LIBERTY_AST_R8

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E8]
		export {LIBERTY_AST_HANDLER}
			expression, remainder
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_free_operator: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.item(0).name.is_equal(once "KW free operator")
			end
		end

feature {ANY}
	name: STRING is "r8"

end
