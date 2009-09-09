class LIBERTY_AST_CLASS_HEADER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	indexing_clause: LIBERTY_AST_INDEXING is
		do
			Result ::= nodes.item(0)
		end

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

	classname: STRING is
		do
			Result := class_name.image.image
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "Class_Header"

end
