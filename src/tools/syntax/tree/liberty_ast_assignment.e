-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_ASSIGNMENT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	writable: LIBERTY_AST_WRITABLE is
		do
			Result ::= nodes.item(0)
		end

	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(2)
		end

	is_regular_assignment: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW :=")
		ensure
			Result = not is_assignment_attempt and then not is_forced_assignment
		end

	is_assignment_attempt: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW ?=")
		ensure
			Result = not is_regular_assignment and then not is_forced_assignment
		end

	is_forced_assignment: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW ::=")
		ensure
			Result = not is_assignment_attempt and then not is_regular_assignment
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Assignment"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3 >> }
		end

end
