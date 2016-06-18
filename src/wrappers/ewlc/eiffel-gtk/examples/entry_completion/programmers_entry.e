note
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class PROGRAMMERS_ENTRY
inherit GTK_COMBO_BOX_ENTRY redefine make end 
insert G_TYPES
	-- TODO: This insertion is necessary when creating the programmers,
	-- since it requires explicit reference to g_type_*; it's ugly, or
	-- better it feels mostly unEiffelish to me. Paolo 2006-05-30
	
create {ANY} make

feature {ANY} 
	make
		do
			with_model (programmers, name_column_n)
			create completion.make 
			completion.set_model (programmers)
			completion.set_text_column (name_column_n)
			completion.set_inline_completion(True)
			entry.set_completion (completion)
		end

feature {ANY} -- Programmers' model columns
	name_column_n: INTEGER is 0
	proficiency_column_n: INTEGER is 1
	columns_n: INTEGER is 2

feature  {} -- Implementation
	completion: GTK_ENTRY_COMPLETION

	programmers_array: FAST_ARRAY[TUPLE[STRING,INTEGER]]
			-- Programmers name and Eiffelliness level
		do
			Result:= ( { FAST_ARRAY[TUPLE[STRING,INTEGER]]
							 << [ "Jose Bollo", {INTEGER_32 95} ],
								 [ "Oliver Elphick", {INTEGER_32 95} ],
								 [ "Raphael Mack", {INTEGER_32 95} ],
								 [ "Paolo Redaelli", {INTEGER_32 12} ],
								 [ "Dominique Colnet", {INTEGER_32 100} ] >> } )
		end
							  
	
	programmers: GTK_LIST_STORE
			-- tree model with some data set
		local iter: GTK_TREE_ITER; i:INTEGER
		once 
			create Result.make (<<g_type_string, g_type_uint>>)
			-- TODO: change design to remove explicit reference to g_type_*; it's
			-- ugly, or better it feels mostly unEiffelish to me. Paolo 2006-05-28
			
			-- Append three rows and fill in some data
			create iter.make_from_model (Result)
			iter.start

			from i:=programmers_array.lower until i>=programmers_array.upper
			loop
				Result.append (iter)
				Result.set_string (iter, name_column_n, programmers_array.item(i).item_1)
				Result.set_natural (iter, proficiency_column_n, programmers_array.item(i).item_2)
				i:=i+1
			end
		end

end
