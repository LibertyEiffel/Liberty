class LIBERTY_AST_PARENT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	type_definition: LIBERTY_AST_TYPE_DEFINTION is
		do
			Result ::= nodes.item(0)
		end

	parent_clause: LIBERTY_AST_PARENT_CLAUSE is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "Parent"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 2 >> }
		end

end
