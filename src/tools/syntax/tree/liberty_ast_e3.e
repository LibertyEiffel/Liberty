-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_E3

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	e4: LIBERTY_AST_E4 is
		do
			Result ::= nodes.item(0)
		end

	r4: LIBERTY_AST_R4 is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "e3"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2 >> }
		end

end
