class LIBERTY_AST_DEBUG_KEYS

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_STRING]
		export
			{ANY} valid_index, count, lower, upper, item
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Debug_Keys"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_DEBUG_KEYS_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_debug_keys(Current)
		end

end
