-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_TYPE_PARAMETER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	class_name: LIBERTY_AST_CLASS_NAME is
		do
			Result ::= nodes.item(0)
		end

	has_constraint: BOOLEAN is
		do
			Result := count = 3
			check
				Result implies nodes.item(2).name.is_equal(once "Type_Definition")
			end
		end

	constraint: LIBERTY_AST_TYPE_DEFINITION is
		require
			has_constraint
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Type_Parameter"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 3 >> }
		end

end
