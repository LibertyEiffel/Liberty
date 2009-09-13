class LIBERTY_AST_ASSERTION_TAG

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	has_tag: BOOLEAN is
		do
			Result := count > 0
		end

	tag: LIBERTY_AST_ENTITY_NAME is
		require
			has_tag
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Assertion_Tag"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_ASSERTION_TAG_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_assertion_tag(Current)
		end

end
