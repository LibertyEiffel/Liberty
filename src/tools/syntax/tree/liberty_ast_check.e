class LIBERTY_AST_CHECK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		redefine
			possible_counts
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Check"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_CHECK_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_check(Current)
		end

end
