-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_ELSE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Else"

end
