class LIBERTY_AST_DEBUG_KEYS

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_STRING]
		redefine
			possible_counts
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Debug_Keys"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 3 >> }
		end

end
