class LIBERTY_AST_TARGET

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_TARGET_VISITOR}
	is_result: BOOLEAN is
		do
			Result := count = 1 and then nodes.first.name.is_equal(once "KW Result")
		end

	is_current: BOOLEAN is
		do
			Result := count = 1 and then nodes.first.name.is_equal(once "KW Current")
		end

	is_parenthesized_expression: BOOLEAN is
		do
			Result := count = 3 and then nodes.first.name.is_equal(once "KW (")
		end

	is_precursor: BOOLEAN is
		do
			Result := count = 3 and then nodes.first.name.is_equal(once "KW Precursor")
		end

	is_implicit_feature_call: BOOLEAN is
		do
			Result := count = 2 and then nodes.first.name.is_equal(once "KW entity name")
		end

	parenthesized_expression: LIBERTY_AST_EXPRESSION is
		require
			is_parenthesized_expression
		do
			Result ::= nodes.item(1)
		end

	precursor_type_mark: LIBERTY_AST_PRECURSOR_TYPE_MARK is
		require
			is_precursor
		do
			Result ::= nodes.item(1)
		end

	implicit_feature_name: LIBERTY_AST_FEATURE_NAME is
		require
			is_implicit_feature_call
		do
			Result ::= nodes.item(0)
		end

	actuals: LIBERTY_AST_ACTUALS is
		require
			is_precursor or else is_implicit_feature_call
		do
			Result ::= nodes.last
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Target"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2, 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_TARGET_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_target(Current)
		end

end
