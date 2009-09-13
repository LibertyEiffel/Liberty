class LIBERTY_AST_INVARIANT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Invariant"

end
