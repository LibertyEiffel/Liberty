-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Effective_Type_Parameter"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

end
