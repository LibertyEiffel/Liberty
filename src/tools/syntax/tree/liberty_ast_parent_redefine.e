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

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PARENT_REDEFINE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_parent_redefine(Current)
		end

end
