class LIBERTY_AST_ACTUALS

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ACTUAL]
		export
			{ANY} valid_index, count, lower, upper, item
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Actuals"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 3 >> }
		end

end
