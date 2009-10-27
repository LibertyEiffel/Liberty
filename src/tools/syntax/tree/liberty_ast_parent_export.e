-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_PARENT_EXPORT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_EXPORT]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Parent_Export"

end
