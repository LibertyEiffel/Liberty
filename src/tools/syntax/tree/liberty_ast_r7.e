deferred class LIBERTY_AST_R7

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E7]

feature {}
	is_power: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.item(0).is_equal(once "KW ^")
			end
		end

feature {ANY}
	name: STRING is "r7"

end
