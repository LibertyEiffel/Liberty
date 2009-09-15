class LIBERTY_AST_EXPRESSION_NO_ARRAY

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_EXPRESSION_NO_ARRAY_VISITOR}
	e1: LIBERTY_AST_E1 is
		do
			Result ::= nodes.item(0)
		end

	r1: LIBERTY_AST_R1 is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "Expression_No_Array"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_EXPRESSION_NO_ARRAY_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_expression_no_array(Current)
		end

end
