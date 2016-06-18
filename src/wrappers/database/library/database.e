note
	description: "Relational database."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date$"
	revision: "$Revision$"

deferred class DATABASE
feature {ANY}
	connect (a_connection_string: STRING)
			-- Connect to a database as specified by
			-- `a_connection_string'; its syntax is implementation
			-- specific.
		require
			valid_string: a_connection_string /= Void
		deferred
		ensure
			connect: last_action_success = is_connected
		end
	
	close
		deferred
		ensure
			closed: not is_connected
		end

	is_connected: BOOLEAN
		deferred
		end

	last_action_success: BOOLEAN
	
	execute (some_sql: STRING)
			-- execute `some_sql'. If it contains one or more queries 
			-- `result_set' will contain the result of the queries.
			-- set last_action_success
		require
			sql_not_void: some_sql /= Void
			connected: is_connected
		deferred
		end

	result_set: RESULT_SET [RESULT_ROW]
			-- Results of the last `execute' command.
		require
			valid: last_action_success
		deferred
		ensure
			result_not_void: Result /= Void
		end

	prepare_command (some_sql: STRING): PREPARED_COMMAND
			-- Prepare a new statement from `some_sql'. 
		require
			sql_not_void: some_sql /= Void
			connected: is_connected
		deferred
		end

	prepare_query (some_sql: STRING): PREPARED_QUERY
			-- Prepare a new statement from `some_sql'. 
		require
			sql_not_void: some_sql /= Void
			connected: is_connected
		deferred
		end

end
