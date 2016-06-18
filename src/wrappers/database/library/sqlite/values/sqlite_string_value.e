class SQLITE_STRING_VALUE
	-- A text value stored in a SQLite database. 

inherit 
	SQLITE_VALUE undefine out end
	TYPED_VARIANT[STRING]

create {ANY} set_item 
create {SQLITE_DATABASE, SQLITE_PREPARED_QUERY} from_external_copy

feature {SQLITE_DATABASE}
    from_external_copy (a_pointer: POINTER) 
        require
            a_pointer /= default_pointer
        do
            set_item(create {STRING}.from_external_copy(a_pointer))
        end

feature {SQLITE_PREPARED_STATEMENT} 
	bind_in (a_statement: SQLITE_PREPARED_STATEMENT; an_index: INTEGER)
		local res: INTEGER
		do
			res := sqlite3_bind_text (a_statement.handle, 
				an_index, 
				item.to_external, -- pointer to text memory area
				item.count, -- the OFFSET of the null (0) terminator. As STRING.lower is 1 count equals the offset of the terminator. This may (read: WILL) change when dealing with other kinds of generic strings
				sqlite_transient -- pointer to the C function used as destructor of the memory area
				)
		end
		 
feature {ANY}
	type: INTEGER
		do
			Result := sqlite_text
		end
end

-- Copyright: "(C) 2014 Paolo Redaelli "
-- License: "LGPL v2 or later"


