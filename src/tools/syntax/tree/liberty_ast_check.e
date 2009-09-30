class LIBERTY_AST_CHECK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Check"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

end
