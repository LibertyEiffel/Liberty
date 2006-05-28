indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PREPARED_QUERY
inherit PREPARED_STATEMENT
feature
	execute (some_parameters: TRAVERSABLE[ANY]): RESULT_SET [RESULT_ROW] is
			-- Execute the current query with `some_parameters', 
			-- returning a result set.
		require 
			parameters_not_void: some_parameters /= Void
			correct_number_of_parameters: some_parameters.count = parameters_count
			valid_paramaters: are_valid_parameters (some_parameters)
		deferred
		end

	results: RESULT_SET[RESULT_ROW]
			-- The results of the current query

end
