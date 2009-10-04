class LIBERTY_FEATURE_TYPED_CONSTANT[E_]

inherit
	LIBERTY_FEATURE_CONSTANT

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_type: like result_type; a_value: like value) is
		require
			a_type /= Void
		do
			result_type := type
			value := a_value
		ensure
			result_type = a_type
			value = a_value
		end

invariant
	result_type /= Void

end
