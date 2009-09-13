class LIBERTY_AST_PARENT_CLAUSE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	has_clauses: BOOLEAN is
		do
			Result := count = 5
		end

	rename_clause: LIBERTY_AST_PARENT_RENAME is
		require
			has_clauses
		do
			Result ::= nodes.item(0)
		end

	export_clause: LIBERTY_AST_PARENT_EXPORT is
		require
			has_clauses
		do
			Result ::= nodes.item(1)
		end

	undefine_clause: LIBERTY_AST_PARENT_UNDEFINE is
		require
			has_clauses
		do
			Result ::= nodes.item(2)
		end

	redefine_clause: LIBERTY_AST_PARENT_REDEFINE is
		require
			has_clauses
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Parent_Clause"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 1, 5 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PARENT_CLAUSE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_parent_clause(Current)
		end

end
