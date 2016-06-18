note
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PREPARED_QUERY

inherit
	PREPARED_STATEMENT

feature {ANY}
	last_result: RESULT_SET[RESULT_ROW]
			-- The results of the current query
		require
			success: last_exec_success
		attribute
		ensure
			Result /= Void
		end
end
