-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_LOCAL_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_DECLARATION]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Local_Block"

end
