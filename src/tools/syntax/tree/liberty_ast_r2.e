class LIBERTY_AST_R2

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E2]
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_or_else: BOOLEAN is
		do
			Result := count = 4
			check
				Result implies nodes.item(0).name.is_equal(once "KW or")
				Result implies nodes.item(1).name.is_equal(once "KW else")
			end
		ensure
			Result implies not is_empty
		end

	is_or: BOOLEAN is
		do
			Result := count = 3 and then nodes.item(0).name.is_equal(once "KW or")
		end

	is_xor: BOOLEAN is
		do
			Result := count = 3 and then nodes.item(0).name.is_equal(once "KW xor")
		end

feature {ANY}
	name: STRING is "r2"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3, 4 >> }
		end

end
