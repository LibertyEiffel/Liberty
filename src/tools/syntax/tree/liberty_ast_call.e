class LIBERTY_AST_CALL

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	target: LIBERTY_AST_TARGET is
		do
			Result ::= node.item(0)
		end

	r10: LIBERTY_AST_R10 is
		do
			Result ::= node.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "Call"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 2 >> }
		end

end
