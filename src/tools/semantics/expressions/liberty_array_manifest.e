-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_ARRAY_MANIFEST

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	parameters: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := parameters_list
		end

	contents: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := contents_list
		end

feature {LIBERTY_TYPE_BUILDER}
	add_parameter (a_parameter: LIBERTY_EXPRESSION) is
		do
			parameters_list.add_last(a_parameter)
		end

	add_content (a_content: LIBERTY_EXPRESSION) is
		do
			contents_list.add_last(a_content)
		end

feature {}
	make (a_type: like result_type) is
		require
			a_type /= Void
		do
			result_type := a_type
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} parameters_list.make(0)
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} contents_list.make(0)
		ensure
			result_type = a_type
		end

	parameters_list: COLLECTION[LIBERTY_EXPRESSION]
	contents_list: COLLECTION[LIBERTY_EXPRESSION]

invariant
	result_type /= Void
	parameters_list /= Void

end
