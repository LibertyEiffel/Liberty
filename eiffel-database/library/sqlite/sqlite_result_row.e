indexing
	description: "A tuple from an SQLite query."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_RESULT_ROW

inherit 
	RESULT_ROW
		undefine
			fill_tagged_out_memory
		end

	FAST_ARRAY [ANY]
		undefine
			copy,
			is_equal
		end

creation make

feature -- Type queries
	is_integer (a_column: INTEGER): BOOLEAN is
		do
			Result := ( {REFERENCE[INTEGER]} ?:= item(a_column) )
		end

	is_real (a_column: INTEGER): BOOLEAN is
		do
			Result := False
		end
	
	is_string (a_column: INTEGER): BOOLEAN is
		do
			Result := ( {STRING} ?:= item(a_column) )
		end
	
	is_boolean (a_column: INTEGER): BOOLEAN is
		do
			Result := False
		end

feature -- Column queries 
	integer_item (a_column: INTEGER): INTEGER is
		local
			ri: REFERENCE[INTEGER]
		do
			ri ::= item(a_column)
				check
					ri /= Void
				end
			Result := ri.item
		end

	real_item (a_column: INTEGER): REAL is
		local
			ri: REFERENCE[REAL]
		do
			ri ::= item(a_column)
				check
					ri /= Void
				end
			Result := ri.item
		end

	string_item (a_column: INTEGER): STRING is
		do
			Result ::= item(a_column)
			-- ensure result_not_void: Result /= Void
		end

	boolean_item (a_column: INTEGER): BOOLEAN is
		local
			ri: REFERENCE[INTEGER]
		do
			debug 
				raise("SQLITE_RESULT_ROW boolean value encountered. SQLite does *NOT* have boolean values!")
			end
			ri ::= item(a_column)
				check
					ri /= Void
				end
			Result := ri.item.to_boolean
		end
end
