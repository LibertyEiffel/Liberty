class LIBERTY_AST_CLASS_NAME

inherit
	EIFFEL_TERMINAL_NODE_IMPL

feature {ANY}
	refclass: LIBERTY_AST_CLASS

	set_refclass (a_refclass: like refclass) is
		require
			a_refclass.classname.is_equal(image)
		do
			refclass := a_refclass
		ensure
			refclass = a_refclass
		end

invariant
	refclass /= Void implies refclass.classname.is_equal(image)

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_CLASS_NAME_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_class_name(Current)
		end

end
