class LIBERTY_AST_INHERIT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_PARENT]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Inherit"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_INHERIT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_inherit(Current)
		end

end
