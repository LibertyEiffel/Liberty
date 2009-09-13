class LIBERTY_AST_RETRY

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Retry"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 1 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_RETRY_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_retry(Current)
		end

end
