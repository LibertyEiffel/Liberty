-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_VARIANT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	has_expression: BOOLEAN is
		do
			Result := count > 0
		end

	expression: LIBERTY_AST_EXPRESSION is
		require
			has_expression
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Variant"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 2 >> }
		end

end
