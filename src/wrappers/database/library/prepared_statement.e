note
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PREPARED_STATEMENT

feature {} -- Creation
	make (a_database: DATABASE; some_sql: ABSTRACT_STRING)
			-- Makes a prepared command from `some_sql'
		require
			database_not_void: a_database /= Void 
			connected_database: a_database.is_connected
			sql_not_void: some_sql /= Void
		deferred
		end

feature	{ANY}
	parameter_count: INTEGER
			-- The number of paramenters to be provided to execute the
			-- statement. This number depends on `some_sql' passed to
			-- `make' feature.
		deferred
		end

	are_valid_parameters (some_parameters: TRAVERSABLE[VARIANT]): BOOLEAN 
			-- Are `some_parameters' valid for the current statement?
		require
			state: is_prepared
       local
         an_iter: ITERATOR[VARIANT]; j: INTEGER
      do
         Result := True;
         from
            an_iter := some_parameters.new_iterator;
            an_iter.start;
            j := 1;
         until
            an_iter.is_off or not Result
         loop
            Result := is_valid_parameter(an_iter.item, j);
            j := j + 1;
            an_iter.next;
         end-- loop
      end -- are_valid_parameters

	is_valid_parameter (a_parameter: VARIANT; an_index: INTEGER): BOOLEAN
			-- Is `a_parameter' placeble in statement's `an_index'-th parameter?
		require 
			parameter_not_void: a_parameter /= Void
			valid_index: an_index.in_range (1, parameter_count)
			state: is_prepared
		deferred 
		end

	execute (some_parameters: TRAVERSABLE[VARIANT])
			-- Execute the current SQL statment with `some_parameters'
			-- and set last_exec_success
		require 
			parameters_not_void: some_parameters /= Void
			correct_number_of_parameters: some_parameters.count = parameter_count
			state: is_prepared
			valid_paramaters: are_valid_parameters (some_parameters)
		deferred
		end
	
feature {ANY} -- State
	-- Status reporting for the prepared statement. The actual
	-- implementation of those features are backend depending

	is_prepared: BOOLEAN is deferred end
			-- Has the statement been successfully prepared? 

	is_stepped: BOOLEAN is deferred end
			-- Is the statement being queried for results?

	is_failed: BOOLEAN is deferred end
			-- Has the statement failed?

	last_exec_success: BOOLEAN  is deferred end
			-- was last call to execute successful?

	state: INTEGER 

end
