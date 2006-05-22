indexing
	description: "Result set of an SQL query from an SQLite database."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_RESULT_SET
inherit 	RESULT_SET [SQLITE_RESULT_ROW]
		-- inheriting Implementation
creation make
end
