class LIBERTY_STRING_MANIFEST

inherit
	LIBERTY_TYPED_MANIFEST[STRING]
		rename
			make as typed_make
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	is_once: BOOLEAN

feature {}
	make (a_type: like result_type; a_value: like value; a_once: like is_once) is
		require
			a_type /= Void
		do
			typed_make(a_type, a_value)
			is_once := a_once
		ensure
			result_type = a_type
			value = a_value
			is_once = a_once
		end

invariant
	result_type /= Void

end
