-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_ENSURE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	ensure_then: LIBERTY_AST_ENSURE_THEN is
		do
			Result ::= nodes.first
		end

feature {ANY}
	name: STRING is "Ensure"

end
