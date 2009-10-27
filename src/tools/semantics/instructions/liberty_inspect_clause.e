-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_INSPECT_CLAUSE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

	values: TRAVERSABLE[LIBERTY_INSPECT_SLICE] is
		do
			Result := values_list
		ensure
			Result = values_list
		end

feature {LIBERTY_TYPE_BUILDER}
	add_value (a_value: LIBERTY_INSPECT_SLICE) is
		require
			a_value /= Void
		do
			values_list.add_last(a_value)
		ensure
			values.last = a_value
		end

feature {}
	make (a_instructions: like instructions) is
		require
			a_instructions /= Void
		do
			instructions := a_instructions
			create {FAST_ARRAY[LIBERTY_INSPECT_SLICE]}values.make
		ensure
			instructions = a_instructions
		end

	values_list: COLLECTION[LIBERTY_INSPECT_SLICE]

invariant
	instructions /= Void
	values_list /= Void

end
