class LIBERTY_AST_CLASS_HEADER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	class_marker: LIBERTY_AST_CLASS_MARKER is
		do
			Result ::= nodes.item(1)
		end

	class_name: LIBERTY_AST_CLASS_NAME is
		do
			Result ::= nodes.item(2)
		end

	type_parameters: LIBERTY_AST_TYPE_PARAMETERS is
		do
			Result ::= nodes.item(3)
		end

	indexing_clause: LIBERTY_AST_INDEXING is
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "Class_Header"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 4 >> }
		end

end
