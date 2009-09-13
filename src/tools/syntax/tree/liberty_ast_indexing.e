class LIBERTY_AST_INDEXING

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INDEXING_CLAUSE]
		export
			{ANY} valid_index, count, lower, upper
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	tag (index: INTEGER): LIBERTY_AST_ENTITY_NAME is
		require
			valid_index(index)
		do
			Result := nodes.item(index).entity_name
		end

	string (index: INTEGER): LIBERTY_AST_STRING is
		require
			valid_index(index)
		do
			Result := nodes.item(index).string
		end

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
