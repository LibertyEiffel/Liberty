class LIBERTY_AST_ENSURE

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_ensure_then: BOOLEAN is
		local
			r: LIBERTY_AST_ENSURE_THEN
		do
			r ::= nodes.first
			Result := r.is_ensure_then
		end

feature {ANY}
	name: STRING is "Ensure"

end
