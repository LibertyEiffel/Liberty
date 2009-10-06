class LIBERTY_FEATURE_CONSTANT

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

feature {}
	make (a_type: LIBERTY_TYPE; a_expression: like expression) is
		require
			a_expression /= Void
			a_type /= Void
			a_expression.result_type.is_conform_to(a_type)
		do
			make_late_binding
			expression := a_expression
			result_type := a_type
		ensure
			expression = a_expression
			result_type = a_type
		end

invariant
	expression /= Void
	result_type /= Void

end
