class LIBERTY_AST_INDEXING

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INDEXING_CLAUSE]
		export
			{LIBERTY_AST_INDEXING_VISITOR} list_valid_index, list_count, list_lower, list_upper
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Indexing"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_INDEXING_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_indexing(Current)
		end

end
