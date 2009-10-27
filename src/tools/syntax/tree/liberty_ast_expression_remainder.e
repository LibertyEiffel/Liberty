-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_AST_EXPRESSION_REMAINDER[E_ -> LIBERTY_AST_NON_TERMINAL_NODE]

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {LIBERTY_AST_HANDLER}
	expression: E_ is
		require
			not is_empty
		do
			Result ::= nodes.item(nodes.upper-1)
		end

	remainder: like Current is
		require
			not is_empty
		do
			Result ::= nodes.last
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

end
