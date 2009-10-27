-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_WHEN_SLICE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	low_value: LIBERTY_AST_WHEN_VALUE is
		do
			Result ::= nodes.item(0)
		end

	up_value: LIBERTY_AST_WHEN_VALUE is
		require
			has_up_value
		do
			Result ::= nodes.item(2)
		end

	has_up_value: BOOLEAN is
		do
			Result := count = 3
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "When_Slice"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 3 >> }
		end

end
