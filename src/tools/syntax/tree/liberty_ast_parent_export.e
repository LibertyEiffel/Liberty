class LIBERTY_AST_PARENT_EXPORT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_EXPORT]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Parent_Export"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PARENT_EXPORT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_parent_export(Current)
		end

end
