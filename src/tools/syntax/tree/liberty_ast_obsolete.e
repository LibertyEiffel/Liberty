class LIBERTY_AST_OBSOLETE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_CLASS}
	string: EIFFEL_TERMINAL_NODE is
		do
			if count = 2 then
				Result ::= nodes.item(1)
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
			Result := {AVL_SET[INTEGER] << 0, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_OBSOLETE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_obsolete(Current)
		end

end
