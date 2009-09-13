class LIBERTY_AST_DEBUG

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	debug_keys: LIBERTY_AST_DEBUG_KEYS is
		do
			Result ::= nodes.item(1)
		end

	instructions: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "Debug"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 4 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_DEBUG_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_debug(Current)
		end

end
