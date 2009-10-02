class LIBERTY_AST_INDEXING

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INDEXING_CLAUSE]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Indexing"

end
