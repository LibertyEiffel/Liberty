class LIBERTY_AST_EXTERNAL

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	definition: LIBERTY_AST_STRING is
		do
			Result ::= nodes.item(1)
		end

	alias_clause: LIBERYT_AST_ALIAS is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "External"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_EXTERNAL_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_external(Current)
		end

end
