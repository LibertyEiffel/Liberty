class LIBERTY_AST_KEYWORD

inherit
	LIBERTY_AST_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_KEYWORD_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_keyword(Current)
		end

feature {}
	name_for_error_message: STRING is
		do
			Result := once ""
			Result.copy(name)
			Result.remove_prefix(once "KW ")
			Result.prepend(once "the keyword %"")
			Result.extend('%"')
		end

end
