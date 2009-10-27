-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_CLASS_MARKER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	first_keyword: STRING is
		local
			keyword: EIFFEL_TERMINAL_NODE
		do
			keyword ::= nodes.first
			Result := keyword.name
		end

feature {LIBERTY_AST_HANDLER}
	is_deferred: BOOLEAN is
		do
			Result := count = 2 and then first_keyword.is_equal(once "KW deferred")
		end

	is_expanded: BOOLEAN is
		do
			Result := count = 2 and then first_keyword.is_equal(once "KW expanded")
		end

	is_separate: BOOLEAN is
		do
			Result := count = 2 and then first_keyword.is_equal(once "KW separate")
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Class_Marker"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

end
