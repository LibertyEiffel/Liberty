class LIBERTY_AST_EIFFEL_BLOCK

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_external: BOOLEAN is
		do
			Result := count = 3
		ensure
			Result = not is_regular
		end

	is_regular: BOOLEAN is
		do
			Result := count = 7
		ensure
			Result = not is_external
		end

feature {}
	obsolete_clause: LIBERTY_AST_OBSOLETE is
		do
			Result ::= nodes.item(0)
		end

	require_clause: LIBERTY_AST_REQUIRE is
		require
			is_regular
		do
			Result ::= nodes.item(1)
		end

	local_block: LIBERTY_AST_LOCAL_BLOCK is
		require
			is_regular
		do
			Result ::= nodes.item(2)
		end

	do_block: LIBERTY_AST_DO_BLOCK is
		require
			is_regular
		do
			Result ::= nodes.item(3)
		end

	rescue_block: LIBERTY_AST_RESCUE_BLOCK is
		require
			is_regular
		do
			Result ::= nodes.item(4)
		end

	ensure_clause: LIBERTY_AST_ENSURE is
		require
			is_regular
		do
			Result ::= nodes.item(5)
		end

	external_clause: LIBERTY_AST_EXTERNAL is
		require
			is_external
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Eiffel_Block"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3, 7 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_EIFFEL_BLOCK_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_eiffel_block(Current)
		end

end
