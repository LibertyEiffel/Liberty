-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_CLASS

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	class_header: LIBERTY_AST_CLASS_HEADER is
		do
			Result ::= nodes.item(0)
		end

	obsolete_clause: LIBERTY_AST_OBSOLETE is
		do
			Result ::= nodes.item(1)
		end

	inherit_clause: LIBERTY_AST_INHERIT is
		do
			Result ::= nodes.item(2)
		end

	insert_clause: LIBERTY_AST_INSERT is
		do
			Result ::= nodes.item(3)
		end

	creations: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(4)
		end

	features: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(5)
		end

	invariant_clause: LIBERTY_AST_INVARIANT is
		do
			Result ::= nodes.item(6)
		end

feature {ANY}
	count: INTEGER is 9

	name: STRING is "Class"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 9 >> }
		end

end
