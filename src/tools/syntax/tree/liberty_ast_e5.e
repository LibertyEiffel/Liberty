-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_E5

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	e6: LIBERTY_AST_E6 is
		do
			Result ::= nodes.item(0)
		end

	r6: LIBERTY_AST_R6 is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "e5"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2 >> }
		end

end
