indexing
	description: "Relational database."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class DATABASE
feature 
	connect (a_connection_string: STRING) is
			-- Connect to a database as specified by
			-- `a_connection_string'; its syntax is implementation
			-- specific.
		require valid_string: a_connection_string/=Void
		deferred 
		end
	
	close is
		deferred 
		end

	is_connected: BOOLEAN is 
		deferred 
		end

	execute (some_sql: STRING) is
			-- execute `some_sql'. If it contains one or more queries 
			-- `result_set' will contain the result of the queries.
		require sql_not_void: some_sql /= Void
		deferred
		end

	result_set: RESULT_SET [RESULT_ROW] is
			-- Results of the last `execute' command.
		deferred
		end

	prepare_command (some_sql: STRING): PREPARED_COMMAND is
			-- Prepare a new statement from `some_sql'. 
		require sql_not_void: some_sql /= Void
		deferred
		end

	prepare_query (some_sql: STRING): PREPARED_QUERY is
			-- Prepare a new statement from `some_sql'. 
		require sql_not_void: some_sql /= Void
		deferred
		end

	cursor: CURSOR is
			-- Get a new cursor
		obsolete "Shall be removed soon"
		deferred 
		end
end
