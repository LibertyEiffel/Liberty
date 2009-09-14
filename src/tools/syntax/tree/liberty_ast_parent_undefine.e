class LIBERTY_AST_PARENT_UNDEFINE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_FEATURE_NAME]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Parent_Undefine"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PARENT_UNDEFINE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_parent_undefine(Current)
		end

end
