class LIBERTY_AST_ASSIGNMENT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	writable: LIBERTY_AST_WRITABLE is
		do
			Result ::= nodes.item(0)
		end

	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(2)
		end

	is_normal_assignment: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW :=")
		ensure
			Result = not is_assignment_attempt and then not is_forced_assignment
		end

	is_assignment_attempt: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW ?=")
		ensure
			Result = not is_normal_assignment and then not is_forced_assignment
		end

	is_forced_assignment: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW ::=")
		ensure
			Result = not is_assignment_attempt and then not is_normal_assignment
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Assignment"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_ASSIGNMENT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_assignment(Current)
		end

end
