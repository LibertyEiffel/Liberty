wclass LIBERTY_AST_CLASS_HEADER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
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

feature {LIBERTY_AST_CLASS}
	indexing_clause: LIBERTY_AST_INDEXING is
		do
			Result ::= nodes.item(0)
		end

feature {LIBERTY_AST_CLASS}
	classname: STRING is
		do
			Result := class_name.image.image
		end

	is_deferred: BOOLEAN is
		do
			Result := class_marker.is_deferred
		end

	is_expanded: BOOLEAN is
		do
			Result := class_marker.is_expanded
		end

	is_separate: BOOLEAN is
		do
			Result := class_marker.is_separate
		end

feature {LIBERTY_AST_CLASS} -- class indexing
	indexing_valid_index (index: INTEGER): BOOLEAN is
		do
			Result := indexing_clause.valid_index(index)
		end

	indexing_count: INTEGER is
		do
			Result := indexing_clause.count
		end

	indexing_lower: INTEGER is
		do
			Result := indexing_clause.lower
		end

	indexing_upper: INTEGER is
		do
			Result := indexing_clause.upper
		end

	indexing_name (index: INTEGER): STRING is
		require
			indexing_valid_index(index)
		do
			Result := indexing_clause.name
		end

	indexing_string (index: INTEGER): STRING is
		require
			indexing_valid_index(index)
		do
			Result := indexing_clause.string
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "Class_Header"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 4 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_CLASS_HEADER_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_class_header(Current)
		end

end
