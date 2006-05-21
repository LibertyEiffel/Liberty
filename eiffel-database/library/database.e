indexing
	description: "Relational database."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class DATABASE
feature 
	connect (a_connection_string: STRING) is
		require valid_string: a_connection_string/=Void
		deferred 
		end
	
	close is
		deferred 
		end

	is_connected: BOOLEAN is 
		deferred 
		end

	cursor: CURSOR is
		-- Get a new cursor
		deferred 
		end
end
