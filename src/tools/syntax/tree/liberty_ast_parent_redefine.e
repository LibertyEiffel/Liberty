class LIBERTY_AST_PARENT_REDEFINE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_FEATURE_NAME]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Parent_Redefine"

end
