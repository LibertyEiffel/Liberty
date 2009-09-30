class LIBERTY_AST_INHERIT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_PARENT]

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Inherit"

end
