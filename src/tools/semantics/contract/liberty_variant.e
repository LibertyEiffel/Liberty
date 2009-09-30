class LIBERTY_VARIANT

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

feature {}
	make (a_expression: like expression) is
		require
			a_expression /= Void
		do
			expression := a_expression
		ensure
			expression = a_expression
		end

invariant
	expression /= Void

end
