class HISTORY_ENTRY
	-- An entry of the history of read line library.

inherit 
	C_STRUCT
	C_OWNED

insert
	HIST_ENTRY_STRUCT

creation {READ_LINE_HISTORY} from_external_pointer
end
