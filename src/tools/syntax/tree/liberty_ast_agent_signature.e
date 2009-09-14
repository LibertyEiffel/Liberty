class LIBERTY_AST_AGENT_SIGNATURE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	has_return_type: BOOLEAN is
		do
			Result := (count = 3 or else count = 6)
			check
				Result = nodes.last.name.is_equal(once "Type_Definition")
			end
		end

	return_type: LIBERTY_AST_TYPE_DEFINITION is
		require
			has_return_type
		do
			Result ::= nodes.last
		end

	has_parameters: BOOLEAN is
		do
			Result := (count = 4 or else count = 6)
			check
				Result = (count > 2) and then nodes.item(2).name.is_equal(once "Declaration+")
			end
		end

	parameters: EIFFEL_LIST_NODE is
		require
			has_parameters
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Agent_Signature"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 3, 4, 6 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_AGENT_SIGNATURE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_agent_signature(Current)
		end

end
