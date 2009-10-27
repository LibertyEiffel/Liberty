-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_INVARIANT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Invariant"

end
