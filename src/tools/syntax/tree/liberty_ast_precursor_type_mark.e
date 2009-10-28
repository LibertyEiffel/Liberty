-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_PRECURSOR_TYPE_MARK

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		require
			count /= 0
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Precursor_Type_Mark"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

end
