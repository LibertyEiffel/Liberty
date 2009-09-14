class LIBERTY_AST_DO_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_do: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW do")
		ensure
			Result implies count = 2
		end

	is_once: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW once")
		ensure
			Result implies count = 2
		end

	is_deferred: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW deferred")
		ensure
			Result implies count = 1
		end

	is_attribute: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW attribute")
		ensure
			Result implies count = 1
		end

feature {}
	keyword: EIFFEL_TERMINAL_NODE is
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	name: STRING is "Do_Block"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_DO_BLOCK_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_do_block(Current)
		end

end
