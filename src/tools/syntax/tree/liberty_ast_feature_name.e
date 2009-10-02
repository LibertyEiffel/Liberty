class LIBERTY_AST_FEATURE_NAME

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_frozen: BOOLEAN is
		do
			Result := count = 2
			check
				Result implies nodes.first.name.is_equal(once "KW frozen")
			end
		end

	feature_name_or_alias: LIBERTY_AST_FEATURE_NAME_OR_ALIAS is
		do
			Result ::= nodes.last
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Feature_Name"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

end
