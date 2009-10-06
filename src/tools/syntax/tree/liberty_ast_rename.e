class LIBERTY_AST_RENAME

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	old_name: LIBERTY_AST_FEATURE_NAME is
		do
			Result ::= nodes.item(0)
		end

	new_name: LIBERTY_AST_FEATURE_NAME is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Rename"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3 >> }
		end

end
