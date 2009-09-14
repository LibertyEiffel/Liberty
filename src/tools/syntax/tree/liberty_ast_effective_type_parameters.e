class LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item, possible_counts
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Effective_Type_Parameters"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_effective_type_parameters(Current)
		end

end
