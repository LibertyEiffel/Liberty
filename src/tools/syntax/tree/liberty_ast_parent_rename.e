-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_PARENT_RENAME

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_RENAME]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Parent_Rename"

end
