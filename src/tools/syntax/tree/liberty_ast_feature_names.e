class LIBERTY_AST_FEATURE_NAMES

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_frozen: BOOLEAN is
		do
			Result := count = 2
			check
				Result implies nodes.item(0).name.is_equal(once "KW frozen")
			end
		end

	names: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.last
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Feature_Names"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_FEATURE_NAMES_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_feature_names(Current)
		end

end
