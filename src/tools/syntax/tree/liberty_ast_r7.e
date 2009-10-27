-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_R7

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E7]
		export {LIBERTY_AST_HANDLER}
			expression, remainder
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_power: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.item(0).name.is_equal(once "KW ^")
			end
		end

feature {ANY}
	name: STRING is "r7"

end
