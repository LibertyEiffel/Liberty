class LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER]
		export
			{ANY} valid_index, count, lower, upper, item, possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Effective_Type_Parameters"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 3 >> }
		end

end
