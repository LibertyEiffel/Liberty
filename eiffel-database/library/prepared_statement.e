indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PREPARED_STATEMENT
feature {DATABASE} -- Creation
	make (a_database: DATABASE; some_sql: STRING) is
			-- Makes a prepared command from `some_sql'
		require
			database_not_void: a_database /= Void 
			connected_database: a_database.is_connected
			sql_not_void: some_sql /= Void
		deferred
		end
	
	parameters_count: INTEGER is
			-- The number of paramenters to be provided to execute the
			-- statement. This number depends on `some_sql' passed to
			-- `make' feature.
		deferred
		end

	are_valid_parameters (some_parameters: TRAVERSABLE[ANY]): BOOLEAN is
			-- Are `some_parameters' valid for the current statement?
		deferred
		end

	is_valid_parameter (a_parameter: ANY; an_index: INTEGER): BOOLEAN is
			-- Is `a_parameter' placeble in statement's `an_index'-th parameter?
		require 
			parameter_not_void: a_parameter /= Void
			valid_index: an_index.in_range (1,parameters_count)
		deferred 
		end
end
