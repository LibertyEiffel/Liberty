deferred class LIBERTY_AST_R5

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E5]

feature {}
	is_plus: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW +")
		end

	is_minus: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW -")
		end

feature {ANY}
	name: STRING is "r5"

end
