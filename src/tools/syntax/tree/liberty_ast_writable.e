class LIBERTY_AST_WRITABLE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_result: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW Result")
		end

	entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			not is_result
		do
			Result ::= nodes.first
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Writable"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_WRITABLE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_writable(Current)
		end

end
