class LIBERTY_AST_RESCUE_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Rescue_Block"

end
