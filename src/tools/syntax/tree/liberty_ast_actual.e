class LIBERTY_AST_ACTUAL

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_ACTUAL_VISITOR}
	is_expression: BOOLEAN is
		do
			Result := count = 1
			check
				Result = nodes.first.name.is_equal(once "Expression")
			end
		end

	is_ref_to_entity: BOOLEAN is
		do
			Result := count = 2
			check
				Result = nodes.first.name.is_equal(once "KW $")
			end
		end

	expression: LIBERTY_AST_EXPRESSION is
		require
			is_expression
		do
			Result ::= nodes.item(0)
		end

	entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			is_ref_to_entity
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Actual"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_ACTUAL_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_actual(Current)
		end

end
