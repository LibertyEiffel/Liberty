-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_INSERT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_PARENT]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Insert"

end
