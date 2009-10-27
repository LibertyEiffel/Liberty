-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_R6

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E6]

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_times: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW *")
		end

	is_divide: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW /")
		end

	is_int_divide: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW //")
		end

	is_int_remainder: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).name.is_equal(once "KW \\")
		end

feature {ANY}
	name: STRING is "r6"

end
