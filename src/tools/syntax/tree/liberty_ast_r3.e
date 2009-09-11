deferred class LIBERTY_AST_R3

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E3]
		redefine
			possible_counts
		end

feature {}
	is_and_then: BOOLEAN is
		do
			Result := count = 4
			check
				Result implies nodes.item(0).name.is_equal(once "KW and")
				Result implies nodes.item(1).name.is_equal(once "KW then")
			end
		ensure
			Result implies not is_empty
		end

	is_and: BOOLEAN is
		do
			Result := count = 3
			check
				Result implies nodes.item(0).name.is_equal(once "KW and")
			end
		end

feature {ANY}
	name: STRING is "r3"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 3, 4 >> }
		end

end
