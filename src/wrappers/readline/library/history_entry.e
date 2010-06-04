class HISTORY_ENTRY
	-- An entry of the history of read line library.

inherit 
	C_STRUCT
	C_OWNED

insert
	HIST_ENTRY_STRUCT

creation {READ_LINE_HISTORY} from_external_pointer
feature 
	line: FIXED_STRING is
		do
			create Result.from_external(hist_entry_struct_get_line(handle))
		ensure not_void: Result/=Void
		end

	timestamp: STRING is
		local p: POINTER
		do
			p := hist_entry_struct_get_timestamp(handle)
			if p.is_not_null then
				create Result.from_external(p)
			end
		end
end
