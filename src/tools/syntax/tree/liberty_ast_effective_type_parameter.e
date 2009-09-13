class LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	type_definition: LIBERTY_AST_TYPE_DEFINITION is
		do
			Result ::= nodes.item(0)
		end

	type_parameters: LIBERYT_AST_TYPE_PARAMETERS is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "Effective_Type_Parameter"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_effective_type_parameter(Current)
		end

end
