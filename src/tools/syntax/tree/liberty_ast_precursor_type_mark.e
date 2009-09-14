class LIBERTY_AST_PRECURSOR_TYPE_MARK

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	class_name: LIBERTY_AST_CLASS_NAME is
		require
			count /= 0
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Precursor_Type_Mark"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PRECURSOR_TYPE_MARK_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_precursor_type_mark(Current)
		end

end
