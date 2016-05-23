note
	description: "A command that has no result."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Note: this is pratically empty by design because in the Eiffel 
			-- world commands can be issued and the program can continue 
			-- while a query has to wait for its result to be ready.

deferred class PREPARED_COMMAND

inherit
	PREPARED_STATEMENT

feature {ANY}
	last_affected_rows: INTEGER is
		-- require success: last_exec_success
		deferred
		-- ensure meningful: Result >= 0
		end
end
