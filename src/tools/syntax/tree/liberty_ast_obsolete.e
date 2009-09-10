class LIBERTY_AST_OBSOLETE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_CLASS}
	string: STRING is
		local
			string: EIFFEL_TERMINAL_NODE
		do
			if count = 2 then
				string ::=  ::= nodes.item(1)
				Result := string.image
			end
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Obsolete"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 2 >> }
		end

end
