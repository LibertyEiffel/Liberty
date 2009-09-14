class LIBERTY_AST_FEATURE_DEFINITION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	indexing_clause: LIBERTY_AST_INDEXING is
		do
			Result ::= nodes.item(0)
		end

	signature: LIBERTY_AST_SIGNATURE is
		do
			Result ::= nodes.item(1)
		end

	has_block: BOOLEAN is
		do
			Result := count = 4 and then nodes.item(3).name.is_equal(once "Eiffel_Block")
		end

	is_constant: BOOLEAN is
		do
			Result := count = 4 and then nodes.item(3).name.is_equal(once "Manifest_Or_Type_Test")
		end

	is_unique: BOOLEAN is
		do
			Result := count = 4 and then nodes.item(3).name.is_equal(once "KW unique")
		end

	block: LIBERTY_AST_EIFFEL_BLOCK is
		require
			has_block
		do
			Result ::= nodes.item(3)
		end

	constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST is
		require
			is_constant
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Feature_Definition"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2, 4 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_FEATURE_DEFINITION_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_feature_definition(Current)
		end

end
