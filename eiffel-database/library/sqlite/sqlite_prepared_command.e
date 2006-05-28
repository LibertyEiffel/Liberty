indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_PREPARED_COMMAND
inherit
	PREPARED_COMMAND
	SQLITE_PREPARED_STATEMENT

creation make
	
feature
	execute (some_parameters: TRAVERSABLE[ANY]) is
			-- Execute the current query with `some_parameters'
		local 
			i, -- the parameters index, 
			query_index: INTEGER 
		do
			debug print ("SQLITE_PREPARED_COMMAND.execute rescode:"+res_code.out+"%N") end
			res_code := sqlite3_reset (handle)
			from i:=some_parameters.lower; query_index:=1 
			until i > some_parameters.upper
			loop
				bind_parameter (some_parameters.item(i),query_index)
				i := i+1; query_index := query_index + 1
			end
			res_code:=sqlite3_step (handle)
			inspect res_code
			when sqlite_busy then
				debug print ("SQlite busy%N") end
			when sqlite_done then
				debug print ("SQlite done%N") end
			when sqlite_row then
				debug print ("SQlite row%N") end
			when sqlite_error then
				debug print ("SQlite error%N") end
			when sqlite_misuse then
				debug print ("SQlite misuse%N") end
			end
		end
end
