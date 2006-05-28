indexing
	description: "A statement that has no result."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Note: this is pratically empty by design because in the Eiffel 
			-- world commands can be issued and the program can continue 
			-- while a query has to wait for its result to be ready.

deferred class PREPARED_COMMAND
inherit PREPARED_STATEMENT
feature
	execute (some_parameters: TRAVERSABLE[ANY]) is
			-- Execute the current query with `some_parameters'
		require 
			parameters_not_void: some_parameters /= Void
			correct_number_of_parameters: some_parameters.count = parameters_count
			valid_paramaters: -- TODO: are_valid_parameters
			-- (some_parameters) currently unimplemented for SQLite wrappers
		deferred
		end
end
