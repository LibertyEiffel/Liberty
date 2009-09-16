class LIBERTY_AST_CLIENT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_FEATURE_VISITOR}
	is_type_definition: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "Type_Definition")
			check
				not Result implies nodes.first.name.is_equal(once "KW class name")
			end
		end

	class_name: LIBERTY_AST_CLASS_NAME is
		require
			not is_type_definition -- legacy
		do
			Result ::= nodes.first
		end

	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		require
			is_type_definition
		do
			Result ::= nodes.first
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Client"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_CLIENT_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_client(Current)
		end

end
