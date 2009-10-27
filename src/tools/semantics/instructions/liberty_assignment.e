deferred class LIBERTY_ASSIGNMENT

inherit
	LIBERTY_INSTRUCTION

feature {ANY}
	writable: LIBERTY_WRITABLE
	expression: LIBERTY_EXPRESSION

feature {}
	make (a_writable: like writable; a_expression: like expression) is
		require
			a_writable /= Void
			a_expression /= Void
		do
			writable := a_writable
			expression := a_expression
		ensure
			writable = a_writable
			expression = a_expression
		end

invariant
	writable /= Void
	expression /= Void

end
