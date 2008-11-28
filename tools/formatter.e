class FORMATTER
	-- A formatter for STRING messages.
	
	-- A utility class useful as a singleton. Typical usage is:
	
	-- formatter.reset
	-- formatter.put_message(a_string, some_arguments)
	-- print(formatter.out)

inherit STRING_FORMATTER redefine default_create, out end

creation {ANY} default_create 

feature	
	reset is do buffer.clear_count end
	out: STRING is do create Result.copy(buffer) end

feature {}
	default_create is do create buffer.make_empty end
	put (c: CHARACTER) is do buffer.append_character(c) end
	put_item (item: ANY) is do buffer.append (item.out) end
feature {}
	buffer: STRING

end -- class FORMATTER

