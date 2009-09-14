class LIBERTY_AST_R4

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E4]

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_eq: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW =")
		end

	is_ne: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW /=")
		end

	is_le: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW <=")
		end

	is_lt: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW <")
		end

	is_ge: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW >=")
		end

	is_gt: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW >")
		end

feature {ANY}
	name: STRING is "r4"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_R4_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_r4(Current)
		end

end
