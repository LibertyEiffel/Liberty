class LIBERTY_AST_R1

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E1]

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_implies: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.first.name.is_equal(once "KW implies")
				not is_empty implies Result
			end
		ensure
			Result implies not is_empty
		end

feature {ANY}
	name: STRING is "r1"

end
