class LIBERTY_AST_LOCAL_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_DECLARATION]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Local_Block"

end
