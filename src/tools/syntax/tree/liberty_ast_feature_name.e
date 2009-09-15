class LIBERTY_AST_FEATURE_NAME

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_FEATURE_NAME_VISITOR}
	is_infix: BOOLEAN is
		do
			Result := count = 2 and then nodes.first.name.is_equal(once "KW infix")
		ensure
			Result implies not is_regular and then not is_prefix
		end

	is_prefix: BOOLEAN is
		do
			Result := count = 2 and then nodes.first.name.is_equal(once "KW prefix")
		ensure
			Result implies not is_regular and then not is_infix
		end

	is_regular: BOOLEAN is
		do
			Result := count = 1
		ensure
			Result implies not is_prefix and then not is_infix
		end

	entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			is_regular
		do
			Result ::= nodes.item(0)
		end

	free_operator_name: LIBERTY_AST_STRING is
		require
			is_prefix or else is_infix
		do
			Result ::= nodes.item(1)
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

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_FEATURE_NAME_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_feature_name(Current)
		end

end
