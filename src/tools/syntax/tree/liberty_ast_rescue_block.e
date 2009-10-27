-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_RESCUE_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Rescue_Block"

end
