class LIBERTY_AST_OBSOLETE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_OBSOLETE_VISITOR}
	string: LIBERTY_AST_STRING is
		require
			count > 0
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
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
