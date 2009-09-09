class LIBERTY_AST_CLASS

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
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

	creations: LIBERTY_AST_CREATIONS is
		do
			Result ::= nodes.item(4)
		end

	features: LIBERTY_AST_FEATURES is
		do
			Result ::= nodes.item(5)
		end

	invariant_clause: LIBERTY_AST_INVARIANT is
		do
			Result ::= nodes.item(6)
		end

	classname: STRING is
		do
			Result := class_header.classname
		end

feature {ANY}
	count: INTEGER is 9

	name: STRING is "Class"

end
